from django.shortcuts import render
from django.shortcuts import get_object_or_404, redirect, render
from .models import *
from vocabulary_app.forms import Vocabulary_Form
from django.contrib.auth import get_user_model
from django.http import JsonResponse
from datetime import date

# Create your views here.
def vocabulary_list(request):
    # 전체 데이터 셀렉트
    words = Vocabulary.objects.all()
    user = request.user
    print(user.id)
    # select from vocabulary where id=$user.id and train='false'
    words = Vocabulary.objects.filter(id=user.id, train_yn=False)

    return render(request, 'vocabulary_app/vocabulary_list.html', {'words':words})

def vocabulary_insert(request):
    # 요청이 포스트인지 확인하고

    if request.method == "POST":
        # 폼 데이터의 내용을 변수에 저장
        form = Vocabulary_Form(request.POST)
        # is_valid() 사용해서 데이터 유효성 확인
        if form.is_valid():
            voca = form.save(commit=False)

            current_date = date.today()

            user = request.user
            voca.train_yn = False
            voca.id = user.id
            voca.reg_date = current_date.strftime("%Y-%m-%d")

            voca.save()

            # redirect 사용
            return redirect('vocabulary_list')
    else:
        form = Vocabulary_Form()
    
    return render(request, 'vocabulary_app/vocabulary_form.html', {'form':form})

def vocabulary_delete(request, vocabulary_id):
    voca = get_object_or_404(Vocabulary, pk=vocabulary_id)

    voca.delete()

    return redirect('vocabulary_list')


def vocabulary_train(request, vocabulary_id):
    try:
        voca = get_object_or_404(Vocabulary, vocabulary_id=vocabulary_id)

        voca.train_yn = True

        voca.save()

        return redirect('vocabulary_list')
    
    except Vocabulary.DoesNotExist:
        return redirect('vocabulary_list')
    except Exception as e:
        return redirect('vocabulary_list')


