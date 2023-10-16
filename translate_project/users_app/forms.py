from django import forms
from django.contrib.auth.forms import BaseUserCreationForm
from .models import User


class SignupForm(BaseUserCreationForm):
    def __init__(self, *args, **kwargs):    # overriding 해서 커스텀하기 (필수 입력란)
        super().__init__(*args, **kwargs)
        self.fields['email'].required = True  
        self.fields['username'].required = True
        # self.fields['last_name'].required = True


    # 기본 폼에 더 추가할 사항(커스텀)
    class Meta(BaseUserCreationForm.Meta):
        model = User # 우리 앱에 있는 user모델로 변경해주어야함
        fields = ['username', 'email']

    def clean_email(self):
        email = self.cleaned_data.get('email')
        if email:
            qs = User.objects.filter(email=email)
            if qs.exists():
                raise forms.ValidationError("이미 등록된 이메일 주소입니다.")
        return email
    
class ProfileForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['avatar', 'user_language','user_level', 'website_url' ]
            