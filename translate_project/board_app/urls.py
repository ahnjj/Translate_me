from django.urls import path
from . import views

# urls에 path를 동록하여 사용할 페이지의 링크를 지정한다

urlpatterns = [
    path('board/list/', views.board_list, name='board_list'),
    #http://127.0.0.1:8000/board/list/
    path('board/detail/<str:board_id>/', views.board_detail, name='board_detail'),
    path('board/insert/', views.board_insert, name='board_insert'),
    path('board/update/<str:board_id>/', views.board_update, name='board_update'),
    path('board/delete/<str:board_id>/', views.board_delete, name='board_delete'),
    path('board/search_form/', views.board_search_form, name='board_search_form'),
    path('board/search/', views.board_search, name='board_search'),
    path('board/comment/add', views.add_comment, name='add_comment'),    
]
