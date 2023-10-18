from django.shortcuts import render
from django.http import QueryDict
from . import naver_dict_search

# Create your views here.

def index(request):
    return render(request, 'translate_app/index.html')

def index_search(request):
    if request.method == "POST":
        query = request.POST['query'] 
        query_result = QueryDict('', mutable=True)
        query_result.update(naver_dict_search.query_search(query))
        return render(request, "translate_app/result.html", {'query_result': query_result})