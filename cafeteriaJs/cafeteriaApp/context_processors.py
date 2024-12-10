from .models import Carrito

def carrito_context(request):
    if request.user.is_authenticated:
        carrito_items = Carrito.objects.filter(usuario=request.user)
        cantidad_productos = sum(item.cantidad for item in carrito_items)
    else:
        cantidad_productos = 0
    return {'cantidad_productos_carrito': cantidad_productos}