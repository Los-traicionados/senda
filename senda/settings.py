"""
Django settings for senda project.

Generated by 'django-admin startproject' using Django 4.0.4.

For more information on this file, see
https://docs.djangoproject.com/en/4.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/4.0/ref/settings/
"""

from pathlib import Path
import os

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-^4gf6b35uh)o93%f7)8cd#s&_cd2_g@r6mb4#6bx@08d1wmhfr'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'home',
    'user',
    'booking',
    'django_quill',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

# Configuraciones basicas para establecer la duracion de las sessiones 
SESSION_ENGINE = 'django.contrib.sessions.backends.cache'
SESSION_COOKIE_AGE = 3600  # Duración en segundos (1 hora)
SESSION_SAVE_EVERY_REQUEST = True

ROOT_URLCONF = 'senda.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': ['templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'booking.context_processor.total_carrito',
            ],
        },
    },
]

WSGI_APPLICATION = 'senda.wsgi.application'

STATIC_URL = '/static/'
#STATIC_ROOT = os.path.join(BASE_DIR, 'static')
STATICFILES_DIRS = (os.path.join(BASE_DIR, 'static/'),)

MEDIA_ROOT = os.path.join(BASE_DIR, 'img')
MEDIA_URL = '/img/'
LOGIN_URL = 'login'
# Database
# https://docs.djangoproject.com/en/4.0/ref/settings/#databases

import pymysql

pymysql.version_info=(1,4,6,'final',0)
pymysql.install_as_MySQLdb()
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'db_senda',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': 3306,
    }
}

AUTH_USER_MODEL = 'user.User'
#######Con
# Password validation
# https://docs.djangoproject.com/en/4.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/4.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.0/howto/static-files/

STATIC_URL = 'static/'

# Default primary key field type
# https://docs.djangoproject.com/en/4.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# Email


EMAIL_HOST = 'smtp.gmail.com'

EMAIL_HOST_USER = 'infosenda42@gmail.com'

EMAIL_HOST_PASSWORD = 'ozlaqewfyaogcijh' 

EMAIL_PORT = 587

EMAIL_USE_TLS = True

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

