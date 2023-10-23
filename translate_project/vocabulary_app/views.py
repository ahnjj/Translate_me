from django.shortcuts import render
from django.shortcuts import get_object_or_404, redirect, render
from .models import *
from vocabulary_app.forms import Vocabulary_Form
from django.http import HttpResponse, JsonResponse, QueryDict
from datetime import date
import pandas as pd
from django.core.paginator import Paginator

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
            id = Users_app_user.objects.get(id = user.id)
            voca.id = id
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


def vocabulary_update(request, vocabulary_id):
    
    vocabulary = get_object_or_404(Vocabulary, vocabulary_id=vocabulary_id)

    if request.method == "POST":
        form = Vocabulary_Form(request.POST, instance=vocabulary)
        
        if form.is_valid():
            voca = form.save(commit=False)

            voca.save()

            return redirect('vocabulary_list')
    
    else:
        form = Vocabulary_Form(instance=vocabulary)
    
    return render(request, 'vocabulary_app/vocabulary_update.html', {'form':form})

def upload_excel(request):
    if request.method == 'POST':
        file = request.FILES['excel_file']
        if file.name.endswith('.xlsx'):
            # 엑셀 파일을 데이터프레임으로 읽어옴
            df = pd.read_excel(file, engine='openpyxl')

            for _, row in df.iterrows():
                # 언어명으로 된거를 코드로 바꿔야함
                lang_name = row['language_name'].lower()
                # language_instance = Language_code.objects.all().get(language_name)
                lang_id = Language_code.objects.get(language_name=lang_name)
                # if language_instance:

                current_date = date.today()

                user = request.user

                Vocabulary.objects.create(
                    
                    vocabulary_name=row['vocabulary_name'],
                    vocabulary_meaning=row['vocabulary_meaning'],
                    vocabulary_level=row['vocabulary_level'],
                    language_id=lang_id,
                    train_yn = False,
                    reg_date = current_date.strftime("%Y-%m-%d"),
                    id = user.id
                )

            return redirect('vocabulary_list')
        else:
            error_message = '올바른 엑셀 파일 형식이 아닙니다.'
            return render(request, 'vocabulary_app/upload_excel.html', {'error_message': error_message})


    return render(request, 'vocabulary_app/upload_excel.html')

# Create your views here.
def vocabulary_list(request):
    # 전체 데이터 셀렉트
    words = Vocabulary.objects.all()
    user = request.user
    # select from vocabulary where id=$user.id and train='false'
    words = Vocabulary.objects.filter(id=user.id, train_yn=False)

    items_per_page = 20  # 예: 10개씩 보여주기

    # Paginator 객체를 생성합니다.
    paginator = Paginator(words, items_per_page)

    # 요청된 페이지 번호를 가져옵니다.
    page_number = request.GET.get('page')

    # 해당 페이지의 단어 목록을 가져옵니다.
    words = paginator.get_page(page_number)

    return render(request, 'vocabulary_app/vocabulary_list.html', {'words': words})


def vocabulary_insert_from_search(request):
    if request.method == "POST" and request.user.is_authenticated:
        try:
            request.POST["is_from_search"]
        except:
            vocabulary_insert(request)
        else:
            if request.POST["lang"] == "kor":
                language_id = 1
            elif request.POST["lang"] == "eng":
                language_id = 2
            elif request.POST["lang"] == "jp":
                language_id = 3
            elif request.POST["lang"] == "ch":
                language_id = 4
            else:
                pass
            if request.POST["query_lang"] == "kor":
                vocabulary_name = request.POST["word"]
                vocabulary_meaning = request.POST["query"]
            else:
                vocabulary_name = request.POST["query"]
                vocabulary_meaning = request.POST["word"]
            qd = QueryDict('', mutable=True)
            qd.update({"vocabulary_name": vocabulary_name, "vocabulary_meaning": vocabulary_meaning, "vocabulary_level": None, "language_id": language_id})
            form = Vocabulary_Form(qd)
            return render(request, 'vocabulary_app/vocabulary_form.html', {'form': form})
    else:
        return redirect("http://127.0.0.1:8000/accounts/login/")