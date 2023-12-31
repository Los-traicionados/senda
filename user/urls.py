from django.urls import path
from . import views
from django.conf import settings
from django.contrib.staticfiles.urls import static

urlpatterns = [
    path('login', views.login_view, name='login'),
    path('logout', views.logout_view, name='logout'),
    path('perfil', views.perfil, name='perfil'),
    path('registro', views.registro, name='registro'),
    path('send_email_to_all', views.send_email_to_all, name='send_email_to_all'),
    path('mailing', views.mailing_view, name='mailing'),
	path('tus-reservas', views.tus_reservas, name='tus-reservas'),
	path('tus-favoritos', views.tus_favoritos, name='tus-favoritos'),
  	path('recomendaciones', views.recomendaciones, name='recomendaciones'),
] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)