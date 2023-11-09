from django.shortcuts import render, get_object_or_404
from .views import *
from .models import *
from django.db.models import Q

# Importar sum
from django.db.models import Sum
# Create your views here.


def packs(request):
    packs = Pack.objects.all()
    actividades = Actividad.objects.all()
    hoteles = Hotel.objects.all()
    vuelos = Vuelo.objects.all()
    busqueda = request.GET.get('busqueda')
    ida = request.GET.get('ida')
    vuelta = request.GET.get('vuelta')
    #guardar variables temporales fecha ida y vuelta
    fecha_ida = request.GET.get('fecha_ida')
    fecha_vuelta = request.GET.get('fecha_vuelta')
    request.session['fecha_ida'] = fecha_ida
    request.session['fecha_vuelta'] = fecha_vuelta
    
    precio_total = Actividad.objects.aggregate(Sum('act_precio'))
    if busqueda:
        actividades = Actividad.objects.filter(act_nombre__icontains=busqueda)
    if ida:
        vuelos = vuelos.filter(vu_origen__icontains=ida)
        
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