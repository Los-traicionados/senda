from django.urls import path
from . import views
from django.conf import settings
from django.contrib.staticfiles.urls import static

urlpatterns = [
    path('login', views.login_view, name='login'),
    path('logout', views.logout_view, name='logout'),
    path('perfil', views.perfil, name='perfil'),
    path('registro', views.registro, name='registro'),
    path('send_email_to_all', views.send_email_to_all, name='send_email_to_all')
] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)