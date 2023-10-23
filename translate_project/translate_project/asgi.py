"""
ASGI config for translate_project project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/howto/deployment/asgi/
"""
# asgi.py
import os

from channels.routing import ProtocolTypeRouter, URLRouter
from django.core.asgi import get_asgi_application
import speedgame.routing

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'translate_project.settings')

django_asgi_app = get_asgi_application()

application = ProtocolTypeRouter(
    {
        'http': django_asgi_app,
        'websocket': URLRouter(
            speedgame.routing.websocket_urlpatterns
        ),
    }
)