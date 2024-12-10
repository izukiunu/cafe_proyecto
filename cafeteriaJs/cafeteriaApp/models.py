from django.db import models
from django.contrib.auth.models import User, AbstractBaseUser, BaseUserManager

# --- Gestor de Clientes ---
class ClienteManager(BaseUserManager):
    def create_user(self, username, email, password=None, **extra_fields):
        if not email:
            raise ValueError("El correo electrónico es obligatorio")
        email = self.normalize_email(email)
        user = self.model(username=username, email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, username, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        if not extra_fields.get('is_staff'):
            raise ValueError("El superusuario debe tener is_staff=True.")
        if not extra_fields.get('is_superuser'):
            raise ValueError("El superusuario debe tener is_superuser=True.")

        return self.create_user(username, email, password, **extra_fields)

# --- Modelo Cliente ---
class Cliente(models.Model):
    usuario = models.OneToOneField(User, on_delete=models.CASCADE, related_name='cliente')
    telefono = models.CharField(max_length=15, blank=True, default="Sin teléfono")
    direccion = models.TextField(null=True, default="Sin dirección")
    rut = models.CharField(max_length=12, null=True, default="Sin RUT")
    total_pagar = models.DecimalField(max_digits=10, decimal_places=2, default=0.0)
    estado_compra = models.CharField(
        max_length=50,
        choices=[('pendiente', 'Pendiente'), ('completado', 'Completado')],
        default='pendiente'
    )
    estado_pedido = models.CharField(
        max_length=50,
        choices=[('procesando', 'Procesando'), ('enviado', 'Enviado'), ('entregado', 'Entregado')],
        default='procesando'
    )

    def __str__(self):
        return self.usuario.username



# --- Modelo de Categorías ---
class Categoria(models.Model):
    nombre = models.CharField(max_length=100, unique=True)
    descripcion = models.TextField(blank=True, default="Sin descripción")
    imagen = models.ImageField(upload_to='categorias/', blank=True, null=True)

    def __str__(self):
        return self.nombre

# --- Modelo de Productos ---
class Producto(models.Model):
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE, related_name='productos')
    titulo = models.CharField(max_length=100)
    descripcion = models.TextField(blank=True, default="Sin descripción")
    precio = models.DecimalField(max_digits=10, decimal_places=2, default=0.0)
    imagen = models.ImageField(upload_to='productos/', blank=True, null=True)
    stock = models.PositiveIntegerField(default=0)

    def __str__(self):
        return self.titulo

# --- Modelo de Carrito ---
class Carrito(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE, related_name='carrito', default=1)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.PositiveIntegerField(default=1)

    def subtotal(self):
        return self.cantidad * self.producto.precio

    def __str__(self):
        return f"{self.usuario.username} - {self.producto.titulo}"


from django.db import models
from django.contrib.auth.models import User
from django.utils.crypto import get_random_string

def generar_codigo():
    return get_random_string(length=8).upper()

class Pedido(models.Model):
    ESTADOS_PEDIDO = [
        ('proceso', 'En Proceso'),
        ('camino', 'En Camino'),
        ('entregado', 'Entregado'),
    ]

    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    productos = models.TextField()  # Guardaremos los productos en formato JSON
    total = models.DecimalField(max_digits=10, decimal_places=2)
    direccion = models.CharField(max_length=255)
    rut = models.CharField(max_length=12)
    telefono = models.CharField(max_length=15)
    codigo_pedido = models.CharField(max_length=8, unique=True, default=generar_codigo)
    confirmado_pago = models.BooleanField(default=False)
    estado = models.CharField(
        max_length=20,
        choices=ESTADOS_PEDIDO,
        default='proceso',  # Valor predeterminado
    )

    def __str__(self):
        return f"Pedido {self.codigo_pedido} - {self.usuario.username} - {self.get_estado_display()}"

# models.py
from django.db import models

class SpinnerImage(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField(blank=True)
    image = models.ImageField(upload_to='spinner_images/')
    width = models.PositiveIntegerField(default=300)  # Tamaño fijo
    height = models.PositiveIntegerField(default=300)

    def __str__(self):
        return self.title