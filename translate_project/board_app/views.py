import json
from django.shortcuts import get_object_or_404, render, redirect
from .models import Board
from django.db.models import Q
from django.http import JsonResponse
from django.core import serializers
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .forms import BoardForm, BoardCommentForm

# Create your views here.
def board_list(request):
    boards = Board.objects.all()
    return render(request, 'board_app/board_list.html', {'boards':boards, 'user': request.user})

def board_detail(request, board_id):
    board = get_object_or_404(Board, pk=board_id)
    return render(request, 'board_app/board_detail.html', {'board':board, 'user': request.user})

@login_required
def board_insert(request):
    if request.method == "POST":
        form = BoardForm(request.POST, user=request.user)
        if form.is_valid():
            board = form.save(commit=False)
            board.user = request.user
            board.save()
            return redirect('board_list')
    else:
        form = BoardForm(user=request.user)
    return render(request, 'board_app/board_form.html', {'form':form})

    
@login_required
def board_update(request, board_id):
    board = get_object_or_404(Board, pk=board_id)
    if board.user == request.user:    
        if request.method == "POST":
            form = BoardForm(request.POST, instance=board, user=request.user)
            if form.is_valid():
                board = form.save(commit=False)
                board.save()
                return redirect('board_list')
        else:
            form = BoardForm(instance=board, user=request.user)
            return render(request, 'board_app/board_update.html', {'form':form})
    else:
        messages.warning(request, '작성자만 수정이 가능합니다.')
        return redirect('board_list')


@login_required    
def board_delete(request, board_id):
    board = get_object_or_404(Board, pk=board_id)
    if board.user == request.user:    
        board.delete()
        return redirect('board_list')
    else:
        messages.warning(request, '작성자만 수정이 가능합니다.')
        return redirect('board_list')


def board_search_form(request):
    return render(request, 'board_app/board_search_form.html')


def board_search(request):
    if request.method == "POST":
        type = request.POST['type']
        keyword = request.POST['keyword']
        if type == "board_title":
            bd_list = Board.objects.filter(board_title__contains=keyword)
        elif type == "board_main_txt":
            bd_list = Board.objects.filter(board_main_txt__contains=keyword)
        else:
            return JsonResponse({'reload_all':False, 'bd_list_json':[]})
        
        bd_list_json = json.loads(serializers.serialize('json', bd_list, ensure_ascii=False))

        return JsonResponse({'reload_all':False, 'bd_list_json':bd_list_json})
    else:
        return render(request, 'board_app/board_search_form.html')
    

def add_comment(request, board_id):
    if request.method == 'POST':
        form = BoardCommentForm(request.POST, user=request.user, board_id=board_id)
        if form.is_valid():
            comment = form.save()
            # ...
    else:
        form = BoardCommentForm(user=request.user, board_id=board_id)
