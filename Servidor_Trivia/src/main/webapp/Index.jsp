<%-- 
    Document   : index
    Created on : 2 sept 2024, 16:53:38
    Author     : Marco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Trivias</title>
        <link rel="stylesheet" href="css/base.css">    
        <script src="./js/base.js"></script>
    </head>
    <body>
        <header>
            <h1>Trivia Web</h1>
        </header>

        <!-- MENU DE NAVEGACION-->
        <div class="menuNav">
            <nav>
                <ul>
                    <li><a href="#" class="botonMenu" onclick="loadContent('./templates/Home.jsp', 'home.css'); return false;">Home</a></li>
                    <li><a href="#" class="botonMenu" onclick="loadContent('./templates/usuario/Usuario.jsp', 'usuario.css'); return false;">Usuarios</a></li>
                    <li><a href="#" class="botonMenu" onclick="loadContent('./templates/trivias/Trivias.jsp', 'usuario.css'); return false;">Trivias</a></li>
                    <li><a href="#" class="botonMenu" onclick="loadContent('./templates/reportes/Reportes.jsp'); return false;">Reportes</a></li>
                    <li><a href="#" class="botonMenu" onclick="loadContent('./templates/solicitud/Solicitud.jsp', 'usuario.css'); return false;">Solicitud</a></li>
                </ul>
            </nav>
        </div>
        
        <section id="mainContent">
            <!-- Aquí se cargará el contenido dinámico -->
            <jsp:include page="./templates/Home.jsp"/>
        </section>
        <script>
            // Cargar el CSS para Home.jsp cuando se cargue la página inicialmente
            var link = document.createElement("link");
            link.id = "dynamicCss";
            link.rel = "stylesheet";
            link.href = "css/home.css";  // Ruta al archivo CSS de Home
            document.getElementsByTagName("head")[0].appendChild(link);
        </script>

        <footer>
            © 2024 Mi Empresa XD. Todos los derechos reservados.
        </footer>
    </body>
</html>