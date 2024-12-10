from django.contrib import admin
from .models import Cliente, SpinnerItem

# --- Configuración de Administración para Clientes ---
@admin.register(Cliente)
class ClienteAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'telefono', 'direccion', 'rut')
    search_fields = ('usuario__username', 'rut', 'direccion')

# --- Configuración de Administración para Spinner Items ---
@admin.register(SpinnerItem)
class SpinnerItemAdmin(admin.ModelAdmin):
    list_display = ('title', 'description', 'link')
    search_fields = ('title', 'description')

# --- Personalización del Panel de Administración ---
admin.site.site_header = "Administración del Sistema"
admin.site.site_title = "Administración Cafetería"
admin.site.index_title = "Panel de Administración"
