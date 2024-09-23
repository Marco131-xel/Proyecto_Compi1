<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.List"%>
<%@page import="datos.Usuario"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuarios Ingresados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/detalles.css">
</head>
<body>
    <header>
        <h1>Lista de Usuarios Ingresados</h1>
    </header>
    <section>
        <%
            List<Usuario> listaUsuarios = (List<Usuario>) request.getAttribute("listaUsuarios");

            if (listaUsuarios != null && !listaUsuarios.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>Usuario</th>
                    <th>Nombre</th>
                    <th>Institución</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Usuario usuario : listaUsuarios) {
                %>
                <tr>
                    <td><%= usuario.getUsuario() %></td>
                    <td><%= usuario.getNombre() %></td>
                    <td><%= usuario.getInstitucion() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            } else {
        %>
            <p>No se encontraron usuarios.</p>
        <%
            }
        %>
        <a href="${pageContext.request.contextPath}/Index.jsp" class="boton">Volver a Inicio</a>
    </section>
    <footer>
        <p>&copy; © 2024 Mi Empresa XD. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
