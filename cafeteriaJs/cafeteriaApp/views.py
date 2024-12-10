from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.utils.crypto import get_random_string
from django.contrib import messages
from django.views.decorators.csrf import csrf_exempt
import json
from .models import Cliente, Categoria, Producto, Carrito, Pedido
from .forms import RegistroClienteForm
from decimal import Decimal



from django.shortcuts import render


# views.py
# views.py
from django.shortcuts import render
from .models import SpinnerImage  # Cambia SpinnerImage por el nombre de tu modelo
import logging
logger = logging.getLogger(__name__)

def home(request):
    spinner_images = SpinnerImage.objects.all()  # Asegúrate de que haya datos en este QuerySet
    # Verifica si hay datos
    if not spinner_images.exists():
        logger.error("No hay imágenes disponibles en el modelo SpinnerImage")
        print("Error: No hay imágenes disponibles en el modelo SpinnerImage")
    else:
        logger.info(f"Imágenes encontradas: {spinner_images}")
        print(f"Imágenes encontradas: {spinner_images}")
    
    return render(request, 'index.html', {'spinner_images': spinner_images})

# ----- Página de inicio -----
def index(request):
    return render(request, 'index.html')

@login_required
def configuraciones(request):
    cliente = request.user.cliente
    return render(request, 'configuraciones.html', {'cliente': cliente})

# ----- Gestión de autenticación -----
def iniciar_sesion(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user:
            login(request, user)
            if not all([user.cliente.telefono, user.cliente.direccion, user.cliente.rut]):
                return redirect('completar_perfil')
            return redirect('index')
        return render(request, 'login.html', {'error': 'Usuario o contraseña incorrectos.'})
    return render(request, 'login.html')

@login_required
def cerrar_sesion(request):
    logout(request)
    return redirect('index')
from django.shortcuts import render, redirect
from .forms import RegistroClienteForm
from .models import Cliente

from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from .forms import RegistroClienteForm
from .models import Cliente

@csrf_exempt
def registro(request):
    if request.method == 'POST':
        form = RegistroClienteForm(request.POST)
        if form.is_valid():
            # Crear un nuevo usuario
            user = User.objects.create_user(
                username=form.cleaned_data['username'],
                email=form.cleaned_data['email'],
                password=form.cleaned_data['password']
            )

            # Crear un cliente asociado al usuario
            Cliente.objects.create(
                usuario=user,
                telefono=form.cleaned_data.get('telefono'),
                direccion=form.cleaned_data.get('direccion'),
                rut=form.cleaned_data.get('rut')
            )

            # Redirigir al inicio de sesión
            return redirect('iniciar_sesion')
    else:
        form = RegistroClienteForm()

    return render(request, 'registro.html', {'form': form})

# ----- Completar perfil -----
@login_required
def completar_perfil(request):
    cliente = request.user.cliente
    if request.method == 'POST':
        cliente.telefono = request.POST.get('telefono')
        cliente.direccion = request.POST.get('direccion')
        cliente.rut = request.POST.get('rut')
        cliente.save()
        return redirect('index')
    return render(request, 'completar_perfil.html', {'cliente': cliente})

# ----- Mi perfil y configuraciones -----
@login_required
def mi_perfil(request):
    cliente = request.user.cliente
    return render(request, 'mi_perfil.html', {'cliente': cliente})

def guardar_configuraciones(request):
    if request.method == 'POST':
        cliente = get_object_or_404(Cliente, usuario=request.user)
        cliente.notificaciones_correo = 'notificaciones_correo' in request.POST
        cliente.alertas = request.POST.get('alertas', 'todos')
        cliente.save()
        messages.success(request, "Configuraciones guardadas exitosamente.")
        return redirect('configuraciones')
    messages.error(request, "Método no permitido.")
    return redirect('configuraciones')

@login_required
def modificar_perfil(request):
    cliente = request.user.cliente
    if request.method == 'POST':
        cliente.telefono = request.POST.get('telefono', cliente.telefono)
        cliente.direccion = request.POST.get('direccion', cliente.direccion)
        cliente.rut = request.POST.get('rut', cliente.rut)
        cliente.save()
        messages.success(request, "Perfil modificado exitosamente.")
        return redirect('mi_perfil')
    return render(request, 'modificar_perfil.html', {'cliente': cliente})

# ----- Página de categorías y productos -----
def listar_categorias(request):
    categorias = Categoria.objects.all()
    return render(request, 'categorias.html', {'categorias': categorias})

def listar_productos(request, categoria_id):
    productos = Producto.objects.filter(categoria_id=categoria_id, stock__gt=0)
    return render(request, 'productos.html', {'productos': productos})

# ----- Carrito -----
@csrf_exempt
def agregar_al_carrito(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            producto_id = data.get('producto_id')
            cantidad = data.get('cantidad', 1)
            producto = Producto.objects.get(id=producto_id)

            carrito_item, creado = Carrito.objects.get_or_create(
                usuario=request.user,
                producto=producto,
                defaults={'cantidad': cantidad}
            )

            if not creado:
                carrito_item.cantidad += cantidad
                carrito_item.save()

            # Devuelve una respuesta para el frontend indicando que se recargue la página
            return JsonResponse({'status': 'success', 'message': 'Producto agregado al carrito.', 'reload': True})
        except Producto.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'El producto no existe.'})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})
    return JsonResponse({'status': 'error', 'message': 'Método no permitido.'})


