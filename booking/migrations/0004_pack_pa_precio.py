# Generated by Django 4.0.4 on 2023-11-15 08:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('booking', '0003_vuelo_vu_imagen'),
    ]

    operations = [
        migrations.AddField(
            model_name='pack',
            name='pa_precio',
            field=models.DecimalField(blank=True, decimal_places=2, max_digits=10, null=True, verbose_name='Precio pack'),
        ),
    ]
