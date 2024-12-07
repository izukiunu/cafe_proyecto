from django.db import models

# Create your models here.
class Cliente(models.Model):
    nombre = models.CharField(max_length=30)
    apellido = models.CharField(max_length=30)
    correo = models.CharField(max_length=60)
    calle_direccion = models.CharField(max_length=90)
    calle_numero = models.CharField(max_length=10)
    telefono = models.CharField(max_length=12)

    def __str__(self):
        return f"{self.nombre} {self.apellido} - {self.calle_direccion} {self.calle_numero} - {self.telefono}"

# Clase Producto
class Menu(models.Model):
    m_nombre = models.CharField(max_length=30, blank=True)  # p_nombre para diferenciar que es de nombre de producto 
    m_detalle = models.CharField(max_length=255)
    m_precio = models.PositiveIntegerField(default=0)
    m_stock = models.PositiveIntegerField(default=0)
    cantidad_piezas = models.PositiveIntegerField(default=0)

    def __str__(self):
        return f"{self.m_nombre}, {self.m_precio}, {self.cantidad_piezas}"

# Las otras clases continúan aquí...

    
#Clase de venta


class Orden(models.Model):
    ESTADO_ORDEN = [
        ('abierto','Abierto'),
        ('cerrado', 'Cerrado'),
        ('cancelado', 'Cancelado'),
        ('tomado', 'Tomado')
        ]
    cod_orden=models.IntegerField()
    fk_cliente= models.ForeignKey(Cliente, on_delete=models.CASCADE)
    fk_menu=models.ForeignKey(Menu, on_delete=models.CASCADE)
    estado_orden=models.CharField(max_length=10,choices=ESTADO_ORDEN,blank=True)
    def __str__(self):
        return str(self.cod_orden)
    
class Venta(models.Model):
    fk_cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    fk_orden=models.ForeignKey(Orden, on_delete=models.CASCADE)
    fecha = models.DateField()
    hora = models.TimeField()
    total_original = models.PositiveIntegerField(default=0)
    total_descuento = models.PositiveIntegerField(default=0)
    total_final = models.IntegerField(default=0)
    def save(self, *args, **kwargs):
        # Calcular total_original sumando los precios de los menús con el mismo cod_orden
        self.total_original = Orden.objects.filter(cod_orden=self.fk_orden.cod_orden).aggregate(total=models.Sum('fk_menu__m_precio'))['total'] or 0
        # Establecer total_final igual a total_original
        self.total_final = self.total_original
        super().save(*args, **kwargs)

    def __str__(self):
        return f"{self.fk_cliente} - {self.fk_orden.cod_orden} - {self.fecha} - {self.hora} - {self.total_final}"


    
class Usuario (models.Model):
    TIPO_USUARIO = [
        ('cajero','Cajero'),
        ('cocinero', 'Cocinero'),
        ]
    nombre = models.CharField(max_length=20)
    password_usuario= models.CharField(max_length=8)
    tipo_usuario = models.CharField(max_length=10, choices=TIPO_USUARIO)
    
    def __str__(self):
        return self.nombre
    


#sona del spiner sobre sus datos
from django.db import models

class SpinnerItem(models.Model):
    image = models.ImageField(upload_to='spinner_images/')
    title = models.CharField(max_length=100)
    description = models.TextField()
    link = models.URLField(blank=True, null=True)

    def __str__(self):
        return self.title

class Categoria(models.Model):
    nombre = models.CharField(max_length=200, unique=True)
    descripcion = models.TextField(blank=True, null=True)
    imagen = models.ImageField(upload_to='categorias/', blank=True, null=True)

    def __str__(self):
        return self.nombre


class Producto(models.Model):
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE, related_name="productos")
    titulo = models.CharField(max_length=200)
    descripcion = models.TextField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    imagen = models.ImageField(upload_to='productos/')
    stock = models.PositiveIntegerField(default=0, null=True, blank=True)
    stock_ilimitado = models.BooleanField(default=False)  # Nuevo campo para stock ilimitado

    def __str__(self):
        return self.titulo

    def get_stock_display(self):
        return "Ilimitado" if self.stock_ilimitado else self.stock
    
    def reducir_stock(self, cantidad):
        if not self.stock_ilimitado:
            self.stock = max(0, self.stock - cantidad)
            self.save()