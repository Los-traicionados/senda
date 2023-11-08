
from django.shortcuts import render, redirect

# Importaciones necesarias para login
from django.contrib.auth import  authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages

# email
from .models import *
# from django.core.mail import send_mail
import smtplib
from senda.settings import *
from email.mime.text import MIMEText

# Create your views here.
def login_view(request):
    if request.user.is_authenticated:
        return redirect('index')
    else:
        if request.method == 'POST':
            username = request.POST.get('username')
            password = request.POST.get('password')
            user = authenticate(request, username=username, password=password)
            if user:
                login(request, user)
                return redirect('perfil')
            else:
                messages.add_message(request, messages.ERROR, 'Username o contraseña incorrectos')
        else:
            return render(request, 'paginas/login.html')
    return render(request, 'paginas/login.html')

@login_required
def logout_view(request):
    logout(request)
    return redirect('index')

def perfil(request):
    return render(request, 'paginas/perfil.html')

def registro(request):
    print("----")
    send_email()
    print("----")
    if request.method =='POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        password2 = request.POST.get('password2')
        email = request.POST.get('email')
        if password == password2 :
            user = User.objects.create_user(username=username, email=email)
            user.set_password(password2)
            user.is_activate = True
            user.save()
            
            user = authenticate(request, username=username, password=password)
            if user:
                login(request, user)
                return redirect('perfil')
        else:
            messages.add_message(request, messages.ERROR, 'Contraseñas no coinciden')
            
    return render(request, 'paginas/registro.html')

def send_email():
    try:
        mailServer = smtplib.SMTP(EMAIL_HOST, EMAIL_PORT)
        mailServer.ehlo()
        mailServer.starttls()
        mailServer.ehlo()
        mailServer.login(EMAIL_HOST_USER, EMAIL_HOST_PASSWORD)

        # Construimos el mensaje simple
        email_to = "elenajiangholaaa@gmail.com"
        # mensaje = MIMEText("""Este es el mensaje de las narices""")
        mensaje = MIMEMultipart()
        mensaje['From']= EMAIL_HOST_USER
        mensaje['To']= email_to
        mensaje['Subject']="Tienes un correo"

        # render_to_string

        # Envio del mensaje
        mailServer.sendmail(EMAIL_HOST_USER,
                email_to,
                mensaje.as_string())
        print("correo enviado correctamente")

    except Exception as e:
        print(e)


