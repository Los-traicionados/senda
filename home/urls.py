from django.urls import path
from . import views
from django.conf import settings
from django.contrib.staticfiles.urls import static

urlpatterns = [
    path('', views.index, name='index'),
    path('about', views.about, name='about'),
    path('dashboard', views.dashboard, name='dashboard'),
    path('productos', views.productos, name='productos'),
    path('producto_tipo', views.producto_tipo, name='producto_tipo'),
	path('products_detail', views.products_detail, name='products_detail'),
	path('products_detail_actividades/<int:id>', views.redirect_detail_actividades, name='products_detail_actividades'),
	path('products_detail_hoteles/<int:id>', views.redirect_detail_hoteles, name='products_detail_hoteles'),
	path('products_detail_vuelos/<int:id>', views.redirect_detail_vuelos, name='products_detail_vuelos'),
	path('products_detail_packs/<int:id>', views.redirect_detail_packs, name='products_detail_packs'),
] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)