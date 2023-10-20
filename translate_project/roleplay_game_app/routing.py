from django.urls import path
from . import consumers

websocket_urlpatterns = [
    path("ws/roleplay/<int:room_pk>/", consumers.RolePlayingRoomConsumer.as_asgi()),
]