"""
URL configuration for translate_project project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls.static import static
from django.conf import settings
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path("speedgame/", include("speedgame.urls")),
    path('admin/', admin.site.urls),
    path('accounts/',include('users_app.urls')),
    path('',include('translate_app.urls')),
    path('',include('vocabulary_app.urls')),
    path('',include('board_app.urls')),   
    path('roleplay/',include('roleplay_game_app.urls')),   
]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


# 미디어 파일 경로
# 유저 프로필 사진 용
# debug모드일때
# if settings.DEBUG: 
#     urlpatterns += static(settings.MEDIA_URL, 
#                     document_root=settings.MEDIA_ROOT)