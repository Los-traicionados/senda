from django.shortcuts import render, get_object_or_404
from .views import *
from .models import *
# Create your views here.


def packs(request):
    packs = Pack.objects.all()
    return render(request, 'paginas/packs.html',{
        'packs': packs,
    })

def detail_pack(request, id):
    pack = get_object_or_404(Pack, pk=id)
    return render(request, 'paginas/detail_pack.html', {
        'pack': pack
    })

def cart(request):
    return render(request, 'paginas/cart.html')