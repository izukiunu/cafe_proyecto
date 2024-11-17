from django.shortcuts import render, redirect, get_object_or_404
from .forms import FromLogin, FormCrearCliente, FormCrearMenu, FormCrearOrden, FormCrearVenta
from .models import Usuario, Menu, Cliente, Orden, Venta
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Max, F, Sum, Q
from django.utils import timezone
from django.db import transaction

# Página de inicio (Index)
def index(request):
    return render(request, 'index.html')  # Renderiza el archivo index.html

# Página de login
def login(request):
    if request.method == 'POST':
        form = FromLogin(request.POST)
        if form.is_valid():
            nombre = form.cleaned_data['nombre']
            try:
                usuario = Usuario.objects.get(nombre=nombre)
                tipo_usuario = usuario.tipo_usuario
                if tipo_usuario == "cajero":
                    return redirect('/pag_cajero')
                elif tipo_usuario == "cocinero":
                    return redirect('/pag_cocinero')
            except Usuario.DoesNotExist:
                print("Usuario no existe")
    else:
        form = FromLogin()

    return render(request, 'login.html', {'form': form})

# Página inicio del cocinero
def pag_cocinero(request):
    ultimas_ordenes = Orden.objects.values('cod_orden').annotate(ultima_orden=Max('id'))
    ordenes = Orden.objects.filter(
        id__in=[orden['ultima_orden'] for orden in ultimas_ordenes],
        estado_orden__in=['abierto', 'tomado']
    ).select_related('fk_cliente', 'fk_menu')
    return render(request, 'pag_cocinero.html', {'ordenes': ordenes})

# Modificar orden
def modificar_orden(request, orden_id, name='modificar_orden'):
    orden = get_object_or_404(Orden, id=orden_id)
    cod_orden_seleccionado = orden.cod_orden

    if request.method == 'POST':
        nuevo_estado = request.POST.get('nuevo_estado')
        with transaction.atomic():
            orden.estado_orden = nuevo_estado
            orden.save()
            Orden.objects.filter(cod_orden=cod_orden_seleccionado).update(estado_orden=nuevo_estado)
        return redirect('pag_cocinero')

    menus_relacionados = Menu.objects.filter(orden__cod_orden=cod_orden_seleccionado)
    return render(request, 'modificar_orden.html', {'orden': orden, 'menus_relacionados': menus_relacionados})

# Página cajero
def pag_cajero(request):
    return render(request, 'pag_cajero.html')

# Crear orden
def crear_orden(request):
    if request.method == 'POST':
        form = FormCrearOrden(request.POST)
        if form.is_valid():
            cod_orden = form.cleaned_data['cod_orden']
            cliente = form.cleaned_data['fk_cliente']
            menu = form.cleaned_data['fk_menu']
            estado_orden = form.cleaned_data['estado_orden']
            orden = Orden.objects.create(
                cod_orden=cod_orden,
                fk_cliente=cliente,
                fk_menu=menu,
                estado_orden=estado_orden
            )
            menu.m_stock -= 1
            menu.save()
            return redirect('/crear_orden')
    else:
        form = FormCrearOrden()
    return render(request, 'crear_orden.html', {'form': form})

# Crear cliente
def crear_cliente(request):
    if request.method == 'POST':
        form = FormCrearCliente(request.POST)
        if form.is_valid():
            nuevo_cliente = Cliente(**form.cleaned_data)
            nuevo_cliente.save()
            return redirect("/crear_cliente")
    else:
        form = FormCrearCliente()
    return render(request, 'crear_cliente.html', {'form': form, 'cliente': 'Crear Cliente'})

# Ver cliente
def ver_cliente(request):
    filtro_nombre = request.GET.get('filtro_nombre', "")
    filtro_apellido = request.GET.get('filtro_apellido', "")
    filtro_correo = request.GET.get('filtro_correo', "")
    filtro_direccion = request.GET.get('filtro_direccion', "")
    cliente = Cliente.objects.filter(
        nombre__icontains=filtro_nombre,
        apellido__icontains=filtro_apellido,
        correo__icontains=filtro_correo,
        calle_direccion__icontains=filtro_direccion
    )
    paginator = Paginator(cliente, 15)
    page = request.GET.get('page')
    try:
        clientes = paginator.page(page)
    except PageNotAnInteger:
        clientes = paginator.page(1)
    except EmptyPage:
        clientes = paginator.page(paginator.num_pages)
    return render(request, 'ver_cliente.html', {'clientes': clientes})

