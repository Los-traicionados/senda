from django.shortcuts import render, get_object_or_404
from .views import *
from .models import *
from django.db.models import Q

# Importar sum
from django.db.models import Sum
# Create your views here.

def hoteles(request):
    hoteles = Hotel.objects.all()
    hoteles_filtrado = hoteles
    # para controlar ciudades duplicadas
    ciudades = []
    for ho in hoteles:
        if not ho.ho_ciudad in ciudades:
            ciudades.append(ho.ho_ciudad)

    ciudad = request.GET.get('ciudad')
    if ciudad:
        hoteles_filtrado = hoteles.filter(ho_ciudad__icontains = ciudad)
    return render(request, 'paginas/hoteles.html', {
        'hoteles': hoteles,
        'hoteles_filtrado': hoteles_filtrado,
        'ciudad': ciudad,
        'ciudades': ciudades,
    })

def packs(request):
    packs = Pack.objects.all()
    packs_filtrado = packs
    
    # para controlar ciudades duplicadas en los packs
    pa_ciudades = []
    for pa in packs:
        if not pa.pa_ciudad in pa_ciudades:
            pa_ciudades.append(pa.pa_ciudad)
            
    pack = request.GET.get('pack')
    if pack:
        packs_filtrado = packs.filter(pa_ciudad__icontains = pack)

    return render(request, 'paginas/packs.html',{
        'packs': packs,
        'packs_filtrado': packs_filtrado,
        'pack': pack,
        'pa_ciudades': pa_ciudades,
    })

def detail_pack(request, id):
    pack = get_object_or_404(Pack, pk=id)
    return render(request, 'paginas/detail_pack.html', {
        'pack': pack
    })

def cart(request):
    return render(request, 'paginas/cart.html')

def vuelos(request):
    vuelos = Vuelo.objects.all()
    vuelos_filtrado = vuelos
    ida = request.GET.get('ida')
    vuelta = request.GET.get('vuelta')
    
    # para controlar origen duplicadas
    origen = []
    for vu in vuelos:
        if not vu.vu_origen in origen:
            origen.append(vu.vu_origen)

    # para controlar origen duplicadas
    destino = []
    for vu in vuelos:
        if not vu.vu_destino in destino:
            destino.append(vu.vu_destino)

    if ida and vuelta:
        vuelos_filtrado = vuelos.filter(
            Q(vu_origen__icontains = ida) &
            Q(vu_destino__icontains = vuelta)
        )
    return render(request, 'paginas/vuelos.html',{
        'vuelos': vuelos,
        'vuelos_filtrado': vuelos_filtrado,
        'origen':origen,
        'destino':destino,
    })


def actividades(request):
    actividades = Actividad.objects.all()
    actividades_filtrado = actividades
    
    # para controlar ciudades duplicadas
    act_ciudades = []
    for act in actividades:
        if not act.act_ciudad in act_ciudades:
            act_ciudades.append(act.act_ciudad)
    actividad = request.GET.get('actividad')
    if actividad:
        actividades_filtrado = actividades.filter(act_ciudad__icontains = actividad)
    return render(request, 'paginas/actividades.html', {
        'actividades': actividades,
        'actividades_filtrado': actividades_filtrado,
        'actividad': actividad,
        'act_ciudades': act_ciudades,
        'busqueda': busqueda, 
    })