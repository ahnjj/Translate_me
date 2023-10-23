from django.urls import path
from . import views
from .views import RolePlayingRoomCreateView, RolePlayingRoomDeleteView, RolePlayingRoomDetailView, RolePlayingRoomListView, RolePlayingRoomUpdateView

urlpatterns = [
    path("", RolePlayingRoomListView.as_view(), name="role_playing_room_list"),
    path("<int:pk>/", RolePlayingRoomDetailView.as_view(), name="role_playing_room_detail"),
    path('new/', RolePlayingRoomCreateView.as_view(), name="role_playing_room_new"),
    path("<int:pk>/edit/", RolePlayingRoomUpdateView.as_view(), name="role_playing_room_edit"),
    path("<int:pk>/delete/", RolePlayingRoomDeleteView.as_view(), name="role_playing_room_delete"), 
]