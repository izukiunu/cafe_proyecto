from django.shortcuts import render, redirect,get_object_or_404
from .forms import FromLogin,FormCrearCliente,FormCrearMenu,FormCrearOrden,FormCrearVenta
from .models import Usuario,Menu,Cliente,Orden,Venta
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Max, F, Sum, Q
from django.utils import timezone
from django.db import transaction
# Create your views here.
# views.py
from django.db.models import OuterRef, Subquery



#pagina de login----        
def login(request):
    if request.method=='POST':
        form= FromLogin(request.POST)
        
        if form.is_valid():
            nombre=  form.cleaned_data['nombre']
            try:
                usuario = Usuario.objects.get(nombre=nombre)
                tipo_usuario=usuario.tipo_usuario
                if tipo_usuario=="cajero":
                    return redirect('/pag_cajero')
                elif tipo_usuario=="cocinero":
                    return redirect('/pag_cocinero')
            except Usuario.DoesNotExist:
                print("usuario no existe")
    else:
        form =FromLogin

    return render(request,'login.html',{'form': form})
#pagina incio del cocinero--------------------------------
def pag_cocinero(request):
    # Obtener la última orden para cada cod_orden
    ultimas_ordenes = Orden.objects.values('cod_orden').annotate(ultima_orden=Max('id'))

    # Obtener las órdenes completas (con detalles del menú y cliente) utilizando las últimas órdenes obtenidas
    ordenes = Orden.objects.filter(
        id__in=[orden['ultima_orden'] for orden in ultimas_ordenes],
        estado_orden__in=['abierto', 'tomado']
    ).select_related('fk_cliente', 'fk_menu')

    return render(request, 'pag_cocinero.html', {'ordenes': ordenes})

#moficiar orden---------------------
def modificar_orden(request, orden_id, name='modificar_orden'):
    # Obtener la orden utilizando la id
    orden = get_object_or_404(Orden, id=orden_id)

    # Obtener el cod_orden antes de procesar el formulario
    cod_orden_seleccionado = orden.cod_orden

    if request.method == 'POST':
        # Obtener el nuevo estado desde el formulario
        nuevo_estado = request.POST.get('nuevo_estado')

        # Iniciar una transacción para asegurar que todas las actualizaciones se realicen o ninguna
        with transaction.atomic():
            # Actualizar el estado de la orden seleccionada
            orden.estado_orden = nuevo_estado
            orden.save()

            # Actualizar el estado de todos los registros de orden con el mismo cod_orden
            Orden.objects.filter(cod_orden=cod_orden_seleccionado).update(estado_orden=nuevo_estado)

        # Redirigir a la página que desees después de la modificación
        return redirect('pag_cocinero')  # Ajusta la URL según tu configuración

    # Realizar el filtro de menús con el mismo cod_orden
    menus_relacionados = Menu.objects.filter(orden__cod_orden=cod_orden_seleccionado)

    return render(request, 'modificar_orden.html', {'orden': orden, 'menus_relacionados': menus_relacionados})


#pag cajero---------------------------
def pag_cajero(request):
    return render(request,'pag_cajero.html')


#Crear orden----------
def crear_orden(request):
    if request.method == 'POST':
        form = FormCrearOrden(request.POST)
        if form.is_valid():
            cod_orden = form.cleaned_data['cod_orden']
            cliente = form.cleaned_data['fk_cliente']
            menu = form.cleaned_data['fk_menu']
            estado_orden = form.cleaned_data['estado_orden']

            # Guarda la orden en la base de datos
            orden = Orden.objects.create(
                cod_orden=cod_orden,
                fk_cliente=cliente,
                fk_menu=menu,
                estado_orden=estado_orden
            )

            # Reducir el stock del menú en 1
            menu.m_stock -= 1
            menu.save()

            # Redirige a alguna vista después de crear la orden
            return redirect('/crear_orden')  # Ajusta 'otra_vista' según tu lógica de redirección

    else:
        form = FormCrearOrden()
    return render(request, 'crear_orden.html', {'form': form})

#crear_cliente--------
def crear_cliente(request):
    if request.method == 'POST':
        form = FormCrearCliente(request.POST)
        if form.is_valid():
            nombre = form.cleaned_data['nombre']
            apellido = form.cleaned_data['apellido']
            correo = form.cleaned_data['correo']
            calle_direccion = form.cleaned_data['calle_direccion']
            calle_numero = form.cleaned_data['calle_numero']
            telefono = form.cleaned_data['telefono']
            nuevo_cliente = Cliente(
                nombre=nombre,
                apellido=apellido,
                correo=correo,
                calle_direccion=calle_direccion,
                calle_numero=calle_numero,
                telefono=telefono
            )
            nuevo_cliente.save()
            return redirect("/crear_cliente",)
    else:
        form = FormCrearCliente()  # Crear una instancia del formulario para el caso de GET

    return render(request, 'crear_cliente.html', {'form': form, 'cliente': 'Crear Cliente'})

#ver ciente-------------------
def ver_cliente(request):
    filtro_nombre=request.GET.get('filtro_nombre', "")
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
    return render(request,'ver_cliente.html',{'clientes':cliente})


