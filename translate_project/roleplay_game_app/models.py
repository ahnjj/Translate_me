from django.db import models
from django.conf import settings
from django.core.validators import MinLengthValidator
from django.db import models
from django.urls import reverse
from typing import TypedDict, Literal, List

from users_app.models import User

class GptMessage(TypedDict):
    role: Literal["system", "user", "assistant"]
    content: str



class RolePlayingRoom(models.Model):
    class Language(models.TextChoices): # 지원하는 언어들
        ENGLISH = "en-US", "English"
        JAPANESE = "ja-JP", "Japanese"
        CHINESE = "zh-CN", "Chinese"
    
    class Level(models.IntegerChoices):
        BEGINNER = 1, '초급'
        ADVANCED = 2, '고급'

    class Meta:
        ordering = ['-pk']

    user = models.ForeignKey(User, models.DO_NOTHING, blank=True, null=True)
    language = models.CharField(
        max_length=10, choices=Language.choices, default=Language.ENGLISH, verbose_name="대화 언어"
        )
    level = models.SmallIntegerField(
        choices=Level.choices, default=Level.BEGINNER, verbose_name="레벨"
    )
    situation = models.CharField(
        max_length=100,
        validators=[MinLengthValidator(3)], verbose_name="상황"
    )
    situation_en = models.CharField(
        max_length=100, blank=True, verbose_name="상황(영문)",
        help_text="여기에 입력하신 대로 도우미에게 상황극 설정을 전달합니다. 비워두시면 자동으로 번역되니 걱정마세요!"
    )
    my_role = models.CharField(max_length=100, verbose_name="내 역할")
    my_role_en = models.CharField(
        max_length=100, blank=True, verbose_name="내 역할(영문)",
        help_text="여기에 입력하신 대로 도우미에게 여러분의 역할을 알려줍니다. 비워두시면 자동으로 번역되니 걱정마세요!"
    )
    helper_role = models.CharField(max_length=100, verbose_name="도우미 역할(영문)")
    helper_role_en = models.CharField(
        max_length=100, blank=True, verbose_name="도우미 역할(영문)",
        help_text="여기에 입력하신 대로 도우미에게 도우미의 역할을 알려줍니다. 비워두시면 자동으로 번역되니 걱정마세요!"
    )

    # 개별 상황극 상세 조회
    # 각 모델 데이터 url (해당 상황극의 pk넘겨주기)
    def get_absolute_url(self)->str:
        return reverse("role_playing_room_detail", kwargs={"pk": self.pk})
    
    # 채팅방 첫 gpt응답 받기
    def get_initial_messages(self) -> List[GptMessage]:
        gpt_name = "RolePlayingBot"
        language = self.get_language_display() # self.language 해야하나..?
        situation_en = self.situation_en
        my_role_en = self.my_role_en
        helper_role_en = self.helper_role_en

        # level 에 맞게 프롬프트 문자열 만들기
        if self.level == self.Level.BEGINNER:
            level_string = f"a beginner in {language}"
            level_word = "simple"
        elif self.level == self.Level.ADVANCED:
            level_string = f"an advanced learner in {language}"
            level_word = "advanced"
        else:
            raise ValueError(f"Invalid level : {self.level}")
        
        # API에 넘겨줄 프롬프트
        # 시스템
        system_message = (
            f"You are helpful assistant supporting people learning {language}. "
            f"Your name is {gpt_name}. "
            f"Please assume that the user you are assisting is {level_string}. "
            f"And please write only the sentence without the character role."
            f"And if user's answer has a grammatical error, please fix it."
            f"When you fix grammar errors, starts with this expression [문법 교정] "
        )
        # 유저
        user_message = (
            f"Let's have a conversation in {language}. "
            f"Please answer in {language} only "
            f"without providing a translation. "
            f"And please don't write down the pronunciation either. "
            f"Let us assume that the situation in '{situation_en}'. "
            f"I am {my_role_en}. The character I want you to act as is {helper_role_en}. "
            f"Please make sure that I'm {level_string}, so please use {level_word} words "
            f"as much as possible. Now, start a conversation with the first sentence!"
        )
        # api에게 넘겨주기
        return [
            GptMessage(role="system", content=system_message),
            GptMessage(role="user", content=user_message),
        ]
    
    # 추천 대화 메세지 받을 프롬프트 만들기
    def get_recommend_message(self) -> str:
        if self.level == self.Level.BEGINNER:
            level_word = "simple"
        elif self.level == self.Level.ADVANCED:
            level_word = "advanced"
        else:
            raise ValueError(f"Invalid level : {self.level}")
        # 너무 장황하게 앞뒤 설명을 해서 그건 빼달라고 해야한다.
        return (
            f"Can you please provide me an {level_word} example of"
            f"how to respond to the last sentence in this situation,"
            f"without providing a translation and any introductory"
            f"phrases or sentences."
        )

    


    
