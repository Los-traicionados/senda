from django.shortcuts import render
from booking.models import *
from django.http import JsonResponse
from django.core import serializers
from django.http import HttpResponse
import json

# Create your views here.
def index(request):
    packs = Pack.objects.all()
    vuelos = Vuelo.objects.all()
    hoteles = Hotel.objects.all()
    actividades = Actividad.objects.all()
    # para controlar ciudades duplicadas
    ciudades = []
    for ho in hoteles:
        if not ho.ho_ciudad in ciudades:
            ciudades.append(ho.ho_ciudad)

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
    print('fecha_ida', request.session.get('fecha_ida'))
    print('fecha_vuelta', request.session.get('fecha_vuelta'))
    return render(request, 'paginas/index.html',{
        'packs':packs,
        'vuelos':vuelos,
        'hoteles':hoteles,
        'actividades':actividades,
        'ciudades':ciudades,
        'origen':origen,
        'destino':destino,

    })

def about(request):
    return render(request, 'paginas/about.html')

def productos(request):
    vuelos = Vuelo.objects.all()
    actividades = Actividad.objects.all()
    reservas = Reserva.objects.all()
    hoteles = Hotel.objects.all()
    packs = Pack.objects.all()
    return render(request, 'paginas/productos.html',{
        'vuelos': vuelos,
        'actividades': actividades,
        'hoteles': hoteles,
        'packs': packs,
    })

def producto_tipo(request):
    return render(request, 'paginas/producto_tipo.html')

def dashboard(request):
    data = Reserva.objects.all().values_list(flat=True)
    json_data = json.dumps(list(data))
    return render(request, 'paginas/dashboard.html', {'reservas': json_data})