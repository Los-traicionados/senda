
from django.shortcuts import render, redirect

# Importaciones necesarias para login
from django.contrib.auth import  authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages
# Importaciones para modelos
from .models import *
from booking.models import *
# email
import smtplib
from senda.settings import *
from email.mime.text import MIMEText
from django.template import loader
from django.template import RequestContext
from django.http import HttpResponse
from django.template.loader import render_to_string
from email.mime.multipart import MIMEMultipart
from .forms import *

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

@login_required
def perfil(request):
    return render(request, 'paginas/perfil.html')


""" def mailing(request):
    count_emails=CountEmails.objects.all().order_by('-fecha', 'user')
    return render(request, 'paginas/mailing.html', {'count_emails': count_emails})
 """
def registro(request):
    if request.method =='POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        password2 = request.POST.get('password2')
        email = request.POST.get('email')
        first_name = request.POST.get('nombre')
        last_name = request.POST.get('apellidos')

        if password == password2 :
            user = User.objects.create_user(
                username=username, 
                email=email,
                first_name=first_name,
                last_name=last_name,
            )
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

@login_required
def tus_reservas(request):
    reservas = Reserva.objects.filter(client__user = request.user).order_by('-id')
    return render(request, 'paginas/tus-reservas.html', {'reservas':reservas})

@login_required
def tus_favoritos(request):
    return render(request, 'paginas/tus-favoritos.html')

@login_required
def recomendaciones(request):
    return render(request, 'paginas/recomendaciones.html')

@login_required
def send_email_to_all(request):
    count_emails = None

    if request.method == 'POST':
        form = EmailForm(request.POST)
        if form.is_valid():
            start_date = form.cleaned_data['start_date']
            end_date = form.cleaned_data['end_date']
            template_name = form.get_template_filename()  # Obtén el nombre de la plantilla

            users = User.objects.filter(date_joined__range=(start_date, end_date))

        # Send emails to filtered users
            for user in users:
                if user.email:
                    
                    template_path = f'mailing/{template_name}.html'
                    
                    try:
                        send_email(user.id, template_name, template_path)
                        CountEmails.objects.create(user=user.username, email=user.email)
                       
                    except Exception as e:
                    # Log the error
                        print(f"An error occurred: {template_path}")
                    # Redirect to an error page or back to the form with an error message
                        return render(request, 'paginas/error_page.html', {'error_message': 'An error occurred while sending emails.'})

        # Retrieve and display count emails
        count_emails = CountEmails.objects.all()
        messages.add_message(request, messages.SUCCESS, 'Mensajes envidados')
        return redirect('mailing')
    else:
        return redirect('mailing')
    

def send_email(user_id, template_name, template_path):
    try:
        user=User.objects.get(pk=user_id)
        mailServer = smtplib.SMTP(EMAIL_HOST, EMAIL_PORT)
        mailServer.ehlo()
        mailServer.starttls()
        mailServer.ehlo()
        mailServer.login(EMAIL_HOST_USER, EMAIL_HOST_PASSWORD)
        
        email_to = user.email
        mensaje = MIMEMultipart()
        mensaje['From']= EMAIL_HOST_USER
        mensaje['To']= email_to

        subject = ''
       
        writeNewsletter=None
        writeOferta=None
        if template_name == 'newsletter':
            writeNewsletter = WriteNewsletter.objects.get(pk=1)
            subject = writeNewsletter.subject
            
        elif template_name == 'mail_entrada':
            subject = 'Tienes una nueva entrada'
        elif template_name == 'ofertas':
            subject = 'Ofertón'
            writeOferta = WriteOferta.objects.get(pk=1)
        elif template_name == 'reserva_realizada':
            subject = 'Tienes una nueva reserva'
        elif template_name == 'cumpleaños':
            subject = '¡Feliz Cumpleaños!'
        elif template_name == 'nuevo_registro':
            subject = '¡Bienvenido a Senda!'

        mensaje['Subject'] = subject

        context = {
            'user': user,
            'writeOferta': writeOferta,
            'writeNewsletter': writeNewsletter,
           
        }

        # Renderizar la plantilla con el contexto
        rendered_content = render_to_string(template_path, context)

        # Adjuntar el contenido al mensaje
        mensaje.attach(MIMEText(rendered_content, 'html'))

        # Envío del mensaje
        mailServer.sendmail(EMAIL_HOST_USER, email_to, mensaje.as_string())

        print("Correo enviado correctamente")

    except Exception as e:
        print("An error occurred2:", e)


@login_required
def mailing_view(request):
    count_emails = CountEmails.objects.all()
    print('Count: ', count_emails)
    return render(request, 'paginas/mailing.html', {'count_emails': count_emails})
    #return render(request, 'paginas/mailing.html')


def customizeEmail_view(request):
    count_emails = CountEmails.objects.all()
    print('Count: ', count_emails)
    if request.method == 'POST':
        form = EmailForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('success')  # Redirect to a success page
    else:
        form = EmailForm()
    return render(request, 'paginas/mailing.html', {
        'form': form,
        'count_emails': count_emails,
    })

def success_view(request):
    return render(request, 'paginas/success.html')



def test_template_render(request):
    writeNewsletter = WriteNewsletter.objects.get(pk=1)
    return render(request, 'mailing/newsletter.html', {'writeNewsletter': writeNewsletter})
    