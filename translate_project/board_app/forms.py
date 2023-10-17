from django import forms
from .models import Board
from django.contrib.auth import get_user_model

# ModelForm 클래스 상속 받음
class BoardForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user', None)
        super(BoardForm, self).__init__(*args, **kwargs)
        self.user = user

    class Meta:
        model = Board
        fields = (
            'board_title',
            'board_main_txt',
            'category',
            'language'
        )
        labels = {
            'board_title':'제목',
            'board_main_txt':'내용',
            'category':'카테고리',
            'language':'언어'
        }


    def save(self, commit=True):
        instance = super(BoardForm, self).save(commit=False)
        instance.user = self.user 
        if commit:
            instance.save()
        return instance    