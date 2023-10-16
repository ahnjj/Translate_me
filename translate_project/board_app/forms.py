from django import forms
from .models import Board

# ModelForm 클래스 상속 받음
class BoardForm(forms.ModelForm):
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
