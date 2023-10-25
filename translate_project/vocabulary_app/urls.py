from django.urls import path
from . import views

# urls에 path를 동록하여 사용할 페이지의 링크를 지정한다

urlpatterns = [
    path('vocabulary_list/', views.vocabulary_list, name='vocabulary_list' ),
    path('vocabulary_form/', views.vocabulary_insert, name='vocabulary_insert'),
    path('vocabulary_update/<str:vocabulary_id>', views.vocabulary_update, name='vocabulary_update'),
    path('vocabulary_delete/<str:vocabulary_id>', views.vocabulary_delete, name='vocabulary_delete'),
    path('vocabulary_train/<str:vocabulary_id>', views.vocabulary_train, name='vocabulary_train'),
    path('upload_excel/', views.upload_excel, name='upload_excel'),
    path('download_excel/', views.download_excel, name='download_excel'),
    path('vocabulary_test/', views.vocabulary_test, name='vocabulary_test'),
    path('vocabulary_insert_from_search/', views.vocabulary_insert_from_search, name='vocabulary_insert_from_search'),
    path('result_list/', views.result_list, name='result_list' ),
    path('result_list_week/', views.result_list_week, name='result_list_week' ),
    
]
