document.addEventListener('DOMContentLoaded', () => {
    const categoriaBotones = document.querySelectorAll('.categoria-boton');
    const productosContenedor = document.getElementById('productos-contenedor');

    categoriaBotones.forEach(boton => {
        boton.addEventListener('click', () => {
            const categoriaId = boton.getAttribute('data-categoria-id');
            fetch(`/productos/${categoriaId}/`) // Ruta para obtener productos de la categoría
                .then(response => response.json())
                .then(data => {
                    productosContenedor.innerHTML = ''; // Limpia el contenedor
                    if (data.productos.length > 0) {
                        data.productos.forEach(producto => {
                            productosContenedor.innerHTML += `
                                <div class="producto-item">
                                    <img src="${producto.imagen}" alt="${producto.titulo}">
                                    <h3>${producto.titulo}</h3>
                                    <p>${producto.descripcion}</p>
                                    <p>Precio: $${producto.precio}</p>
                                    ${
                                        producto.stock_ilimitado
                                            ? '<p>Stock: Ilimitado</p>'
                                            : producto.stock > 0
                                                ? `<label for="cantidad_${producto.id}">Cantidad:</label>
                                                   <input type="number" id="cantidad_${producto.id}" name="cantidad" min="1" max="${producto.stock}" value="1">
                                                   <button onclick="agregarAlCarro(${producto.id})">Añadir al carro</button>`
                                                : '<p class="sin-stock">Producto sin stock disponible</p>'
                                    }
                                </div>
                            `;
                        });
                    } else {
                        productosContenedor.innerHTML = '<p>No hay productos en esta categoría.</p>';
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
    // Lógica adicional para gestionar el carro
}
