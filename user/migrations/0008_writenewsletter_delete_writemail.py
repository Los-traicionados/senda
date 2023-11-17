# Generated by Django 4.0.4 on 2023-11-14 14:53

from django.db import migrations, models
import django_quill.fields


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0007_rename_name_writemail_title_alter_writemail_content'),
    ]

    operations = [
        migrations.CreateModel(
            name='WriteNewsletter',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('subject', models.CharField(max_length=50)),
                ('title', models.CharField(max_length=50)),
                ('introduction', django_quill.fields.QuillField()),
                ('subtitle', models.CharField(max_length=50)),
                ('content', django_quill.fields.QuillField()),
            ],
        ),
        migrations.DeleteModel(
            name='WriteMail',
        ),
    ]