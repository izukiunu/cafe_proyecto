fetch("/carrito/", {
    headers: {
        "Accept": "application/json",
    }
})
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.json();
    })
    .then(data => {
        const carritoProductos = document.getElementById("carrito-productos");
        carritoProductos.innerHTML = "";
        data.carrito.forEach(item => {
            const li = document.createElement("li");
            li.textContent = `${item.producto} - ${item.cantidad} x $${item.subtotal}`;
            carritoProductos.appendChild(li);
        });
        document.getElementById("total-pagar").textContent = `$${data.total}`;
    })
    .catch(error => console.error("Error al cargar el carrito:", error));






    function cargarCarrito() {
        fetch("/carrito/")
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                const carritoProductos = document.getElementById("carrito-productos");
                carritoProductos.innerHTML = "";
                data.carrito.forEach(item => {
                    const li = document.createElement("li");
                    li.textContent = `${item.producto} - ${item.cantidad} x $${item.subtotal}`;
                    carritoProductos.appendChild(li);
                });
                document.getElementById("total-pagar").textContent = `$${data.total}`;
            })
            .catch(error => console.error("Error al cargar el carrito:", error));
    }
    
    function eliminarDelCarrito(productoId) {
        fetch("/carrito/eliminar/", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "X-CSRFToken": getCookie("csrftoken")
            },
            body: JSON.stringify({ producto_id: productoId })
        })
        .then(response => response.json())
        .then(data => {
            if (data.error) {
                console.error("Error al eliminar producto:", data.error);
            } else {
                console.log("Producto eliminado:", data.message);
                cargarCarrito(); // Vuelve a cargar el carrito
            }
        })
        .catch(error => console.error("Error al eliminar producto:", error));
    }
    
    function getCookie(name) {
        let cookieValue = null;
        if (document.cookie && document.cookie !== '') {
            const cookies = document.cookie.split(';');
            for (let i = 0; i < cookies.length; i++) {
                const cookie = cookies[i].trim();
                if (cookie.substring(0, name.length + 1) === (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
    
    
    function finalizarCompra() {
        fetch("/carrito/finalizar/")
            .then(response => response.json())
            .then(data => {
                const detalles = `
                    <h3>Detalles del Pedido</h3>
                    <p>Total: $${data.total}</p>
                    <p>Código de Pedido: ${data.codigo}</p>
                    <h4>Transferir a:</h4>
                    <p>Cuenta: 21302986-K (Cuenta RUT)</p>
                    <p>Banco: BancoEstado</p>
                    <p>Email: sebastianaaguirremundaca@gmail.com</p>
                    <p>Por favor, envía el comprobante al correo indicado.</p>
                `;
                document.querySelector(".cart-total").innerHTML = detalles;
            })
            .catch(error => console.error("Error al finalizar la compra:", error));
    }
    
    // Cargar carrito al iniciar la página
    document.addEventListener("DOMContentLoaded", cargarCarrito);
    