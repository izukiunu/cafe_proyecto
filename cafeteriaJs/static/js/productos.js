let carrito = [];

document.addEventListener('DOMContentLoaded', () => {
    const categoriaBotones = document.querySelectorAll('.categoria-boton');
    const productosContenedor = document.getElementById('productos-contenedor');

    categoriaBotones.forEach(boton => {
        boton.addEventListener('click', () => {
            const categoriaId = boton.getAttribute('data-categoria-id');
            
            fetch(`/productos/${categoriaId}/`) // Ruta para obtener productos de la categoría
                .then(response => {
                    if (!response.ok) throw new Error('Error en la respuesta del servidor');
                    return response.json();
                })
                .then(data => {
                    // Limpia el contenedor y prepara la estructura
                    productosContenedor.innerHTML = '<div id="productos"></div>';
                    const productosDiv = document.getElementById('productos');

                    if (data.productos.length > 0) {
                        data.productos.forEach(producto => {
                            const imagenProducto = producto.imagen ? producto.imagen : '/static/images/default.png';
                            const productoHtml = `
                                <div class="producto">
                                    <img src="${imagenProducto}" alt="${producto.titulo}">
                                    <h3>${producto.titulo}</h3>
                                    <p>${producto.descripcion}</p>
                                    <p>Precio: $${producto.precio}</p>
                                    ${
                                        producto.stock_ilimitado
                                            ? `<p>Stock: Ilimitado</p>
                                               <div class="cantidad">
                                                   <button class="cantidad-btn" onclick="modificarCantidad(${producto.id}, -1)">-</button>
                                                   <input type="number" id="cantidad_${producto.id}" name="cantidad" min="1" value="1">
                                                   <button class="cantidad-btn" onclick="modificarCantidad(${producto.id}, 1)">+</button>
                                               </div>
                                               <button class="add-to-cart" onclick="agregarAlCarro(${producto.id}, '${producto.titulo}', ${producto.precio}, '${imagenProducto}')">Añadir al carro</button>`
                                            : producto.stock > 0
                                                ? `<div class="cantidad">
                                                       <button class="cantidad-btn" onclick="modificarCantidad(${producto.id}, -1)">-</button>
                                                       <input type="number" id="cantidad_${producto.id}" name="cantidad" min="1" max="${producto.stock}" value="1">
                                                       <button class="cantidad-btn" onclick="modificarCantidad(${producto.id}, 1)">+</button>
                                                   </div>
                                                   <button class="add-to-cart" onclick="agregarAlCarro(${producto.id}, '${producto.titulo}', ${producto.precio}, '${imagenProducto}')">Añadir al carro</button>`
                                                : '<p class="sin-stock">Producto sin stock disponible</p>'
                                    }
                                </div>
                            `;
                            productosDiv.innerHTML += productoHtml;
                        });
                    } else {
                        productosDiv.innerHTML = '<p>No hay productos en esta categoría.</p>';
                    }
                })
                .catch(error => {
                    console.error('Error al cargar los productos:', error);
                    productosContenedor.innerHTML = '<p>Error al cargar los productos. Intente nuevamente.</p>';
                });
        });
    });
    actualizarCarrito();
});

// Función para manejar agregar productos al carro
function agregarAlCarro(productoId, productoTitulo, productoPrecio, productoImagen) {
    const cantidadInput = document.getElementById(`cantidad_${productoId}`);
    const cantidad = parseInt(cantidadInput.value, 10);

    // Buscar si el producto ya está en el carrito
    const productoExistente = carrito.find(item => item.id === productoId);

    if (productoExistente) {
        // Si ya existe, aumentar la cantidad
        productoExistente.cantidad += cantidad;
    } else {
        // Si no existe, añadirlo al carrito
        carrito.push({
            id: productoId,
            titulo: productoTitulo,
            precio: productoPrecio,
            imagen: productoImagen,
            cantidad: cantidad
        });
    }

    actualizarCarrito();
}

// Función para actualizar el carrito y mostrarlo en el modal
function actualizarCarrito() {
    const carritoProductosDiv = document.getElementById('carrito-productos');
    carritoProductosDiv.innerHTML = '';

    let totalPagar = 0;

    carrito.forEach(producto => {
        const productoDiv = document.createElement('div');
        productoDiv.classList.add('carrito-producto');
        productoDiv.innerHTML = `
            <img src="${producto.imagen}" alt="${producto.titulo}" class="carrito-imagen">
            <h3>${producto.titulo}</h3>
            <p>Precio: $${producto.precio}</p>
            <div class="cantidad">
                <button class="cantidad-btn" onclick="modificarCantidadCarrito(${producto.id}, -1)">-</button>
                <input type="number" value="${producto.cantidad}" min="1" onchange="actualizarCantidadCarrito(${producto.id}, this.value)">
                <button class="cantidad-btn" onclick="modificarCantidadCarrito(${producto.id}, 1)">+</button>
            </div>
            <button class="cantidad-btn eliminar" onclick="eliminarDelCarro(${producto.id})">Eliminar</button>
        `;
        carritoProductosDiv.appendChild(productoDiv);

        totalPagar += producto.precio * producto.cantidad;
    });

    document.getElementById('total-pagar').innerText = `$${totalPagar.toFixed(2)}`;
}

// Función para eliminar productos del carrito
function eliminarDelCarro(productoId) {
    carrito = carrito.filter(item => item.id !== productoId);
    actualizarCarrito();
}

// Función para modificar cantidad en el input
function modificarCantidad(productoId, delta) {
    const cantidadInput = document.getElementById(`cantidad_${productoId}`);
    if (cantidadInput) {
        let cantidadActual = parseInt(cantidadInput.value, 10);
        cantidadActual = isNaN(cantidadActual) ? 0 : cantidadActual + delta;
        cantidadActual = Math.max(cantidadActual, 1); // No permitir valores menores a 1
        cantidadInput.value = cantidadActual;
    } else {
        console.warn(`No se encontró el input de cantidad para el producto ID ${productoId}`);
    }
}

// Función para modificar cantidad directamente en el carrito
function modificarCantidadCarrito(productoId, delta) {
    const producto = carrito.find(item => item.id === productoId);
    if (producto) {
        producto.cantidad = Math.max(producto.cantidad + delta, 1);
        actualizarCarrito();
    }
}

// Función para actualizar la cantidad desde el input en el carrito
function actualizarCantidadCarrito(productoId, nuevaCantidad) {
    const producto = carrito.find(item => item.id === productoId);
    if (producto) {
        producto.cantidad = Math.max(parseInt(nuevaCantidad, 10), 1);
        actualizarCarrito();
    }
}

// Función para mostrar/ocultar el carrito
function toggleCarrito() {
    const carritoModal = document.getElementById('carrito-modal');
    carritoModal.classList.toggle('hidden');
    carritoModal.classList.toggle('active');
}

// Función para cerrar el carrito al hacer clic fuera de la caja
function cerrarCarrito(event) {
    const carritoModal = document.getElementById('carrito-modal');
    if (carritoModal.classList.contains('active')) {
        carritoModal.classList.remove('active');
        carritoModal.classList.add('hidden');
    }
}

// Función para mostrar/ocultar el menú (para dispositivos móviles)
function toggleMenu() {
    const nav = document.querySelector('.navbar-nav');
    nav.classList.toggle('active');
}
