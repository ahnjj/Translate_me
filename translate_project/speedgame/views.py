from django.shortcuts import render


def index(request):
    return render(request, "speedgame/index.html")


def room(request, room_name):
    return render(request, "speedgame/room.html", {"room_name": room_name})
