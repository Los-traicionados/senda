from django import forms

TEMPLATE_CHOICES = [
    ('template1', 'mail_entrada'),
    ('template2', 'cumpleaños'),
    ('template3', 'ofertas'),
    ('template4', 'newsletter'),
    ('template4', 'nuevo_registro'),
    ('template4', 'reserva_realizada'),
]

def get_template_filename(template_choice):
    template_mapping = {
        'template1': 'mailing_entrada.html',
        'template2': 'cumpleaños.html',
        'template3': 'ofertas.html',
        'template4': 'newsletter.html',
        # Add more mappings as needed
    }
    default_template = 'mail_entrada.html'  # Replace with your actual default template

    template_filename = template_mapping.get(template_choice, default_template)

    if template_filename == default_template:
        raise ValueError(f"No template found for choice: {template_choice}")

    return template_filename

class EmailForm(forms.Form):
    start_date = forms.DateField(label='Fecha de inicio', widget=forms.DateInput(attrs={'type': 'date'}))
    end_date = forms.DateField(label='Fecha de fin', widget=forms.DateInput(attrs={'type': 'date'}))
    """ subject = forms.CharField(max_length=100)
    content = forms.CharField(max_length=500) """
    template = forms.ChoiceField(
        choices=TEMPLATE_CHOICES,
        initial='template1',  # You can set the initial template if needed
        widget=forms.Select(attrs={'class': 'custom-class'}),  # Set widget attributes
    )
    
    def get_template_filename(self):
        return get_template_filename(self.cleaned_data['template'])
