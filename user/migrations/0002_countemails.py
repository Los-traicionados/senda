# Generated by Django 4.0.4 on 2023-11-08 17:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='CountEmails',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user', models.CharField(max_length=50)),
                ('email', models.CharField(max_length=50)),
                ('asunto', models.CharField(max_length=50)),
                ('fecha', models.DateTimeField(auto_now=True)),
            ],
        ),
    ]
