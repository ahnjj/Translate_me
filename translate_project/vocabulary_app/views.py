from django.shortcuts import render
from django.shortcuts import get_object_or_404, redirect, render
from .models import *
from vocabulary_app.forms import Vocabulary_Form
from django.http import HttpResponse, JsonResponse, QueryDict
from datetime import date, timedelta
from datetime import datetime
import pandas as pd
from django.core.paginator import Paginator
import random
import json
from urllib.parse import parse_qs

def vocabulary_list(request):
    # 전체 데이터 셀렉트
    words = Vocabulary.objects.all()
    user = request.user
    # select from vocabulary where id=$user.id and train='false'
    words = Vocabulary.objects.filter(id=user.id, train_yn=False)

    # 페이지당 보여줄 데이터 개수
    items_per_page = 20

    # Paginator 객체를 생성
    paginator = Paginator(words, items_per_page)

    # 요청된 페이지 번호 
    page_number = request.GET.get('page')
    if page_number is None:
        page_number = 1

    # 요청된 페이지의 단어 목록
    words = paginator.get_page(page_number)
    
    pag = words.paginator.get_elided_page_range(page_number, on_each_side=2, on_ends=2)

    return render(request, 'vocabulary_app/vocabulary_list.html', {'words': words, 'pag': pag})

def result_list_week(request):

    user = request.user

    current_date = datetime.now()

    one_week_ago = current_date - timedelta(days=7)

    results = User_test_result.objects.filter(id=user.id, test_date__gte=one_week_ago, test_date__lte=current_date)

    scores = [result.user_score for result in results]
    if scores:
        average_score = sum(scores) / len(scores)
    else:
        average_score = 0  # 결과가 없을 경우 평균을 0으로 설정

    context = {
        'result': list(results),
        'average_score': average_score,  # 평균 점수를 템플릿에 전달
    }

    return render(request, 'vocabulary_app/result_list_week.html', context)

def result_list(request):
    user = request.user
    results = User_test_result.objects.filter(id=user.id)

    scores = [result.user_score for result in results]
    if scores:
        average_score = sum(scores) / len(scores)
    else:
        average_score = 0  # 결과가 없을 경우 평균을 0으로 설정

    context = {
        'result': results,
        'average_score': average_score,  # 평균 점수를 템플릿에 전달
    }

    return render(request, 'vocabulary_app/result_list.html', context)

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
            # users_app_user 참조해서 해당 객체로 생성 필요
            id = Users_app_user.objects.get(id = user.id)
            voca.id = id

            # 여기서는 따로 시간까지 저장할필요없으므로 date타입
            voca.reg_date = current_date.strftime("%Y-%m-%d")

            voca.save()

            # redirect 사용
            return redirect('vocabulary_list')
    else:
        form = Vocabulary_Form()
    
    return render(request, 'vocabulary_app/vocabulary_form.html', {'form':form})

def vocabulary_delete(request, vocabulary_id):

    voca = get_object_or_404(Vocabulary, pk=vocabulary_id)

    # 삭제할지 confirm은 페이지에서 확인
    voca.delete()

    return redirect('vocabulary_list')

# 단어 학습완료 클릭시 
# vocabulary_id로 row 찾아서 train_yn값 업데이트
def vocabulary_train(request, vocabulary_id):
    try:
        voca = get_object_or_404(Vocabulary, vocabulary_id=vocabulary_id)

        print(voca.train_yn)

        if voca.train_yn == False:
            voca.train_yn = True
        else:
            voca.train_yn = False

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
                # Language_code 참조하기 때문에 language_code object로 넣지 않으면 오류
                lang_id = Language_code.objects.get(language_name=lang_name)

                current_date = date.today()

                user = request.user
                userid = Users_app_user.objects.get(id = user.id)

                # 한줄에 하나씩 데이터 만들기
                Vocabulary.objects.create(
                    
                    vocabulary_name=row['vocabulary_name'],
                    vocabulary_meaning=row['vocabulary_meaning'],
                    vocabulary_level=row['vocabulary_level'],
                    language_id=lang_id,
                    train_yn = False,
                    reg_date = current_date.strftime("%Y-%m-%d"),
                    id = userid
                )

            return redirect('vocabulary_list')
        else:
            error_message = '올바른 엑셀 파일 형식이 아닙니다.'
            return render(request, 'vocabulary_app/upload_excel.html', {'error_message': error_message})


    return render(request, 'vocabulary_app/upload_excel.html')


