from django.shortcuts import render
from booking.models import Pack

# Create your views here.
def index(request):
    packs = Pack.objects.all()
    return render(request, 'paginas/index.html',{
        'packs':packs,
    })