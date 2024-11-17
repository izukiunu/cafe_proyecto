from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from cafeteriaApp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('pagina principal', views.index, name='index'),  # Ruta para la página principal
    path('login/', views.login, name='login'),
    path('pag_cajero/', views.pag_cajero, name='pag_cajero'),
    path('pag_cocinero/', views.pag_cocinero, name='pag_cocinero'),
    path('crear_orden/', views.crear_orden, name="crear_orden"),
    path('crear_cliente/', views.crear_cliente, name="crear_cliente"),
    path('ver_cliente/', views.ver_cliente, name="ver_cliente"),
    path('crear_menu/', views.crear_menu, name="crear_menu"),
    path('crear_venta/', views.crear_venta, name="crear_venta"),
    path('ver_menu/', views.ver_menu, name="ver_menu"),
    path('ver_orden/', views.ver_orden, name="ver_orden"),
    path('boleta/<int:venta_id>/', views.boleta, name='boleta'),
    path('ver_venta/', views.ver_venta, name='ver_venta'),
    path('modificar_cliente/<int:cliente_id>/', views.modificar_cliente, name='modificar_cliente'),
    path('modificar_orden/<int:orden_id>/', views.modificar_orden, name='modificar_orden'),
    path('otro_template/<int:orden_id>/', views.otro_template, name='otro_template'),
]

# Agregar rutas para archivos de medios en desarrollo
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
