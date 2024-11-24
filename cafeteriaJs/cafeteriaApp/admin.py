from django.contrib import admin
from .models import Usuario, Cliente, Menu, Venta, Orden
from django.contrib import admin
from .models import SpinnerItem
from .models import Categoria, Producto

# Register your models here.
class UsuarioAdmin(admin.ModelAdmin):
    list_display = ['nombre', 'password_usuario', 'tipo_usuario']

class ClienteAdmin(admin.ModelAdmin):
    list_display = ['id', 'nombre', 'apellido', 'correo', 'calle_direccion', 'calle_numero', 'telefono']

class MenuAdmin(admin.ModelAdmin):
    list_display = ['id', 'm_nombre', 'm_precio', 'm_stock', 'cantidad_piezas']

class OrdenAdmin(admin.ModelAdmin):
    list_display = ['cod_orden', 'fk_cliente', 'fk_menu']

class VentaAdmin(admin.ModelAdmin):
    list_display = ['id', 'fecha', 'hora', 'fk_orden', 'total_original', 'total_final', 'total_descuento', 'fk_cliente']

@admin.register(SpinnerItem)
class SpinnerItemAdmin(admin.ModelAdmin):
    list_display = ('title', 'description', 'link')

admin.site.register(Usuario, UsuarioAdmin)
admin.site.register(Cliente, ClienteAdmin)
admin.site.register(Menu, MenuAdmin)
admin.site.register(Orden, OrdenAdmin)
admin.site.register(Venta, VentaAdmin)

from .models import Categoria, Producto

@admin.register(Categoria)
class CategoriaAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'descripcion')
    search_fields = ('nombre',)


@admin.register(Producto)
class ProductoAdmin(admin.ModelAdmin):
    list_display = ('titulo', 'categoria', 'precio', 'get_stock_display')
    search_fields = ('titulo', 'categoria__nombre')
    list_filter = ('categoria', 'stock_ilimitado')
    fieldsets = (
        (None, {
            'fields': ('titulo', 'categoria', 'descripcion', 'precio', 'imagen')
        }),
        ('Opciones de Stock', {
            'fields': ('stock', 'stock_ilimitado'),
            'description': 'Si seleccionas "Stock ilimitado", no es necesario definir un stock numérico.'
        }),
    )