@login_required
def ver_carrito(request):
    carrito_items = Carrito.objects.filter(usuario=request.user)
    total = sum(item.subtotal() for item in carrito_items)
    carrito_data = [
        {
            "producto": item.producto.titulo,
            "cantidad": item.cantidad,
            "subtotal": item.subtotal(),
        }
        for item in carrito_items
    ]
    return JsonResponse({"carrito": carrito_data, "total": total})

@login_required
def mostrar_carrito(request):
    carrito_items = Carrito.objects.filter(usuario=request.user)
    total = sum(item.subtotal() for item in carrito_items)
    return render(request, 'carrito.html', {
        'carrito_items': carrito_items,
        'total': total
    })

@login_required
def eliminar_del_carrito(request):
    if request.method == "POST":
        producto_id = request.POST.get("producto_id")
        carrito_item = get_object_or_404(Carrito, usuario=request.user, producto_id=producto_id)
        carrito_item.delete()
        messages.success(request, "Producto eliminado del carrito.")
    return redirect("mostrar_carrito")

@login_required
def finalizar_compra(request):
    if request.method == "POST":
        carrito_items = Carrito.objects.filter(usuario=request.user)
        if not carrito_items.exists():
            messages.error(request, "No puedes finalizar la compra con un carrito vacío.")
            return redirect("mostrar_carrito")
        total = sum(item.subtotal() for item in carrito_items)
        if total <= 0:
            messages.error(request, "Tu carrito contiene productos inválidos.")
            return redirect("mostrar_carrito")
        productos = [
            {
                "titulo": item.producto.titulo,
                "cantidad": item.cantidad,
                "precio_unitario": float(item.producto.precio),
                "subtotal": float(item.subtotal()),
            }
            for item in carrito_items
        ]
        pedido = Pedido.objects.create(
            usuario=request.user,
            productos=json.dumps(productos),
            total=total,
            direccion=request.user.cliente.direccion,
            rut=request.user.cliente.rut,
            telefono=request.user.cliente.telefono,
        )
        carrito_items.delete()
        messages.success(request, "Pedido creado exitosamente. Procesa tu transferencia para completar la compra.")
        return render(request, "finalizar_compra.html", {
            "total": total,
            "codigo_pedido": pedido.codigo_pedido,
            "rut": "21302986-K",
            "cuenta_tipo": "Cuenta RUT",
            "correo": "sebastianaaguirremundaca@gmail.com",
        })
    messages.warning(request, "Actualmente solo aceptamos transferencias bancarias.")
    return render(request, "finalizar_compra.html", {
        "total": 0,
        "codigo_pedido": "N/A",
        "rut": "21302986-K",
        "cuenta_tipo": "Cuenta RUT",
        "correo": "sebastianaaguirremundaca@gmail.com",
    })


def cantidad_productos_carrito(request):
    if request.user.is_authenticated:
        carrito_items = Carrito.objects.filter(usuario=request.user)
        cantidad_productos = sum(item.cantidad for item in carrito_items)
    else:
        cantidad_productos = 0
    return JsonResponse({'cantidad_productos': cantidad_productos})


@csrf_exempt
def actualizar_cantidad_carrito(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            producto_id = data.get('producto_id')
            cantidad = data.get('cantidad', 1)

            carrito_item, creado = Carrito.objects.get_or_create(
                usuario=request.user, producto_id=producto_id,
                defaults={'cantidad': cantidad}
            )

            if not creado:
                carrito_item.cantidad = cantidad
                carrito_item.save()

            cantidad_total = Carrito.objects.filter(usuario=request.user).aggregate(Sum('cantidad'))['cantidad__sum'] or 0
            return JsonResponse({'status': 'success', 'cantidad_productos': cantidad_total})
        except Carrito.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Producto no encontrado en el carrito.'})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})
    return JsonResponse({'status': 'error', 'message': 'Método no permitido.'})


@login_required
def historial_pedidos(request):
    pedidos = Pedido.objects.filter(usuario=request.user).order_by('-id')
    pedidos_data = [
        {
            'codigo': pedido.codigo_pedido,
            'total': float(pedido.total),
            'estado': pedido.get_estado_display(),
            'productos': json.loads(pedido.productos),  # Decodifica productos almacenados en JSON
        }
        for pedido in pedidos
    ]
    return JsonResponse({'pedidos': pedidos_data})