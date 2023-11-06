from django.shortcuts import render, get_object_or_404
from .views import *
from .models import *

# Importar sum
from django.db.models import Sum
# Create your views here.


def packs(request):
    packs = Pack.objects.all()
    actividades = Actividad.objects.all()
    hoteles = Hotel.objects.all()
    vuelos = Vuelo.objects.all()
    busqueda = request.GET.get('busqueda')
    precio_total = Actividad.objects.aggregate(Sum('act_precio'))
    if busqueda:
        actividades = Actividad.objects.filter(act_nombre__icontains=busqueda)
    return render(request, 'paginas/packs.html',{
        'packs': packs,
        'actividades': actividades,
        'hoteles': hoteles,
        'vuelos':vuelos,
        'busqueda': busqueda,
        'precio_total': precio_total
    })

def detail_pack(request, id):
    pack = get_object_or_404(Pack, pk=id)
    return render(request, 'paginas/detail_pack.html', {
        'pack': pack
    })

def cart(request):
    return render(request, 'paginas/cart.html')