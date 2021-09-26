# Virtual Environment Create
```console
python -m venv env
```
# Activate Virtual Environment
```console
Source env/Scripts/activate
```
# Deactivate Virtual Environment
```console
deactivate
```
*Check All Installed Global Packages List (Global)*
NB: If Activating venv it will show the packages installed Inside Venv (Local)
```console
pip freeze
```
# Django Install#
```console
pip install django			//Installs the latest Version
pip install django==3.1	//Installs django version 3.1
```
# PIP Upgrade if required 
```console
python -m pip install --upgrade pip 
```
# Create Django Project Inside Current Directory
```console
django-admin startproject greatkart .     // dot used for current Directory
```
# Run Django Project Server 
```console
python manage.py runserver
```
# DJANGO DIRECTORY STRUCTURE
```
GreatKart ------------> root Folder/Project
    -env--------------> Virtual Environment/packages
    -greatkart--------> Project Level/Root Apps
        --static------> template css,js,images,fonts
        --asgi.py-----> async Python web servers and applications
        --settings.py-> Project Settings
        --urls.py-----> Root Url File
        --views.py----> Root Views File
        --wsgi.py-----> Python standard for web servers and applications.
    -static-----------> Auto Created from CollectStatic
        --admin------->     ||
        --css--------->     ||
        --fonts------->     ||
        --images------>     ||
        --js---------->     ||
    -templates--------> template html files
    -media------------> Media Files Storage
    -db.sqlite3-------> Database File
    -manage.py--------> Commnad Line Utility Interacts With Django Projects
    -APP-1------------> 1st App
    --------------------------
    -APP-N------------> Nth App
```
# TEMPLATE/View
### HTML Tag or Text Render
```python
return HttpResponse("String or Tag Goes Here")
```
### HTML Template Render
```python
return render(response,"home.html")
```
### Template Setting (Template Folder Inside Parent Folder)
> Settings>TEMPLATES>DIRS
```python
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
            ],
        },
    },
]
```
### For Working CSS, JS, IMAGE, LOGO Have to Create Static Folder (Project Level Folder) and put css,js,fonts,images inside that
```
GreatKart>greatkart>static
```
# Static Folder Setting
> Settings.py
```python
STATIC_URL = '/static/'
STATIC_ROOT = BASE_DIR / 'static'
STATICFILES_DIR = [
    'greatkart/static',
]
```
# Static Package Installation Command
```console
python manage.py collectstatic
```
* NB: This will create another static folder in the root directory with admin folder. *

# Load Static to use above html files
```python
{% load static %}
```
# Static Files src and href Linking
```python
<link href="{% static 'images/logo.png' %}" -------------------->
<script src="{% static 'js/script.js' %}"   -----------></script>
<link href="{% static 'css/style.css' %}"   -------------------/>
```
# BLOCK CONTENT, EXTEND, LOAD STATIC
> home.html file
```python
    {% extends 'base.html' %}
    {% load static %}

    {% block content %}
        ---contents to create block---
    {% endblock }
```
> base.html file
```python
    {% include 'includes/navbar.html' %}

    {% block content %}
        --contents to be loaded here--
    {% endblock %}

    {% include 'includes/footer.html' %}
```
> Common File Section Include
```python
    {% include 'includes/navbar.html' %}
    {% include 'includes/footer.html' %}
```
# MODEL CREATION
```python
ImageField(upload_to='photos/categories',blank=True)
```
# Required Package install "Pillow"
```console
python -m pip install pillow
```
# Model Creation 
* makemigrations auto generates migration files containing changes that need to be applied to the database, but doesn’t actually change anyhting in your database. *
```console
python manage.py makemigrations
```
* migrate will make the actual modifications to your database, based on the migration files. *
```console
python manage.py migrate
```
# Model Structure
```python
from django.db import models

class Category(models.Model):
    category_name = models.Charfield(max_length=50,unique=True)
    slug          = models.CharField(max_length=100,blank=True)
    description   = models.TextField(max_length=255)
    cat_imag      = models.ImageField(upload_to='photos/categories',blank=True)

    class Meta:
        verbose_name        = 'category'
        verbose_name_plural = 'categories'

    def __str__(self):
        return self.category_name
```
*NB: Class Meta is used to avoid naming problem(Singular/Plural) of table names in admin panel/Database
Example : Category which will be written as Categorys (Adding 's' at the end but this is wrong)
          Hence have to use class Meta (verbose_name and verbose_name_plural)
*
# MODEL ADMIN REGISTER 
> admin.py
```python
    from category.models import Category
    from django.contrib import admin

    # Register your models here.
    admin.site.register(Category)
```
# ADMIN SUPERUSER CREATE
> CMD
```console
python manage.py createsuperuser
```
> Gitbash CMD
```console
winpty python manage.py createsuperuser
```
# CATEGORY |ADMIN SLUG AUTO POPULATE 
```python
from category.models import Category
from django.contrib import admin

# Register your models here.

class CategoryAdmin(admin.ModelAdmin):
    prepopulated_fields={'slug':('category_name',)}
    list_display=('category_name','slug')

admin.site.register(Category,CategoryAdmin)
```
# FOREIGN KEY AUTO UPDATE ON DELETE

```python
category        = models.ForeignKey(Category, on_delete=models.CASCADE)
```