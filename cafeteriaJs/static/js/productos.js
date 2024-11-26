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
                            const productoHtml = `
                                <div class="producto">
                                    <img src="${producto.imagen}" alt="${producto.titulo}">
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
                                               <button class="add-to-cart" onclick="agregarAlCarro(${producto.id})">Añadir al carro</button>`
                                            : producto.stock > 0
                                                ? `<div class="cantidad">
                                                       <button class="cantidad-btn" onclick="modificarCantidad(${producto.id}, -1)">-</button>
                                                       <input type="number" id="cantidad_${producto.id}" name="cantidad" min="1" max="${producto.stock}" value="1">
                                                       <button class="cantidad-btn" onclick="modificarCantidad(${producto.id}, 1)">+</button>
                                                   </div>
                                                   <button class="add-to-cart" onclick="agregarAlCarro(${producto.id})">Añadir al carro</button>`
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
});

// Función para manejar agregar productos al carro
function agregarAlCarro(productoId) {
    console.log(`Producto ${productoId} agregado al carro`);
    // Aquí se puede implementar lógica adicional para manejar el carrito
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
