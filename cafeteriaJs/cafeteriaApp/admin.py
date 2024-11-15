from django.contrib import admin
from .models import Usuario, Cliente, Menu, Venta, Orden

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

admin.site.register(Usuario, UsuarioAdmin)
admin.site.register(Cliente, ClienteAdmin)
admin.site.register(Menu, MenuAdmin)
admin.site.register(Orden, OrdenAdmin)
admin.site.register(Venta, VentaAdmin)
