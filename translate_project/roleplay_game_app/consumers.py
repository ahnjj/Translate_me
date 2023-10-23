# chat/consumers.py
import openai
from typing import List

from channels.generic.websocket import JsonWebsocketConsumer
from django.contrib.auth.models import AbstractUser

from .models import RolePlayingRoom, GptMessage

class RolePlayingRoomConsumer(JsonWebsocketConsumer):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.gpt_messages: List[GptMessage] = []
        self.recommend_message = ""  # 추천 메세지

    # 웹소켓 연결 요청을 받으면 호출됨
    def connect(self):
        room = self.get_room()
        if room is None:
            self.close()
        else:
            self.accept()

            self.gpt_messages = room.get_initial_messages()   # 첫 메세지
            self.recommend_message = room.get_recommend_message() # 추천 메세지

            # 🔥기존 self.gpt_messages 기반으로 GPT API 호출
            # gpt api 호출 응답을 웹클라이언트에게 전달.
            # openai api 호출 시에 예외가 발생하면 type=openai-error 응답을 주도록 함.
            try:
                assistant_message = self.gpt_query()
            except openai.error.OpenAIError as e:
                self.send_json({
                    "type": "openai-error",
                    "message": str(e),
                })
            else:
                self.send_json({
                    "type": "assistant-message",
                    "message": assistant_message,
                })

     # 채팅방 조회       
    def get_room(self) -> RolePlayingRoom | None:
        user: AbstractUser = self.scope["user"]
        room_pk = self.scope["url_route"]["kwargs"]["room_pk"]
        room: RolePlayingRoom = None

        if user.is_authenticated:
            try:
                room = RolePlayingRoom.objects.get(pk=room_pk, user=user)
            except RolePlayingRoom.DoesNotExist:
                pass

        return room
    
    def gpt_query(self, command_query: str = None, user_query: str = None) -> str:
        if command_query is not None and user_query is not None:
            raise ValueError("command_query 인자와 user_query 인자는 동시에 사용할 수 없습니다.")
        elif command_query is not None:
            self.gpt_messages.append(GptMessage(role="user", content=command_query))
        elif user_query is not None:
            self.gpt_messages.append(GptMessage(role="user", content=user_query))
    
        print("api_key :", openai.api_key)
        response_dict = openai.ChatCompletion.create(
            model="gpt-3.5-turbo",
            messages=self.gpt_messages,
            temperature=1,  # 디폴트 값: 1 높을수록 그때 그때 대답이 다름
        )
        response_role = response_dict["choices"][0]["message"]["role"]
        response_content = response_dict["choices"][0]["message"]["content"]
    
        # command_query 수행 시에는 응답을 self.gpt_messages에 추가안함. 그 외에는 채팅 내역으로서 추가.
        if command_query is None:
            gpt_message = GptMessage(role=response_role, content=response_content)
            self.gpt_messages.append(gpt_message)
    
        # GPT API의 content 응답을 반환. (assistant role)
        return response_content
    
     # 웹소켓 유저로부터 메시지를 받으면 receive_json 메서드가 호출됨
    def receive_json(self, content_dict, **kwargs):
        if content_dict["type"] == "user-message":
            assistant_message = self.gpt_query(user_query=content_dict["message"])
            self.send_json({
                "type": "assistant-message",
                "message": assistant_message,
            })
        # 추천요청 처리(서버)
        elif content_dict['type'] == 'request-recommend-message':
            recommended_message = self.gpt_query(command_query=self.recommend_message)
            self.send_json({
                "type":"recommended-message",
                "message":recommended_message,
            })
        else:
            self.send_json({
                "type": "error",
                "message": f"Invalid type: {content_dict['type']}",
            })