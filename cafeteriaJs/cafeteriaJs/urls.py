"""
URL configuration for eva03_sushi project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from cafeteriaApp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/',views.login, name='login'),
    path('pag_cajero/', views.pag_cajero, name='pag_cajero'),
    path('pag_cocinero/', views.pag_cocinero, name='pag_cocinero'),
    path('crear_orden/',views.crear_orden, name="crear_orden"),
    path('crear_cliente/',views.crear_cliente, name="crear_cliente"),
    path('ver_cliente/',views.ver_cliente, name="ver_cliente"),
    path('crear_menu/',views.crear_menu, name="crear_menu"),
    path('crear_venta/',views.crear_venta, name="crear_venta"),
    path('ver_menu/',views.ver_menu, name="ver_menu"),
    path('ver_orden/',views.ver_orden, name="ver_orden"),
    path('boleta/<int:venta_id>/', views.boleta, name='boleta'),
    path('ver_venta/',views.ver_venta, name='ver_venta'),
    path('modificar_cliente/<int:cliente_id>/', views.modificar_cliente, name='modificar_cliente'),
    path('modificar_orden/<int:orden_id>/', views.modificar_orden, name='modificar_orden'),
    path('otro_template/<int:orden_id>/', views.otro_template, name='otro_template'),
]
    # ... (otras URL)
    