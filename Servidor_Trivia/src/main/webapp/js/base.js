// Función para cargar las páginas en el contenedor principal
function loadContent(page, cssFile) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("mainContent").innerHTML = this.responseText;

            // Remover cualquier CSS específico anterior
            var oldLink = document.getElementById("dynamicCss");
            if (oldLink) {
                oldLink.parentNode.removeChild(oldLink);
            }

            // Agregar el nuevo CSS específico
            if (cssFile) {
                var link = document.createElement("link");
                link.id = "dynamicCss";
                link.rel = "stylesheet";
                link.href = "css/" + cssFile;
                document.getElementsByTagName("head")[0].appendChild(link);
            }
        }
    };
    xhttp.open("GET", page, true);
    xhttp.send();
}

// Cargar el CSS para Home.jsp cuando se cargue la página inicialmente
window.onload = function() {
    var link = document.createElement("link");
    link.id = "dynamicCss";
    link.rel = "stylesheet";
    link.href = "css/home.css";  // Ruta al archivo CSS de Home
    document.getElementsByTagName("head")[0].appendChild(link);
};
