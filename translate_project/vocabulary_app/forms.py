from django import forms
from .models import Vocabulary

class Vocabulary_Form(forms.ModelForm):

    class Meta:
        model = Vocabulary
        fields = (
            'vocabulary_id',
            'vocabulary_name',
            'vocabulary_meaning',
            'vocabulary_level',
            'language_id'
        )

        labels = {
            'vocabulary_id': '단어 ID',
            'vocabulary_name':'단어', 
            'vocabulary_meaning':'뜻',
            'vocabulary_level':'단어 난이도',
            'language_id':'단어 종류'
        }

        # forms에 안보이게 설정
        widgets = {
            'vocabulary_id': forms.HiddenInput(),  # vocabulary_id 필드를 숨깁니다.
        }