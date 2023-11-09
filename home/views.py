from django.shortcuts import render
from booking.models import Pack

# Create your views here.
def index(request):
    packs = Pack.objects.all()
    return render(request, 'paginas/index.html',{
        'packs':packs,
    })

def about(request):
    return render(request, 'paginas/about.html')

def productos(request):
    return render(request, 'paginas/productos.html')

def producto_tipo(request):
    return render(request, 'paginas/producto_tipo.html')