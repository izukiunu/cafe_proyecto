from django.db import models
from django.contrib.auth.models import User

# --- Modelos de Usuarios y Clientes ---
class Cliente(models.Model):
    usuario = models.OneToOneField(User, on_delete=models.CASCADE, related_name='cliente')
    telefono = models.CharField(max_length=15, blank=True, null=True)
    direccion = models.CharField(max_length=255, blank=True, null=True)
    rut = models.CharField(max_length=20, blank=True, null=True)

    def __str__(self):
        return self.usuario.username


# --- Modelo de Spinner (Datos del Carrusel) ---
class SpinnerItem(models.Model):
    image = models.ImageField(upload_to='spinner_images/')
    title = models.CharField(max_length=100)
    description = models.TextField()
    link = models.URLField(blank=True, null=True)

    def __str__(self):
        return self.title
    


