DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.mysql",  # 엔진
        "NAME": "translate_db",  # 데이터베이스 이름
        "USER": "root",  # 사용자
        "PASSWORD": "wjd900105!",  # 비밀번호
        "HOST": "localhost",  # 호스트
        "PORT": "3306",  # 포트번호
    }
}

# SECRET_KEY
# 1. settings.py의 secret_key는 주석처리
# 2. 복사해서 여기에서 사용
SECRET_KEY = 'django-insecure-y6jkwlll3f^8j@g!ae4wbs5jc-$lqmm)15#6w81#+qu(d4fa7('