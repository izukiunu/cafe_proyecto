# Generated by Django 5.0.7 on 2024-11-16 23:00

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Cliente',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=30)),
                ('apellido', models.CharField(max_length=30)),
                ('correo', models.CharField(max_length=60)),
                ('calle_direccion', models.CharField(max_length=90)),
                ('calle_numero', models.CharField(max_length=10)),
                ('telefono', models.CharField(max_length=12)),
            ],
        ),
        migrations.CreateModel(
            name='Menu',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('m_nombre', models.CharField(blank=True, max_length=30)),
                ('m_detalle', models.CharField(max_length=255)),
                ('m_precio', models.PositiveIntegerField(default=0)),
                ('m_stock', models.PositiveIntegerField(default=0)),
                ('cantidad_piezas', models.PositiveIntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='SpinnerItem',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(upload_to='spinner_images/')),
                ('title', models.CharField(max_length=100)),
                ('description', models.TextField()),
                ('link', models.URLField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=20)),
                ('password_usuario', models.CharField(max_length=8)),
                ('tipo_usuario', models.CharField(choices=[('cajero', 'Cajero'), ('cocinero', 'Cocinero')], max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='Orden',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cod_orden', models.IntegerField()),
                ('estado_orden', models.CharField(blank=True, choices=[('abierto', 'Abierto'), ('cerrado', 'Cerrado'), ('cancelado', 'Cancelado'), ('tomado', 'Tomado')], max_length=10)),
                ('fk_cliente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='cafeteriaApp.cliente')),
                ('fk_menu', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='cafeteriaApp.menu')),
            ],
        ),
        migrations.CreateModel(
            name='Venta',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateField()),
                ('hora', models.TimeField()),
                ('total_original', models.PositiveIntegerField(default=0)),
                ('total_descuento', models.PositiveIntegerField(default=0)),
                ('total_final', models.IntegerField(default=0)),
                ('fk_cliente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='cafeteriaApp.cliente')),
                ('fk_orden', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='cafeteriaApp.orden')),
            ],
        ),
    ]