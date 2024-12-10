from django import forms
from .models import Cliente

class FromLogin(forms.Form):
    nombre = forms.CharField()
    password_usuario = forms.CharField()

class FormCrearCliente(forms.Form):
    nombre = forms.CharField()
    apellido = forms.CharField()
    correo = forms.CharField()
    calle_direccion = forms.CharField()
    calle_numero = forms.IntegerField()
    telefono = forms.IntegerField()




from django import forms
from django.contrib.auth.models import User
from .models import Cliente

class RegistroClienteForm(forms.ModelForm):
    username = forms.CharField(max_length=100, required=True)
    email = forms.EmailField(required=True)
    password = forms.CharField(widget=forms.PasswordInput, required=True)

    class Meta:
        model = Cliente
        fields = ('telefono',)

    def save(self, commit=True):
        user = User.objects.create_user(
            username=self.cleaned_data['username'],
            email=self.cleaned_data['email'],
            password=self.cleaned_data['password']
        )
        cliente = Cliente(usuario=user, telefono=self.cleaned_data['telefono'])
        if commit:
            cliente.save()
        return cliente