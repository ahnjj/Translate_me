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

        labels = {
            'vocabulary_name':'단어', 
            'vocabulary_meaning':'뜻',
            'vocabulary_level':'단어 난이도',
            'language_id':'단어 종류'
        }
        