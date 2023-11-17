from django.urls import path
from . import views
from django.conf import settings
from django.contrib.staticfiles.urls import static

urlpatterns = [
    path('packs', views.packs, name='packs'),
    path('pack/<int:id>/', views.detail_pack, name='detail_pack'),
    path('cart', views.cart, name='cart'),
    path('vuelos', views.vuelos, name='vuelos'),
    path('hoteles', views.hoteles, name='hoteles'),
    path('actividades', views.actividades, name='actividades'),
    path('pagar', views.pagar, name='pagar'),
    # URL para carrito de Pack
    path('add_pack/<int:pack_id>', views.add_pack, name='add_pack'),
    path('del_pack/<int:pack_id>', views.del_pack, name='del_pack'),
    path('sub_pack/<int:pack_id>', views.sub_pack, name='sub_pack'),
    path('cle_pack/', views.cle_pack, name='cle_pack'),
     # URL para carrito de Actividad
    path('add_actividad/<int:actividad_id>', views.add_actividad, name='add_actividad'),
    path('del_actividad/<int:actividad_id>', views.del_actividad, name='del_actividad'),
    path('sub_actividad/<int:actividad_id>', views.sub_actividad, name='sub_actividad'),
    path('cle_actividad/', views.cle_actividad, name='cle_actividad'),
    # URL para carrito de Hotel
    path('add_hotel/<int:hotel_id>', views.add_hotel, name='add_hotel'),
    path('del_hotel/<int:hotel_id>', views.del_hotel, name='del_hotel'),
    path('sub_hotel/<int:hotel_id>', views.sub_hotel, name='sub_hotel'),
    path('cle_hotel/', views.cle_hotel, name='cle_hotel'),
    # URL para carrito de Vuelo
    path('add_vuelo/<int:vuelo_id>', views.add_vuelo, name='add_vuelo'),
    path('del_vuelo/<int:vuelo_id>', views.del_vuelo, name='del_vuelo'),
    path('sub_vuelo/<int:vuelo_id>', views.sub_vuelo, name='sub_vuelo'),
    path('cle_vuelo/', views.cle_vuelo, name='cle_vuelo'),

] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)