def download_excel(request):
    # 데이터를 가져오는 부분을 수정하여 필요한 데이터를 추출
    # 예를 들어, 모든 단어 데이터를 가져오는 경우:
    user = request.user
    words = Vocabulary.objects.filter(id=user.id, train_yn=False)
    i = 0
    # 데이터를 DataFrame으로 변환
    data = {
        '단어': [word.vocabulary_name for word in words],
        '뜻': [word.vocabulary_meaning for word in words],
        '언어': [word.language_id for word in words],
    }
    df = pd.DataFrame(data)

    df.insert(0, 'No', range(1, len(df) + 1))  # 1부터 데이터 개수까지 넘버링    

    # 데이터프레임을 엑셀 파일로 변환합니다.
    response = HttpResponse(content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
    response['Content-Disposition'] = 'attachment; filename=word.xlsx'
    df.to_excel(response, index=False, engine='openpyxl')
    
    return response

# 단어테스트 함수
def vocabulary_test(request):
    # ajax요청인지 확인
    # django 3까진 is_ajax()썼는데 지금 버전에서는 못쓴다함
    if request.method == 'POST' and request.headers.get('x-requested-with') == 'XMLHttpRequest':

        try:
            # 가져온 데이터 처리해서 가공
            request_body = request.body.decode('utf-8')
            parsed_data = parse_qs(request_body)

            answer_data = []
            for key, val in parsed_data.items():
                parts = key.split('[')
                index = int(parts[1].split(']')[0])
                field = parts[2].rstrip(']')
                val = val[0] if val else ''  # 값이 없을 경우 빈 문자열로 처리
                if index >= len(answer_data):
                    answer_data.append({})
                answer_data[index][field] = val

            # 각 답 match율 저장
            response_data = {}
            idx = 0
            cnt_correct = 0

            for idx, i in enumerate(answer_data):
                answers = Vocabulary.objects.filter(vocabulary_id=i.get('id'))
                answer = answers[0].vocabulary_meaning
                if ',' in answer :
                    arr = answer.split(',')
                    for s in arr:
                        if s.strip() == i.get('answer'):
                            cnt_correct+=1
                            response_data[f'result_{idx}'] = '정답'
                            for idx, ans in enumerate(answers):
                                if idx == 0:
                                    ans.vocabulary_level-=1
                                    ans.save()
                            break
                        else:
                            response_data[f'result_{idx}'] = '오답'
                else :
                    if answer == i.get('answer'):
                        cnt_correct+=1
                        response_data[f'result_{idx}'] = '정답'
                        for idx, ans in enumerate(answers):
                                if idx == 0:
                                    ans.vocabulary_level-=1
                                    ans.save()
                    else :
                        response_data[f'result_{idx}'] = '오답'

            # print('정답 맞춘 비욜',cnt_correct,'/',len(response_data))

            # 테스트결과 db 저장 
            user = request.user
            userid = Users_app_user.objects.get(id = user.id)

            User_test_result.objects.create(
                id = userid,
                user_score = cnt_correct/len(response_data) * 100,
                user_test = str(cnt_correct)+'/'+str(len(response_data)),
                test_date = datetime.now()
            )

            response_data['result'] = str(cnt_correct)+'/'+str(len(response_data))     

            return JsonResponse(response_data)

        except json.JSONDecodeError as e:
            print("JSON 디코드 오류:", str(e))

        response_data = {'result': '없음'}
        return JsonResponse(response_data)

    # GET 요청일 때는 랜덤 단어 10개를 추가하고 문제
    else:

        user = request.user

        # select from vocabulary where id=$user.id and train='True'
        words = Vocabulary.objects.filter(id=user.id, train_yn=True)

        try:
            if len(words) >= 10:
                # 학습 완료한 단어들중 10개만 랜덤으로 추출
                random_words = random.sample(list(words), 10)   
            else:
                # 10개 안되면 있는거 다
                random_words = random.sample(list(words), len(words))


            return render(request, 'vocabulary_app/vocabulary_test.html', {'words': random_words})
        except:

            return render(request, 'vocabulary_app/vocabulary_test.html')


def vocabulary_insert_from_search(request):
    if request.method == "POST" and request.user.is_authenticated:
        try:
            request.POST["is_from_search"]
        except:
            return vocabulary_insert(request)
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
            qd.update({"vocabulary_name": vocabulary_name, "vocabulary_meaning": vocabulary_meaning, "vocabulary_level": 3, "language_id": language_id})
            form = Vocabulary_Form(qd)
            return render(request, 'vocabulary_app/vocabulary_form.html', {'form': form, "is_from_search": "y"})
    else:
        return redirect("http://127.0.0.1:8000/accounts/login/")
