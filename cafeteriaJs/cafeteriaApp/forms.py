from django import forms
from cafeteriaApp import Usuario,Cliente,Orden,Menu,Venta

class FromLogin(forms.Form):
    nombre=forms.CharField()
    password_usuario=forms.CharField()

class FormCrearCliente(forms.Form):
    nombre=forms.CharField()
    apellido=forms.CharField()
    correo=forms.CharField()
    calle_direccion=forms.CharField()
    calle_numero=forms.IntegerField()
    telefono=forms.IntegerField()

class FormCrearMenu(forms.Form):
    m_nombre=forms.CharField()
    m_detalle=forms.CharField()
    m_precio=forms.IntegerField()
    m_stock=forms.IntegerField()
    cantidad_piezas=forms.IntegerField()
    m_salsa=forms.CharField()
    
    
class FormCrearOrden(forms.ModelForm):
    cod_orden = forms.IntegerField()

    class Meta:
        model = Orden
        fields = ['cod_orden', 'fk_cliente', 'fk_menu', 'estado_orden']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        try:
            ultimo_cod_orden = Orden.objects.latest('cod_orden').cod_orden
        except Orden.DoesNotExist:
            ultimo_cod_orden = 0

        self.fields['cod_orden'].initial = ultimo_cod_orden + 1


class FormCrearVenta(forms.ModelForm):
    class Meta:
        model = Venta
        fields = ['fk_cliente', 'fk_orden', 'total_descuento']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Obtener el último cod_orden creado para mostrarlo en el formulario
        ultimo_cod_orden = Orden.objects.latest('cod_orden').cod_orden
        self.fields['fk_orden'].queryset = Orden.objects.filter(cod_orden=ultimo_cod_orden)
        self.fields['fk_orden'].widget.attrs['readonly'] = True

class FormModificarUsuario(forms.ModelForm):
    class Meta:
        model = Usuario
        fields = ['nombre', 'password_usuario', 'tipo_usuario']