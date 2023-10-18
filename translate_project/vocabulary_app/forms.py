from django import forms
from .models import *

class Vocabulary_Form(forms.ModelForm):

    class Meta:
        model = Vocabulary
        fields = (
            'vocabulary_name',
            'vocabulary_meaning',
        )

        labels = {
            'vocabulary_name':'단어', 
            'vocabulary_meaning':'뜻',
        }