#crear menu ----------------------
def crear_menu(request):
    if request.method == 'POST':
        form = FormCrearMenu(request.POST)
        if form.is_valid():
            m_nombre = form.cleaned_data['m_nombre']
            m_detalle = form.cleaned_data['m_detalle']
            m_precio = form.cleaned_data['m_precio']
            m_stock = form.cleaned_data['m_stock']
            cantidad_piezas = form.cleaned_data['cantidad_piezas']
            m_salsa = form.cleaned_data['m_salsa']
            nuevo_menu = Menu(
                m_nombre=m_nombre,
                m_detalle=m_detalle,
                m_precio=m_precio,
                m_stock=m_stock,
                cantidad_piezas=cantidad_piezas,
                m_salsa=m_salsa
            )
            nuevo_menu.save()
            return redirect("/crear_menu", print("menu Creado"))
    else:
        form = FormCrearMenu()  # Crear una instancia del formulario para el caso de GET

    return render(request, 'crear_menu.html', {'form': form, 'menu': 'Crear Menu'})


#ver menu----------------------------------------
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

#ver orden----------------------------------------
def ver_orden(request):
    filtro_cod_orden = request.GET.get('filtro_cod_orden', "")
    filtro_nom_cliente = request.GET.get('filtro_nom_cliente', "")
    filtro_estado_orden = request.GET.get('filtro_estado_orden', "")

    # Filtra las órdenes
    ordenes_filtradas = Orden.objects.filter(
        cod_orden__icontains=filtro_cod_orden,
        fk_cliente__nombre__icontains=filtro_nom_cliente,
        estado_orden__icontains=filtro_estado_orden
    )

    # Ordena las órdenes por fecha y hora en orden descendente
    ordenes_ordenadas = ordenes_filtradas.order_by('-venta__fecha', '-venta__hora')

    # Paginación
    paginator = Paginator(ordenes_ordenadas, 15)
    page = request.GET.get('page')

    try:
        ordenes_paginadas = paginator.page(page)
    except PageNotAnInteger:
        # Si la página no es un número entero, mostrar la primera página
        ordenes_paginadas = paginator.page(1)
    except EmptyPage:
        # Si la página está fuera de rango (ejemplo: 9999), mostrar la última página de resultados
        ordenes_paginadas = paginator.page(paginator.num_pages)

    return render(request, 'ver_orden.html', {'ordens': ordenes_paginadas})


#crear venta________________________________________________________
def crear_venta(request):
    # Obtén el último cod_orden creado
    try:
        ultimo_cod_orden = Orden.objects.latest('cod_orden').cod_orden
    except Orden.DoesNotExist:
        ultimo_cod_orden = 0

    if request.method == 'POST':
        form = FormCrearVenta(request.POST)
        if form.is_valid():
            # Obtiene la fecha y hora actuales
            now = timezone.now()

            # Guarda la venta en la base de datos con la fecha actual
            venta = form.save(commit=False)
            venta.fecha = now.date()  # Asigna la fecha actual
            venta.hora = now.time()  # Asigna la hora actual
            venta.save()

            # Redirige a la página de la boleta con el ID de la venta y el último cod_orden
            return redirect('boleta', venta_id=venta.id)

    else:
        form = FormCrearVenta()

    return render(request, 'crear_venta.html', {'form': form, 'ultimo_cod_orden': ultimo_cod_orden})

#ver boleta----------------------------------------------------
def boleta(request, venta_id):
    venta = get_object_or_404(Venta, id=venta_id)

    # Obtener la orden asociada con la venta
    orden = Orden.objects.filter(venta=venta).first()

    if orden:
        cod_orden_venta = orden.cod_orden

        # Obtener todos los detalles de los menús asociados a los registros de orden con el mismo código de orden
        detalles_menus = Orden.objects.filter(cod_orden=cod_orden_venta).annotate(total_menu=Sum(F('fk_menu__m_precio'))).values('fk_menu__m_detalle', 'total_menu')

        # Calcular el total general sumando los totales de los menús
        total_general = sum(detalle['total_menu'] for detalle in detalles_menus)

        return render(request, 'boleta.html', {'venta': venta, 'detalles_menus': detalles_menus, 'total_general': total_general})
    else:
        # Manejar el caso en que no haya orden asociada a la venta
        return render(request, 'boleta.html', {'venta': venta, 'detalles_menus': [], 'total_general': 0})
    

#ver_venta----------------------------------------------------------------------------------------
def ver_venta(request):
    ventas = Venta.objects.all()

    filtro_cliente = request.GET.get('filtro_cliente', "")
    filtro_orden = request.GET.get('filtro_orden', "")

    # Filtra las órdenes
    ventas_filtradas = ventas.filter(
        fk_cliente__nombre__icontains=filtro_cliente,
        fk_orden__cod_orden__icontains=filtro_orden,
    )

    # Ordena las órdenes por fecha y hora en orden descendente
    ventas_ordenadas = ventas_filtradas.order_by('-fecha', '-hora')

    # Paginación
    paginator = Paginator(ventas_ordenadas, 15)
    page = request.GET.get('page')

    try:
        ventas_paginadas = paginator.page(page)
    except PageNotAnInteger:
        # Si la página no es un número entero, mostrar la primera página
        ventas_paginadas = paginator.page(1)
    except EmptyPage:
        # Si la página está fuera de rango (ejemplo: 9999), mostrar la última página de resultados
        ventas_paginadas = paginator.page(paginator.num_pages)

    return render(request, 'ver_venta.html', {'venta': ventas_paginadas})


#modificar_cliente
def modificar_cliente(request, cliente_id):
    # Obtén la instancia del cliente
    cliente = get_object_or_404(Cliente, id=cliente_id)

    if request.method == 'POST':
        form = FormCrearCliente(request.POST, instance=cliente)
        if form.is_valid():
            form.save()
            return redirect('ver_cliente')  # Ajusta la URL según tu configuración
    else:
        form = FormCrearCliente(instance=cliente)

    return render(request, 'modificar_cliente.html', {'form': form})

    

def otro_template(request):
    render(request,'otro_tramplate.html', name=otro_template)
