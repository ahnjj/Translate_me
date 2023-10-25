"""
ASGI config for translate_project project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/howto/deployment/asgi/
"""
# asgi.py
import os
from channels.auth import AuthMiddlewareStack

from channels.routing import ProtocolTypeRouter, URLRouter
from django.core.asgi import get_asgi_application



os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'translate_project.settings')
django_asgi_app = get_asgi_application() # 장고 프로젝트 초기화
import roleplay_game_app.routing # 임포트 여기다가 해야한다.

# game : 장고 채널스이용 용 
# application = get_asgi_application()

application = ProtocolTypeRouter({
    "http": django_asgi_app,
    "websocket": AuthMiddlewareStack(URLRouter(
        roleplay_game_app.routing.websocket_urlpatterns
    )),
})

django_asgi_app2 = get_asgi_application()

import speedgame.routing

application2 = ProtocolTypeRouter(
    {
        'http': django_asgi_app2,
        'websocket': URLRouter(
            speedgame.routing.websocket_urlpatterns
        ),
    }
)
