from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from .carrito import *
from .views import *
from .models import *
from django.db.models import Q
# Import messages
from django.contrib import messages
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
    actividades_filtrado = actividades
    act_ciudades = []
    for act in actividades:
        if not act.act_ciudad in act_ciudades:
            act_ciudades.append(act.act_ciudad)
    actividad = request.GET.get('actividad')
    if actividad:
        actividades_filtrado = actividades.filter(act_ciudad__icontains = actividad)
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
        'actividades_filtrado': actividades_filtrado,
        'actividad': actividad,
        'act_ciudades': act_ciudades,
        'busqueda': busqueda, 
    })


# Funcion para simular el pago
@login_required
def pagar(request):
    if request.method == 'POST':
        user = request.user
        #guardar variables temporales fecha ida y vuelta
        if not request.session.get('fecha_ida') and not request.session.get('fecha_vuelta'):
            fecha_ida = request.POST.get('fecha_ida')
            fecha_vuelta = request.POST.get('fecha_vuelta')
            request.session['fecha_ida'] = fecha_ida
            request.session['fecha_vuelta'] = fecha_vuelta
            
            request.session.save()

        fecha_ida = request.session.get('fecha_ida')
        fecha_vuelta = request.session.get('fecha_vuelta')
        if fecha_ida and fecha_vuelta:
            print(fecha_ida)
            print(fecha_vuelta)
            # Obtener los datos de las variables de sesión
            pack_carrito = request.session.get('pack_carrito')
            actividad_carrito = request.session.get('actividad_carrito')
            hotel_carrito = request.session.get('hotel_carrito')
            vuelo_carrito = request.session.get('vuelo_carrito')
            client = get_object_or_404(Cliente, user=user)
            reserva = Reserva(client = client)
            reserva.save()
            total = 0
            # Iterar sobre los datos del carrito de packs y asignarlos a la relación many-to-many
            if pack_carrito:
                for pack_id, pack_data in pack_carrito.items():
                    pack_obj = get_object_or_404(Pack, pk=int(pack_id))
                    total += pack_obj.pa_precio
                    reserva.pack.add(pack_obj)

            # Iterar sobre los datos del carrito de actividades y asignarlos a la relación many-to-many
            if actividad_carrito:
                for actividad_id, actividad_data in actividad_carrito.items():
                    actividad_obj = get_object_or_404(Actividad, pk=int(actividad_id))
                    total += actividad_obj.act_precio
                    reserva.actividad.add(actividad_obj)

            # Iterar sobre los datos del carrito de hoteles y asignarlos a la relación many-to-many
            if hotel_carrito:
                for hotel_id, hotel_data in hotel_carrito.items():
                    hotel_obj = get_object_or_404(Hotel, pk=int(hotel_id))
                    total += hotel_obj.ho_precio
                    reserva.hotel.add(hotel_obj)

            # Iterar sobre los datos del carrito de vuelos y asignarlos a la relación many-to-many
            if vuelo_carrito:
                for vuelo_id, vuelo_data in vuelo_carrito.items():
                    vuelo_obj = get_object_or_404(Vuelo, pk=int(vuelo_id))
                    total += vuelo_obj.vu_precio
                    reserva.vuelo.add(vuelo_obj)

            reserva.res_f_inicio = request.session.get('fecha_ida')
            reserva.res_f_fin = request.session.get('fecha_vuelta')
            reserva.res_precio = total
            reserva.save()

            # Eliminando las sessiones
            del pack_carrito
            del actividad_carrito
            del hotel_carrito
            del vuelo_carrito
            del fecha_ida
            del fecha_vuelta
            messages.add_message(request, messages.INFO, 'Gracias por la compra')
            return redirect('tus-reservas')
        else:
            messages.add_message(request, messages.INFO, 'Se debe seleccionar fechas para hacer la reserva')
            return redirect('cart')
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
