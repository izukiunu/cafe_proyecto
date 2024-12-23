# Generated by Django 5.0.7 on 2024-12-10 13:59

import cafeteriaApp.models
import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cafeteriaApp', '0010_cliente_estado_compra_cliente_estado_pedido_and_more'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Pedido',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('productos', models.TextField()),
                ('total', models.DecimalField(decimal_places=2, max_digits=10)),
                ('direccion', models.CharField(max_length=255)),
                ('rut', models.CharField(max_length=12)),
                ('telefono', models.CharField(max_length=15)),
                ('codigo_pedido', models.CharField(default=cafeteriaApp.models.generar_codigo, max_length=8, unique=True)),
                ('confirmado_pago', models.BooleanField(default=False)),
                ('usuario', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
