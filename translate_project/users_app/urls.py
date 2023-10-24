from django.urls import path, re_path
from . import views
from django_pydenticon.views import image as pydenticon_image


urlpatterns = [
    path('login/', views.login, name='login'),
    path('logout/', views.logout, name='logout'),
    path("signup/", views.signup, name='signup'),
    path("edit/", views.profile_edit, name='profile_edit'),
    re_path(r'^(?P<username>[\w.@+-]+)/$', views.user_page, name='user_page'),# 유저 페이지
    path('identicon/image/<path:data>', pydenticon_image, name = 'pydenticon_image'),
]