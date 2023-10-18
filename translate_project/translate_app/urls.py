from django.urls import path
from . import views

# urls에 path를 동록하여 사용할 페이지의 링크를 지정한다

urlpatterns = [
    path('', views.index, name='index'),   
    path('search/', views.index_search, name='index_search'),
]
