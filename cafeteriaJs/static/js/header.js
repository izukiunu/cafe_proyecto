
function actualizarCarrito() {
    fetch("/carrito/detalle/")
        .then(response => response.json())
        .then(data => {
            const carritoIcon = document.getElementById("carrito-count");
            if (carritoIcon) {
                const totalProductos = data.carrito.reduce((sum, item) => sum + item.cantidad, 0);
                carritoIcon.textContent = totalProductos;
            } else {
                console.warn("El elemento con ID 'carrito-count' no está presente en esta página.");
            }
        })
        .catch(error => console.error("Error al actualizar el carrito:", error));
}


document.addEventListener("DOMContentLoaded", actualizarCarrito);
