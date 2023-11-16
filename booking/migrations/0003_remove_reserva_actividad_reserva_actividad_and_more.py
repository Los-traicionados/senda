# Generated by Django 4.0.4 on 2023-11-15 22:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('booking', '0002_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='reserva',
            name='actividad',
        ),
        migrations.AddField(
            model_name='reserva',
            name='actividad',
            field=models.ManyToManyField(to='booking.actividad'),
        ),
        migrations.RemoveField(
            model_name='reserva',
            name='hotel',
        ),
        migrations.AddField(
            model_name='reserva',
            name='hotel',
            field=models.ManyToManyField(to='booking.hotel'),
        ),
        migrations.RemoveField(
            model_name='reserva',
            name='pack',
        ),
        migrations.AddField(
            model_name='reserva',
            name='pack',
            field=models.ManyToManyField(to='booking.pack'),
        ),
        migrations.RemoveField(
            model_name='reserva',
            name='vuelo',
        ),
        migrations.AddField(
            model_name='reserva',
            name='vuelo',
            field=models.ManyToManyField(to='booking.vuelo'),
        ),
    ]
