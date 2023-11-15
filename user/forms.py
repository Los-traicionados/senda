from django import forms

TEMPLATE_CHOICES = [
    ('mail_entrada', 'mail_entrada'),
    ('cumpleaños', 'cumpleaños'),
    ('ofertas', 'ofertas'),
    ('newsletter', 'newsletter'),
    ('nuevo_registro', 'nuevo_registro'),
    ('reserva_realizada', 'reserva_realizada'),
]

""" def get_template_filename(template_choice):
    template_mapping = {
        ('template1', 'mail_entrada'),
        ('template2', 'cumpleaños'),
        ('template3', 'ofertas'),
        ('template4', 'newsletter'),
        ('template5', 'nuevo_registro'),
        ('template6', 'reserva_realizada'),
    }
    default_template = 'mail_entrada.html'  # Replace with your actual default template

    template_filename = template_mapping.get(template_choice, default_template)

    if template_filename == default_template:
        raise ValueError(f"No template found for choice: {template_choice}")

    return template_filename """

def get_template_filename(self):
    selected_template = self.cleaned_data['template']
    if selected_template == 'template1':
        return 'mail_entrada.html'
    elif selected_template == 'template2':
        return 'cumpleaños.html'
    elif selected_template == 'template3':
        return 'ofertas.html'
    elif selected_template == 'template4':
        return 'newsletter.html'
    elif selected_template == 'template5':
        return 'nuevo_registro.html'
    elif selected_template == 'template6':
        return 'reserva_realizada.html'
    else:
        return None  # Or return a default template name if the selected template isn't recognized


class EmailForm(forms.Form):
    start_date = forms.DateField(label='Fecha de inicio', widget=forms.DateInput(attrs={'type': 'date'}))
    end_date = forms.DateField(label='Fecha de fin', widget=forms.DateInput(attrs={'type': 'date'}))
    """ subject = forms.CharField(max_length=100)
    content = forms.CharField(max_length=500) """
    template = forms.ChoiceField(
        choices=TEMPLATE_CHOICES,
        initial='Elegir templete',  # You can set the initial template if needed
        widget=forms.Select(attrs={'class': 'custom-class'}),  # Set widget attributes
    )
    
    def get_template_filename(self):
        selected_template = self.cleaned_data['template']
        return selected_template
