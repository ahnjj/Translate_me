from django.contrib.auth.decorators import login_required # 로그인 인증
from django.utils.decorators import method_decorator # 클래스뷰 로그인 인증
from django.contrib import messages
from django.utils.decorators import method_decorator
from django.urls import reverse_lazy
from django.views.generic import CreateView, UpdateView, ListView, DetailView, DeleteView

from .forms import RolePlayingRoomForm
from .models import RolePlayingRoom


# 상황극 생성뷰
@method_decorator(login_required, name='dispatch')
class RolePlayingRoomCreateView(CreateView):
    model = RolePlayingRoom
    form_class = RolePlayingRoomForm
    template_name = "roleplay_game_app/roleplayingroom_form.html"

    def form_valid(self, form):
        role_playing_room = form.save(commit=False)
        role_playing_room.user = self.request.user # 유저 
        response = super().form_valid(form)
        messages.success(self.request, "새로운 상황극을 생성했습니다.")
        return response
# role_playing_room_new = RolePlayingRoomCreateView.as_view()

    
# 상황극 수정뷰
@method_decorator(login_required, name='dispatch')
class RolePlayingRoomUpdateView(UpdateView):
    model = RolePlayingRoom
    form_class = RolePlayingRoomForm

    def get_queryset(self):
        qs = super().get_queryset() # 전체 쿼리 읽어오기
        qs = qs.filter(user=self.request.user) # 그중 해당 유저만 필터링
        return qs
    
    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, "상황극을 수정했습니다.")
        return response
    
# role_playing_room_edit = RolePlayingRoomUpdateView.as_view()
    
# 전체 조회 뷰
@method_decorator(login_required, name='dispatch')
class RolePlayingRoomListView(ListView):
    model = RolePlayingRoom
    template_name = "roleplay_game_app/roleplayingroom_list.html"
    paginate_by = 5   # 🔥paging - 다음 페이지로 어떻게 넘어가지...?
    page_kwarg = "page" # 🔥paging - 다음 페이지로 어떻게 넘어가지...?

    def get_queryset(self):
        qs = super().get_queryset()
        qs = qs.filter(user=self.request.user)  # 해당 유저것만 가져오기
        return qs
    
# role_playing_room_list = RolePlayingRoomListView.as_view()


    
# 개별 상황극 상세 조회 뷰
@method_decorator(login_required, name='dispatch')
class RolePlayingRoomDetailView(DetailView):
    model = RolePlayingRoom
    template_name = "roleplay_game_app/roleplayingroom_detail.html"

    def get_queryset(self):
        qs = super().get_queryset()
        qs = qs.filter(user=self.request.user)
        return qs
    
# role_playing_room_detail = RolePlayingRoomDetailView.as_view()

    
# 상황극 삭제 뷰
@method_decorator(login_required, name='dispatch')
class RolePlayingRoomDeleteView(DeleteView):
    model = RolePlayingRoom
    success_url = reverse_lazy("role_playing_room_list")   # 성공시 이동할 url
    template_name = "roleplay_game_app/roleplayingroom_confirm_delete.html"

    def get_queryset(self):
        qs =  super().get_queryset()
        qs = qs.filter(user=self.request.user)
        return qs
    
    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, "상황극을 삭제했습니다.")
        return response
    

# role_playing_room_delete = RolePlayingRoomDeleteView.as_view()
