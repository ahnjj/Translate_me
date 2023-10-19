from django.db import models
from django.conf import settings
from django.core.validators import MinLengthValidator
from django.db import models
from django.urls import reverse
# from typing import TypeDict, Literal, List

from users_app.models import User


class RolePlayingRoom(models.Model):
    class Language(models.TextChoices): # 지원하는 언어들
        ENGLISH = "en-US", "English"
        JAPANESE = "ja-JP", "Japanese"
        CHINESE = "zh-CN", "Chinese"
    
    class Level(models.IntegerChoices):
        BEGINNER = 1, '초급'
        ADVANCED = 2, '고급'

    class Meta:
        ordering = ['-pk']

    user = models.ForeignKey(User, models.DO_NOTHING, blank=True, null=True)
    language = models.CharField(
        max_length=10, choices=Language.choices, default=Language.ENGLISH, verbose_name="대화 언어"
        )
    level = models.SmallIntegerField(
        choices=Level.choices, default=Level.BEGINNER, verbose_name="레벨"
    )
    situation = models.CharField(
        max_length=100,
        validators=[MinLengthValidator(3)], verbose_name="상황"
    )
    situation_en = models.CharField(
        max_length=100, blank=True, verbose_name="상황(영문)",
        help_text="여기에 입력하신 대로 도우미에게 상황극 설정을 전달합니다. 비워두시면 자동으로 번역되니 걱정마세요!"
    )
    my_role = models.CharField(max_length=100, verbose_name="내 역할")
    my_role_en = models.CharField(
        max_length=100, blank=True, verbose_name="내 역할(영문)",
        help_text="여기에 입력하신 대로 도우미에게 여러분의 역할을 알려줍니다. 비워두시면 자동으로 번역되니 걱정마세요!"
    )
    helper_role = models.CharField(max_length=100, verbose_name="도우미 역할(영문)")
    helper_role_en = models.CharField(
        max_length=100, blank=True, verbose_name="도우미 역할(영문)",
        help_text="여기에 입력하신 대로 도우미에게 도우미의 역할을 알려줍니다. 비워두시면 자동으로 번역되니 걱정마세요!"
    )
