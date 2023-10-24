from django import forms
from .models import Vocabulary

class Vocabulary_Form(forms.ModelForm):

    class Meta:
        model = Vocabulary
        fields = (
            'vocabulary_name',
            'vocabulary_meaning',
            'vocabulary_level',
            'language_id'
        )

        widgets = {
            'vocabulary_name': forms.TextInput(attrs={
                'class': "form-control",
                'placeholder': '단어 입력'
                }),
            'vocabulary_meaning': forms.Textarea(attrs={
                'class': "form-control",
                'style': "height: 150px",
                'placeholder': '뜻 입력'
                }),
            'vocabulary_level': forms.NumberInput(attrs={
                'class': "form-control",
                'placeholder': '레벨 입력'
                }),
            'language_id': forms.Select(attrs={
                'class': "form-select",
            }),
        }

        labels = {
            'vocabulary_name':'단어', 
            'vocabulary_meaning':'뜻',
            'vocabulary_level':'단어 난이도',
            'language_id':'단어 종류'
        }
        