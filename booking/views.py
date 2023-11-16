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
    if not request.session.get('fecha_ida') and not request.session.get('fecha_vuelta'):
        fecha_ida = request.GET.get('fecha_ida')
        fecha_vuelta = request.GET.get('fecha_vuelta')
        request.session['fecha_ida'] = fecha_ida
        request.session['fecha_vuelta'] = fecha_vuelta
        request.session.save()

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
    #guardar variables temporales fecha ida y vuelta
    if not request.session.get('fecha_ida') and not request.session.get('fecha_vuelta'):
        fecha_ida = request.GET.get('fecha_ida')
        fecha_vuelta = request.GET.get('fecha_vuelta')
        request.session['fecha_ida'] = fecha_ida
        request.session['fecha_vuelta'] = fecha_vuelta
        request.session.save()
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
    #guardar variables temporales fecha ida y vuelta
    if not request.session.get('fecha_ida') and not request.session.get('fecha_vuelta'):
        fecha_ida = request.GET.get('fecha_ida')
        fecha_vuelta = request.GET.get('fecha_vuelta')
        request.session['fecha_ida'] = fecha_ida
        request.session['fecha_vuelta'] = fecha_vuelta
        request.session.save()
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
    #guardar variables temporales fecha ida y vuelta
    if not request.session.get('fecha_ida') and not request.session.get('fecha_vuelta'):
        fecha_ida = request.GET.get('fecha_ida')
        fecha_vuelta = request.GET.get('fecha_vuelta')
        request.session['fecha_ida'] = fecha_ida
        request.session['fecha_vuelta'] = fecha_vuelta
        request.session.save()
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
        #guardar variables temporales fecha ida y vuelta
        if not request.session.get('fecha_ida') and not request.session.get('fecha_vuelta'):
            fecha_ida = request.GET.get('fecha_ida')
            fecha_vuelta = request.GET.get('fecha_vuelta')
            request.session['fecha_ida'] = fecha_ida
            request.session['fecha_vuelta'] = fecha_vuelta
            request.session.save()
        # Obtener los datos de las variables de sesión
        pack_carrito = request.session.get('pack_carrito', {})
        actividad_carrito = request.session.get('actividad_carrito', {})
        hotel_carrito = request.session.get('hotel_carrito', {})
        vuelo_carrito = request.session.get('vuelo_carrito', {})

        client = get_object_or_404(Cliente, user=user)
        packs = request.session.get('pack_carrito')
        reserva = Reserva()
        total = 0
        # Iterar sobre los datos del carrito de packs y asignarlos a la relación many-to-many
        for pack_id, pack_data in pack_carrito.items():
            pack_obj = get_object_or_404(Pack, pk=int(pack_id))
            total += pack_obj.pa_precio
            reserva.pack.add(pack_obj)

        # Iterar sobre los datos del carrito de actividades y asignarlos a la relación many-to-many
        for actividad_id, actividad_data in actividad_carrito.items():
            actividad_obj = get_object_or_404(Actividad, pk=int(actividad_id))
            total += actividad_obj.act_precio
            reserva.actividad.add(actividad_obj)

        # Iterar sobre los datos del carrito de hoteles y asignarlos a la relación many-to-many
        for hotel_id, hotel_data in hotel_carrito.items():
            hotel_obj = get_object_or_404(Hotel, pk=int(hotel_id))
            total += hotel_obj.ho_precio
            reserva.hotel.add(hotel_obj)

        # Iterar sobre los datos del carrito de vuelos y asignarlos a la relación many-to-many
        for vuelo_id, vuelo_data in vuelo_carrito.items():
            vuelo_obj = get_object_or_404(Vuelo, pk=int(vuelo_id))
            total += vuelo_obj.vu_precio
            reserva.vuelo.add(vuelo_obj)
        
        reserva.res_f_inicio = request.session.get('fecha_ida')
        reserva.res_f_fin = request.session.get('fecha_vuelta')
        reserva.res_precio = total
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