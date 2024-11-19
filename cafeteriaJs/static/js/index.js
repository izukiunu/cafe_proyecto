document.addEventListener('DOMContentLoaded', () => {
    const spinner = document.querySelector('.spinner');
    const items = document.querySelectorAll('.spinner-item');
    const prevButton = document.querySelector('.spinner-button.prev');
    const nextButton = document.querySelector('.spinner-button.next');
    let currentIndex = 0;

    if (!spinner || items.length === 0) {
        console.error("No se encontró el spinner o no hay elementos para mostrar.");
        return;
    }

    const updateSpinner = () => {
        const offset = -currentIndex * 100;
        spinner.style.transform = `translateX(${offset}%)`;
        console.log(`Offset actualizado: ${offset}`);
    };

    const showNextImage = () => {
        currentIndex = (currentIndex < items.length - 1) ? currentIndex + 1 : 0;
        console.log(`Mostrando imagen: ${currentIndex}`);
        updateSpinner();
    };

    const showPrevImage = () => {
        currentIndex = (currentIndex > 0) ? currentIndex - 1 : items.length - 1;
        console.log(`Mostrando imagen anterior: ${currentIndex}`);
        updateSpinner();
    };

    // Botones de navegación manual
    prevButton.addEventListener('click', showPrevImage);
    nextButton.addEventListener('click', showNextImage);

    // Cambio automático cada 10 segundos
    setInterval(() => {
        console.log("Ejecutando cambio automático");
        showNextImage();
    }, 10000);
});