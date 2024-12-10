from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from cafeteriaApp import views
from cafeteriaApp.views import iniciar_sesion, registro, completar_perfil

urlpatterns = [
    # Página predeterminada
    path('', views.index, name='pagina_principal'),  # Página principal como default

    # Ruta para la administración
    path('admin/', admin.site.urls),

    # Rutas principales
    path('pagina_principal/', views.index, name='index'),
    path('login/', iniciar_sesion, name='iniciar_sesion'),
    path('logout/', views.cerrar_sesion, name='cerrar_sesion'),
    path('registro/', registro, name='registro'),

    # Perfil y configuraciones
    path('mi_perfil/', views.mi_perfil, name='mi_perfil'),
    path('completar_perfil/', completar_perfil, name='completar_perfil'),
    path('configuraciones/', views.configuraciones, name='configuraciones'),
    path('configuraciones/guardar/', views.guardar_configuraciones, name='guardar_configuraciones'),
    path('modificar_perfil/', views.modificar_perfil, name='modificar_perfil'),

    # Categorías y productos
    path('productos/<int:categoria_id>/', views.listar_productos, name='listar_productos'),
    path('categorias/', views.listar_categorias, name='listar_categorias'),
    path('productos/<int:categoria_id>/', views.listar_productos, name='listar_productos_por_categoria'),
    path('productos/', views.listar_productos, name='listar_productos'),

    # Carrito
    path('carrito/', views.mostrar_carrito, name='mostrar_carrito'),
    path('carrito/agregar/', views.agregar_al_carrito, name='agregar_al_carrito'),
    path('carrito/detalle/', views.ver_carrito, name='ver_carrito'),
    path('carrito/agregar/', views.agregar_al_carrito, name='agregar_al_carrito'),
    path("carrito/finalizar/", views.finalizar_compra, name="finalizar_compra"),
    path('carrito/eliminar/', views.eliminar_del_carrito, name='eliminar_del_carrito'),
    path('carrito/cantidad/', views.cantidad_productos_carrito, name='cantidad_productos_carrito'),
    path('historial-pedidos/', views.historial_pedidos, name='historial_pedidos'),

    # Debug toolbar (solo en desarrollo)
    path('__debug__/', include('debug_toolbar.urls')),
]

# Rutas para archivos estáticos y medios en desarrollo
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
