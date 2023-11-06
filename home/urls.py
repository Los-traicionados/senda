from django.urls import path
from . import views
from django.conf import settings
from django.contrib.staticfiles.urls import static

urlpatterns = [
    path('', views.index, name='index'),
    path('about', views.about, name='about'),

] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)