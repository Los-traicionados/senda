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
        packs = packs.filter(pa_nombre__icontains=busqueda)
    if ida and vuelta:
        vuelos = vuelos.filter(
            Q(vu_origen__icontains=ida) &
            Q(vu_destino__icontains=vuelta)
        )
        
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
    
def actividades(request):
    actividades = Actividad.objects.all()

    busqueda = request.GET.get('busqueda')
    if busqueda:
        actividades = actividades.filter(act_nombre__icontains = busqueda)
    return render(request, 'paginas/actividades.html', {
        'actividades': actividades,
        'busqueda': busqueda, 
    })
