from django.urls import path
from . import views

urlpatterns = [
    path('packs', views.packs, name='packs'),
    path('pack/<int:id>/', views.packs, name='packs'),
    path('cart', views.cart, name='cart'),


]