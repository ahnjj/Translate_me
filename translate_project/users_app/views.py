from django.contrib import messages
from django.contrib.auth import login as auth_login
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import LoginView, logout_then_login
from django.shortcuts import redirect, render, get_object_or_404
from .forms import SignupForm, ProfileForm
from django.contrib.auth import get_user_model # 프로필
import datetime # 날짜
from vocabulary_app.models import User_test_result # 점수 표시
# from pytz import timezone
# from django.utils import timezone

# 로그인뷰
login = LoginView.as_view(template_name='users_app/login_form.html') # 기본 장고 로그인 뷰 사용

# 로그아웃뷰
def logout(request):
    messages.success(request, '로그아웃되었습니다.')
    return  logout_then_login(request)   # logout한 다음 바로 login페이지로 넘기기

# 회원가입뷰
def signup(request):
    if request.method == "POST":
        form = SignupForm(request.POST)
        if form.is_valid():
            user = form.save()
            auth_login(request, user)
            messages.success(request, '회원가입 환영합니다.')
            next_url = request.GET.get('next','/')
            return redirect(next_url)
    else:
        form = SignupForm()
    return render(request, 'users_app/signup_form.html', {'form':form})

# 프로필 수정 뷰
@login_required
def profile_edit(request):
    if request.method == "POST":
        form = ProfileForm(request.POST, request.FILES, instance=request.user)
        if form.is_valid():
            form.save()
            messages.success(request, '프로필을 수정/저장했습니다.')
            return redirect('profile_edit')
            # return redirect('user_page')
    else:
        form = ProfileForm(instance=request.user)
    return render(request, "users_app/profile_edit_form.html", {'form':form})

# 프로필 뷰
def user_page(request, username):

    # 프로필 기본정보
    page_user = get_object_or_404(get_user_model(), username=username, is_active=True)
    # 레벨 및 평균 점수
    results = User_test_result.objects.filter(id=page_user.id).order_by('test_date')

    # 평균 점수
    scores = [result.user_score for result in results] 
    if scores:
        average_score = sum(scores) / len(scores)
    else:
        average_score = 0  # 결과가 없을 경우 평균을 0으로 설정

    # 레벨
    total_vocab = sum([int(result.user_test.split('/')[0]) for result in results])
    if total_vocab >= 500:
        user_level = "expert" # 누적 단어 점수 500이상
    elif total_vocab >= 200:
        user_level = "advanced" # 누적 단어 점수 200이상
    elif total_vocab >= 100:
        user_level = "intermediate" # 누적 단어 점수 100이상
    else:
        user_level = "beginner"

    # 학습 날짜
    today = datetime.datetime.now().date()
    date_join = page_user.date_joined.date()
    result = today - date_join
    d_day = result.days

    return render(request, "users_app/user_page.html", {
        "page_user": page_user, "d_day":d_day, 'average_score' : average_score, 
        'total_vocab' : total_vocab, 'user_level' : user_level,
    })
