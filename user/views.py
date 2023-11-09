
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
from django.template import loader
from django.template import RequestContext
from django.http import HttpResponse
from django.template.loader import render_to_string
from senda.asgi import *
from email.mime.multipart import MIMEMultipart

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
    count_emails=CountEmails.objects.all().order_by('-fecha', 'user')
    return render(request, 'paginas/perfil.html', {'count_emails': count_emails})

def registro(request):
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
            send_email(user.id)
            user = authenticate(request, username=username, password=password)
            if user:
                login(request, user)
                return redirect('perfil')
        else:
            messages.add_message(request, messages.ERROR, 'Contraseñas no coinciden')
            
    return render(request, 'paginas/registro.html')

""" def send_email_to_all(request):
    form = DateFilterForm(request.POST or None)

    if request.method == 'POST' and form.is_valid():
        start_date = form.cleaned_data['start_date']
        end_date = form.cleaned_data['end_date']
    
    # Filtra usuarios por fecha de registro
        users = User.objects.filter(date_joined__range=(start_date, end_date))
    
    # enviar emails a todos registrados 
    else:
        user=User.objects.all()

    for i in user:
        if i.email:
            send_email(i.id)
            CountEmails.objects.create(user=i.username, email=i.email, asunto="test")
    # return redirect("perfil")
    context = {'form': form}
    return render(request, 'paginas/perfil.html', context) """

def send_email_to_all(request):
    form = DateFilterForm(request.POST or None)
    count_emails = None

    if request.method == 'POST' and form.is_valid():
        start_date = form.cleaned_data['start_date']
        end_date = form.cleaned_data['end_date']

        # Filter users by registration date
        users = User.objects.filter(date_joined__range=(start_date, end_date))

        # Send emails to filtered users
        for user in users:
            if user.email:
                send_email(user.id)
                CountEmails.objects.create(user=user.username, email=user.email, asunto="test")

        # Retrieve and display count emails
        count_emails = CountEmails.objects.all()
    return redirect('perfil')

def send_email(user_id):
    try:
        user=User.objects.get(pk=user_id)
        mailServer = smtplib.SMTP(EMAIL_HOST, EMAIL_PORT)
        mailServer.ehlo()
        mailServer.starttls()
        mailServer.ehlo()
        mailServer.login(EMAIL_HOST_USER, EMAIL_HOST_PASSWORD)

        # Construimos el mensaje simple
        email_to = user.email
        # mensaje = MIMEText("""Este es el mensaje de las narices""")
        mensaje = MIMEMultipart()
        mensaje['From']= EMAIL_HOST_USER
        mensaje['To']= email_to
        mensaje['Subject']="Tienes un correo"

        content = render_to_string('mailing/mail_entrada.html', {'user':user})
        mensaje.attach(MIMEText(content, 'html'))

        # Envio del mensaje
        mailServer.sendmail(EMAIL_HOST_USER,
                email_to,
                mensaje.as_string())
        print("correo enviado correctamente")

    except Exception as e:
        print(e)


