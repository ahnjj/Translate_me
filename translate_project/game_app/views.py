from django.shortcuts import render
from .models import Gamevocab

def drag_drop(request,lang, stage):  # pk : 언어, stage:스테이지
    try:
        vocabs = Gamevocab.objects.filter(language_id = lang, game_stage = stage)  #  영어
    except:
        vocabs = None
    return render(request,'game_app/drag_drop.html',{'vocabs':vocabs})