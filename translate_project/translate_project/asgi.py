"""
ASGI config for translate_project project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/howto/deployment/asgi/
"""

import os
from channels.auth import AuthMiddlewareStack
from channels.routing import ProtocolTypeRouter, URLRouter
from django.core.asgi import get_asgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'translate_project.settings')
django_asgi_app = get_asgi_application()


# game : 장고 채널스이용 용 
# application = get_asgi_application()
import roleplay_game_app.routing


application = ProtocolTypeRouter({
    "http": django_asgi_app,
    "websocket": AuthMiddlewareStack(URLRouter(
        roleplay_game_app.routing.websocket_urlpatterns
    )),
})