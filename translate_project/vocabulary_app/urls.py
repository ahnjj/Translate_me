from django.urls import path
from . import views

# urls에 path를 동록하여 사용할 페이지의 링크를 지정한다

urlpatterns = [
    path('vocabulary_list/', views.vocabulary_list, name='vocabulary_list' ),
    path('vocabulary_form/', views.vocabulary_insert, name='vocabulary_insert'),
    path('vocabulary_delete/<str:vocabulary_id>', views.vocabulary_delete, name='vocabulary_delete'),
    path('vocabulary_train/<str:vocabulary_id>', views.vocabulary_train, name='vocabulary_train')
]
