from django import forms
from .models import RolePlayingRoom
from .translators import google_translate

class RolePlayingRoomForm(forms.ModelForm):
    class Meta:
        model = RolePlayingRoom
        fields = [
            "language",
            "level",
            "situation",
            "situation_en",
            "my_role",
            "my_role_en",
            "helper_role",
            "helper_role_en",
        ]

    def clean(self):
        # 상황
        situation = self.cleaned_data.get("situation")
        situation_en = self.cleaned_data.get("situation_en")
        # 영어를 작성하지 않았을때 자동 번역 되도록
        if situation and not situation_en:
            self.cleaned_data["situation_en"] = self._translate(situation)
        
        # 내 역할
        my_role = self.cleaned_data.get("my_role")
        my_role_en = self.cleaned_data.get("my_role_en")
        # 영어를 작성하지 않았을때 자동 번역 되도록
        if my_role and not my_role_en:
            self.cleaned_data["my_role_en"] = self._translate(my_role)

        # 도우미 역할(GPT)
        helper_role = self.cleaned_data.get("helper_role")
        helper_role_en = self.cleaned_data.get("helper_role_en")
        # 영어를 작성하지 않았을때 자동 번역 되도록
        if helper_role and not helper_role_en:
            self.cleaned_data["helper_role_en"] = self._translate(helper_role)

    # 정적메소드 지정 안해주면 오류남
    @staticmethod
    def _translate(origin_text:str) -> str:
        translated = google_translate(origin_text, "auto", "en")
        if not translated:
            raise forms.ValidationError("번역을 할 수 없습니다.")
        return translated