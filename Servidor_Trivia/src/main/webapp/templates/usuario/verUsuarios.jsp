<%@page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuarios Ingresados</title>
</head>
<body>
    <h2>Lista de Usuarios Ingresados</h2>

    <table border="1">
        <thead>
            <tr>
                <th>Usuario</th>
                <th>Nombre</th>
                <th>Institución</th>
            </tr>
        </thead>
        <tbody>
            <!-- Itera sobre la lista de usuarios usando JSTL -->
            <c:forEach var="usuario" items="${listaUsuarios}">
                <tr>
                    <td>${usuario.usuario}</td>
                    <td>${usuario.nombre}</td>
                    <td>${usuario.institucion}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Enlace para volver a la página de carga de usuarios -->
    <a href="${pageContext.request.contextPath}/Index.jsp">Volver</a>
</body>
</html>
