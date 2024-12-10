from django.contrib import admin
from .models import Cliente, Producto, Categoria, Carrito, Pedido, SpinnerImage
from django import forms
from django.contrib.auth.models import User

# --- Configuración de Administración para Categorías ---
@admin.register(Categoria)
class CategoriaAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'descripcion')
    search_fields = ('nombre',)


# --- Configuración de Administración para Productos ---
@admin.register(Producto)
class ProductoAdmin(admin.ModelAdmin):
    list_display = ('titulo', 'categoria', 'precio', 'stock')
    search_fields = ('titulo', 'categoria__nombre')
    list_filter = ('categoria',)


# --- Configuración de Administración para Carrito ---
@admin.register(Carrito)
class CarritoAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'producto', 'cantidad')


# --- Configuración de Administración para Clientes ---
@admin.register(Cliente)
class ClienteAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'telefono', 'direccion', 'rut', 'total_pagar', 'estado_compra')
    search_fields = ('usuario__username', 'rut', 'direccion')
    list_filter = ('estado_compra', 'estado_pedido')


# --- Formulario de Registro ---
class RegistroClienteForm(forms.Form):
    username = forms.CharField(
        max_length=150,
        label="Nombre de usuario",
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese su nombre de usuario'}),
    )
    email = forms.EmailField(
        label="Correo electrónico",
        widget=forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese su correo electrónico'}),
    )
    password = forms.CharField(
        widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese su contraseña'}),
        label="Contraseña",
    )
    telefono = forms.CharField(
        max_length=15,
        required=False,
        label="Teléfono",
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese su teléfono'}),
    )
    direccion = forms.CharField(
        required=False,
        label="Dirección",
        widget=forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Ingrese su dirección'}),
    )
    rut = forms.CharField(
        max_length=12,
        required=False,
        label="RUT",
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese su RUT'}),
    )


# --- Configuración de Administración para Pedidos ---
@admin.register(Pedido)
class PedidoAdmin(admin.ModelAdmin):
    list_display = ('codigo_pedido', 'usuario', 'total', 'estado', 'confirmado_pago', 'direccion')
    list_filter = ('estado', 'confirmado_pago')
    search_fields = ('codigo_pedido', 'usuario__username', 'estado')


# --- Configuración de Administración para SpinnerImage ---
@admin.register(SpinnerImage)
class SpinnerImageAdmin(admin.ModelAdmin):
    list_display = ('title', 'description')


# --- Personalización del Panel de Administración ---
admin.site.site_header = "Administración del Sistema"
admin.site.site_title = "Administración Cafetería"
admin.site.index_title = "Panel de Administración"
