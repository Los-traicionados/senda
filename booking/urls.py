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
    # URL para carrito de Pack
    path('add_pack/<int:pack_id>', views.add_pack, name='add_pack'),
    path('del_pack/<int:pack_id>', views.del_pack, name='del_pack'),
    path('sub_pack/<int:pack_id>', views.sub_pack, name='sub_pack'),
    path('cle_pack/', views.cle_pack, name='cle_pack'),
    

] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)