# Crear menú
def crear_menu(request):
    if request.method == 'POST':
        form = FormCrearMenu(request.POST)
        if form.is_valid():
            nuevo_menu = Menu(**form.cleaned_data)
            nuevo_menu.save()
            return redirect("/crear_menu")
    else:
        form = FormCrearMenu()
    return render(request, 'crear_menu.html', {'form': form, 'menu': 'Crear Menú'})

# Ver menú
def ver_menu(request):
    filtro_m_nombre = request.GET.get('filtro_m_nombre', "")
    filtro_m_stock = request.GET.get('filtro_m_stock', "")
    menus = Menu.objects.filter(
        m_nombre__icontains=filtro_m_nombre,
        m_stock__icontains=filtro_m_stock,
    )
    paginator = Paginator(menus, 15)
    page = request.GET.get('page')
    try:
        menus = paginator.page(page)
    except PageNotAnInteger:
        menus = paginator.page(1)
    except EmptyPage:
        menus = paginator.page(paginator.num_pages)
    return render(request, 'ver_menu.html', {'menus': menus})

# Ver orden
def ver_orden(request):
    filtro_cod_orden = request.GET.get('filtro_cod_orden', "")
    filtro_nom_cliente = request.GET.get('filtro_nom_cliente', "")
    filtro_estado_orden = request.GET.get('filtro_estado_orden', "")
    ordenes_filtradas = Orden.objects.filter(
        cod_orden__icontains=filtro_cod_orden,
        fk_cliente__nombre__icontains=filtro_nom_cliente,
        estado_orden__icontains=filtro_estado_orden
    ).order_by('-id')
    paginator = Paginator(ordenes_filtradas, 15)
    page = request.GET.get('page')
    try:
        ordenes_paginadas = paginator.page(page)
    except PageNotAnInteger:
        ordenes_paginadas = paginator.page(1)
    except EmptyPage:
        ordenes_paginadas = paginator.page(paginator.num_pages)
    return render(request, 'ver_orden.html', {'ordens': ordenes_paginadas})

# Crear venta
def crear_venta(request):
    if request.method == 'POST':
        form = FormCrearVenta(request.POST)
        if form.is_valid():
            venta = form.save(commit=False)
            venta.fecha = timezone.now().date()
            venta.hora = timezone.now().time()
            venta.save()
            return redirect('boleta', venta_id=venta.id)
    else:
        form = FormCrearVenta()
    return render(request, 'crear_venta.html', {'form': form})

# Ver boleta
def boleta(request, venta_id):
    venta = get_object_or_404(Venta, id=venta_id)
    detalles_menus = Orden.objects.filter(
        fk_orden=venta.fk_orden
    ).annotate(total_menu=Sum(F('fk_menu__m_precio')))
    total_general = sum(detalle.total_menu for detalle in detalles_menus)
    return render(request, 'boleta.html', {'venta': venta, 'detalles_menus': detalles_menus, 'total_general': total_general})

# Ver venta
def ver_venta(request):
    ventas = Venta.objects.all().order_by('-fecha', '-hora')
    paginator = Paginator(ventas, 15)
    page = request.GET.get('page')
    try:
        ventas_paginadas = paginator.page(page)
    except PageNotAnInteger:
        ventas_paginadas = paginator.page(1)
    except EmptyPage:
        ventas_paginadas = paginator.page(paginator.num_pages)
    return render(request, 'ver_venta.html', {'venta': ventas_paginadas})

# Modificar cliente
def modificar_cliente(request, cliente_id):
    cliente = get_object_or_404(Cliente, id=cliente_id)
    if request.method == 'POST':
        form = FormCrearCliente(request.POST, instance=cliente)
        if form.is_valid():
            form.save()
            return redirect('ver_cliente')
    else:
        form = FormCrearCliente(instance=cliente)
    return render(request, 'modificar_cliente.html', {'form': form})

def otro_template(request):
    return render(request, 'otro_template.html')


#spiner
from django.shortcuts import render
from .models import SpinnerItem

def index(request):
    spinner_items = SpinnerItem.objects.all()
    return render(request, 'index.html', {'spinner_items': spinner_items})
