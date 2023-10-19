from django.contrib.auth.models import AbstractUser
from django.db import models
from django.core.validators import RegexValidator

class User(AbstractUser):
    class Language(models.TextChoices):
        ENGLISH = "en-US", "English"
        JAPANESE = "ja-JP" , "Japanese"
        CHINESE = "zh-CN", "Chinese"
        SPANISH = "es-ES" , "Spanish"
        FRENCH = "fr-FR", "French"
        GERMAN = "de-DE", "German"
        RUSSIAN = "ru-RU", "Russian"
    
    class Level(models.TextChoices):
        BEGINNER = "beginner"
        ADVANCED = "advanced" # 누적 단어 점수 200이상
        EXPERT = "expert" # 누적 단어 점수 500이상

    # 기본 유저에 아이디/패스워드/이메일
    # profile도 한번에 유저에서 처리
    website_url = models.URLField(blank=True)
    user_language = models.CharField(max_length=10, choices=Language.choices, default=Language.ENGLISH, verbose_name="Language")
    user_level = models.CharField(max_length=10, choices=Level.choices, default=Level.BEGINNER, verbose_name="Level")
    avatar = models.ImageField(blank=True, upload_to="%Y/%m/%d",
                               help_text="48px*48px PNG/jpg파일을 업로드해주세요")

