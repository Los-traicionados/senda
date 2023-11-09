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

] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)