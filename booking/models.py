from django.db import models
from user.models import Cliente, Empleado
# Create your models here.

class Hotel(models.Model):
    ho_nombre = models.CharField(max_length=50, verbose_name='Hotel')
    ho_direccion = models.CharField(max_length=255, verbose_name='Dirección')
    ho_precio = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Precio Hotel')

    def __str__(self):
        return self.ho_nombre

    class Meta:
        verbose_name_plural = 'Hoteles'

class Vuelo(models.Model):
    vu_nombre = models.CharField(max_length=50, verbose_name='Vuelo')
    vu_precio = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Precio')
    vu_asiento = models.CharField(max_length=20, verbose_name='Asiento')

    def __str__(self):
        return self.vu_nombre

    class Meta:
        verbose_name_plural = 'Vuelos'

class Actividad(models.Model):
    act_nombre = models.CharField(max_length=50, verbose_name='Nombre de la Actividad', help_text='Andar a Caballo, Caminata guiada...')
    act_descripcion = models.CharField(max_length=255, verbose_name='Descripción de la actividad')
    act_precio = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Precio actividad')

    def __str__(self):
        return self.act_nombre

    class Meta:
        verbose_name_plural = 'Actividades'

class Pack(models.Model):
    vuelo = models.ForeignKey(Vuelo, on_delete=models.CASCADE, null=True, blank=True)
    hotel = models.ForeignKey(Hotel, on_delete=models.CASCADE, null=True, blank=True)
    actividad = models.ForeignKey(Actividad, on_delete=models.CASCADE, null=True, blank=True)
    pa_nombre = models.CharField(max_length=50, verbose_name='Nombre del Pack')
    pa_descipcion = models.CharField(max_length=255, verbose_name='Descripción Pack')

    def __str__(self):
        return self.pa_nombre

    class Meta:
        verbose_name_plural = 'Packs'

class Reserva(models.Model):
    client = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    empleado = models.ForeignKey(Empleado, on_delete=models.CASCADE)
    pack = models.ForeignKey(Pack, on_delete=models.CASCADE)
    res_f_inicio = models.DateTimeField(null=True, blank=True)
    res_f_fin = models.DateTimeField(null=True, blank=True)
    res_precio = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Precio Reserva')

    def __str__(self):
        return f'{self.client} {self.pack}'

    class Meta:
        verbose_name_plural = 'Reservas'