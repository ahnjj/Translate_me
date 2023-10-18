from django import forms
from .models import Board, BoardComment
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
    
class BoardCommentForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user', None)
        board_id = kwargs.pop('board_id', None)
        super(BoardCommentForm, self).__init__(*args, **kwargs)
        self.user = user
        self.fields['board_id'] = forms.IntegerField(widget=forms.HiddenInput, initial=board_id)

    class Meta:
        model = BoardComment
        fields = (
            'comment_text',
        )
        labels = {
            'comment_text':'댓글',
        }


    def save(self, commit=True):
        instance = super(BoardCommentForm, self).save(commit=False)
        instance.user = self.user 
        if commit:
            instance.save()
        return instance    