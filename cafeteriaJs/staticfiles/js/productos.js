// --- Eventos al cargar la página ---
document.addEventListener('DOMContentLoaded', () => {
    // No hay funciones del carrito ni elementos relacionados
});

function agregarAlCarrito(productoId) {
    const cantidadElement = document.getElementById(`cantidad-${productoId}`);
    if (!cantidadElement) {
        console.error(`Elemento con ID cantidad-${productoId} no encontrado`);
        return;
    }
    const cantidad = cantidadElement.value;

    fetch("{% url 'agregar_al_carrito' %}", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "X-CSRFToken": document.querySelector('meta[name="csrf-token"]').getAttribute("content")
        },
        body: JSON.stringify({ producto_id: productoId, cantidad: parseInt(cantidad) })
    })
        .then(response => response.json())
        .then(data => {
            if (data.status === "success") {
                alert(data.message);
                actualizarCarrito();
            } else {
                alert(data.message);
            }
        })
        .catch(error => console.error("Error al agregar al carrito:", error));
}


function cambiarCantidad(action, productoId) {
    const input = document.getElementById(`cantidad-${productoId}`);
    let cantidad = parseInt(input.value);

    if (action === 'increment') {
        cantidad += 1;
    } else if (action === 'decrement' && cantidad > 1) {
        cantidad -= 1;
    }

    input.value = cantidad;
}


f// Configura la URL correctamente desde el template Django
const urlVerCarrito = "{% url 'ver_carrito' %}";
