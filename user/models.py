from django.db import models
from django.contrib.auth.models import AbstractUser
from django import forms


# Create your models here.
class User(AbstractUser):
    dni = models.CharField(max_length=15)
    direccion = models.CharField(max_length=255)
    fecha_nacimiento = models.DateTimeField(null=True, blank=True)
    telefono = models.CharField(max_length=20)

    class Meta:
        verbose_name_plural = 'Usuarios'
        db_table = 'auth_user'

class PuestoEmpleado(models.Model):
    p_emp_nombre = models.CharField(max_length=20)
    p_emp_descripcion = models.CharField(max_length=50, help_text='Nombre del Cargo')

    def __str__(self):
        return self.p_emp_nombre
    
    class Meta:
        verbose_name_plural = 'Puesto Empleados'
    
class Empleado(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    p_emp = models.ForeignKey(PuestoEmpleado, on_delete=models.CASCADE)

    def __str__(self):
        return f'{self.p_emp} {self.user}'
    
    class Meta:
        verbose_name_plural = 'Empleados'

class Cliente(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.user.username
    
    class Meta:
        verbose_name_plural = 'Clientes'

class CountEmails(models.Model):
    user=models.CharField(max_length=50)
    email=models.CharField(max_length=50)
    asunto=models.CharField(max_length=50)
    fecha=models.DateTimeField(auto_now=True)

class DateFilterForm(forms.Form):
    start_date = forms.DateField(label='Fecha de inicio', widget=forms.DateInput(attrs={'type': 'date'}))
    end_date = forms.DateField(label='Fecha de fin', widget=forms.DateInput(attrs={'type': 'date'}))
