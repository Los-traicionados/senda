from django.test import TestCase
import smtplib
import os

os.environ['DJANGO_SETTINGS_MODULE'] = 'senda.settings'

# Import settings after setting DJANGO_SETTINGS_MODULE
from django.conf import settings


