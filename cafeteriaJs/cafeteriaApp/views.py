from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .models import Cliente
from .forms import RegistroClienteForm

# ----- Página de inicio -----
def index(request):
    return render(request, 'index.html')

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

def registro(request):
    if request.method == 'POST':
        form = RegistroClienteForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.set_password(form.cleaned_data['password'])
            user.save()
            Cliente.objects.create(
                usuario=user,
                telefono=form.cleaned_data.get('telefono'),
                direccion=form.cleaned_data.get('direccion'),
                rut=form.cleaned_data.get('rut')
            )
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

@login_required
def modificar_perfil(request):
    return render(request, 'modificar_perfil.html')

# ----- Mi perfil y configuraciones -----
@login_required
def mi_perfil(request):
    cliente = request.user.cliente
    return render(request, 'mi_perfil.html', {'cliente': cliente})

@login_required
def configuraciones(request):
    cliente = request.user.cliente
    return render(request, 'configuraciones.html', {'cliente': cliente})

@login_required
def guardar_configuraciones(request):
    if request.method == 'POST':
        cliente = get_object_or_404(Cliente, usuario=request.user)
        cliente.notificaciones_correo = 'notificaciones_correo' in request.POST
        cliente.alertas = request.POST.get('alertas', 'todos')
        cliente.save()
        return redirect('configuraciones')

# ----- Página de productos -----
@login_required
def listar_productos(request):
    return render(request, 'productos.html')
