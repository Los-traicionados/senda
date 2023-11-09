from django.shortcuts import render
from booking.models import *

# Create your views here.
def index(request):
    packs = Pack.objects.all()
    vuelos = Vuelo.objects.all()
    hoteles = Hotel.objects.all()
    actividades = Actividad.objects.all()
    print('fecha_ida', request.session.get('fecha_ida'))
    print('fecha_vuelta', request.session.get('fecha_vuelta'))
    
    return render(request, 'paginas/index.html',{
        'packs':packs,
        'vuelos':vuelos,
        'hoteles':hoteles,
        'actividades':actividades
    })

def about(request):
    return render(request, 'paginas/about.html')

def productos(request):
    return render(request, 'paginas/productos.html')

def producto_tipo(request):
    return render(request, 'paginas/producto_tipo.html')