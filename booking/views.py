from django.shortcuts import render, get_object_or_404, redirect
from .carrito import *
from .views import *
from .models import *
from django.db.models import Q
# Import messages
from django.contrib import messages
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
        actividades = actividades.filter(
            Q(act_nombre__icontains = busqueda) |
            Q(act_tipo__tact_nombre__icontains = busqueda)
        )
    return render(request, 'paginas/actividades.html', {
        'actividades': actividades,
        'busqueda': busqueda, 
    })


# Funcion para simular el pago
def pagar(request):
    if request.method == 'POST':
        messages.add_message(request, messages.INFO, 'Gracias por la compra')
    return redirect('tus-reservas')

# Funciones necesarias para el carrito :)
# Funciones para la logica de Pack Carrito
def add_pack(request, pack_id):
    pack_carrito = PackCarrito(request)
    pack = get_object_or_404(Pack, pk = pack_id)
    pack_carrito.agregar_pack(pack)
    messages.add_message(request, messages.INFO, 'Se agrego un item al carrito')
    return redirect('cart')

def del_pack(request, pack_id):
    pack_carrito = PackCarrito(request)
    pack = get_object_or_404(Pack, pk = pack_id)
    pack_carrito.eliminar_pack(pack)
    messages.add_message(request, messages.INFO, 'Se eliminó un item al carrito')
    return redirect('cart')

def sub_pack(request, pack_id):
    pack_carrito = PackCarrito(request)
    pack = get_object_or_404(Pack, pk = pack_id)
    pack_carrito.restar_pack(pack)
    messages.add_message(request, messages.INFO, 'Se quitó un item al carrito')
    return redirect('cart')

def cle_pack(request):
    pack_carrito = PackCarrito(request)
    pack_carrito.limpiar_pack()
    messages.add_message(request, messages.INFO, 'Se limpió el carrito')
    return redirect('cart')


# Funciones para la logica de Actividad Carrito
def add_actividad(request, actividad_id):
    actividad_carrito = ActividadCarrito(request)
    actividad = get_object_or_404(Actividad, pk = actividad_id)
    actividad_carrito.agregar_actividad(actividad)
    messages.add_message(request, messages.INFO, 'Se agrego un item al carrito')
    return redirect('cart')

def del_actividad(request, actividad_id):
    actividad_carrito = ActividadCarrito(request)
    actividad = get_object_or_404(Actividad, pk = actividad_id)
    actividad_carrito.eliminar_actividad(actividad)
    messages.add_message(request, messages.INFO, 'Se eliminó un item al carrito')
    return redirect('cart')

def sub_actividad(request, actividad_id):
    actividad_carrito = ActividadCarrito(request)
    actividad = get_object_or_404(Actividad, pk = actividad_id)
    actividad_carrito.restar_actividad(actividad)
    messages.add_message(request, messages.INFO, 'Se quitó un item al carrito')
    return redirect('cart')

def cle_actividad(request):
    actividad_carrito = ActividadCarrito(request)
    actividad_carrito.limpiar_actividad()
    messages.add_message(request, messages.INFO, 'Se limpió el carrito')
    return redirect('cart')

# Funciones para la logica de Hotel Carrito
def add_hotel(request, hotel_id):
    hotel_carrito = HotelCarrito(request)
    hotel = get_object_or_404(Hotel, pk = hotel_id)
    hotel_carrito.agregar_hotel(hotel)
    messages.add_message(request, messages.INFO, 'Se agrego un item al carrito')
    return redirect('cart')

def del_hotel(request, hotel_id):
    hotel_carrito = HotelCarrito(request)
    hotel = get_object_or_404(Hotel, pk = hotel_id)
    hotel_carrito.eliminar_hotel(hotel)
    messages.add_message(request, messages.INFO, 'Se eliminó un item al carrito')
    return redirect('cart')

def sub_hotel(request, hotel_id):
    hotel_carrito = HotelCarrito(request)
    hotel = get_object_or_404(Hotel, pk = hotel_id)
    hotel_carrito.restar_hotel(hotel)
    messages.add_message(request, messages.INFO, 'Se quitó un item al carrito')
    return redirect('cart')

def cle_hotel(request):
    hotel_carrito = HotelCarrito(request)
    hotel_carrito.limpiar_hotel()
    messages.add_message(request, messages.INFO, 'Se limpió el carrito')
    return redirect('cart')

# Funciones para la logica de Vuelo Carrito
def add_vuelo(request, vuelo_id):
    vuelo_carrito = VueloCarrito(request)
    vuelo = get_object_or_404(Vuelo, pk = vuelo_id)
    vuelo_carrito.agregar_vuelo(vuelo)
    messages.add_message(request, messages.INFO, 'Se agrego un item al carrito')
    return redirect('cart')

def del_vuelo(request, vuelo_id):
    vuelo_carrito = VueloCarrito(request)
    vuelo = get_object_or_404(Vuelo, pk = vuelo_id)
    vuelo_carrito.eliminar_vuelo(vuelo)
    messages.add_message(request, messages.INFO, 'Se eliminó un item al carrito')
    return redirect('cart')

def sub_vuelo(request, vuelo_id):
    vuelo_carrito = VueloCarrito(request)
    vuelo = get_object_or_404(Vuelo, pk = vuelo_id)
    vuelo_carrito.restar_vuelo(vuelo)
    messages.add_message(request, messages.INFO, 'Se quitó un item al carrito')
    return redirect('cart')

def cle_vuelo(request):
    vuelo_carrito = VueloCarrito(request)
    vuelo_carrito.limpiar_vuelo()
    messages.add_message(request, messages.INFO, 'Se limpió el carrito')
    return redirect('cart')