from django.contrib import admin
from .models import User

@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ['username','email','website_url', 'user_language','user_level','avatar','is_active', 'is_staff', 'is_superuser']