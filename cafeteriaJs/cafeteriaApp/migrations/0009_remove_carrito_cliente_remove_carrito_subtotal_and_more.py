# Generated by Django 5.0.7 on 2024-12-10 06:34

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cafeteriaApp', '0008_carrito_delete_usuario_remove_cliente_alertas_and_more'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.RemoveField(
            model_name='carrito',
            name='cliente',
        ),
        migrations.RemoveField(
            model_name='carrito',
            name='subtotal',
        ),
        migrations.RemoveField(
            model_name='cliente',
            name='estado_compra',
        ),
        migrations.RemoveField(
            model_name='cliente',
            name='estado_pedido',
        ),
        migrations.RemoveField(
            model_name='cliente',
            name='productos_carro',
        ),
        migrations.RemoveField(
            model_name='cliente',
            name='total_pagar',
        ),
        migrations.RemoveField(
            model_name='producto',
            name='stock_ilimitado',
        ),
        migrations.AddField(
            model_name='carrito',
            name='usuario',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='carrito', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='carrito',
            name='producto',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='cafeteriaApp.producto'),
        ),
        migrations.AlterField(
            model_name='categoria',
            name='descripcion',
            field=models.TextField(blank=True, default='Sin descripción'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='categoria',
            name='nombre',
            field=models.CharField(max_length=100, unique=True),
        ),
        migrations.AlterField(
            model_name='producto',
            name='precio',
            field=models.DecimalField(decimal_places=2, max_digits=10),
        ),
        migrations.AlterField(
            model_name='producto',
            name='stock',
            field=models.PositiveIntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='producto',
            name='titulo',
            field=models.CharField(max_length=100),
        ),
        migrations.DeleteModel(
            name='Orden',
        ),
    ]