<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.List"%>
<%@page import="excepciones.Errores"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Errores en el archivo XSON</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/detalles.css">
</head>
<body>
    <header>
        <h1>Errores en el archivo XSON</h1>
    </header>
    <section>
        <h2>Errores encontrados:</h2>

        <%
            List<Errores> listaErrores = (List<Errores>) request.getAttribute("listaErrores");

            if (listaErrores != null && !listaErrores.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>Tipo de Error</th>
                    <th>Descripción</th>
                    <th>Fila</th>
                    <th>Columna</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Errores error : listaErrores) {
                %>
                <tr>
                    <td><%= error.getTipo() %></td>
                    <td><%= error.getDesc() %></td>
                    <td><%= error.getLinea() %></td>
                    <td><%= error.getColumna() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            } else {
        %>
        <p>No se encontraron errores en el archivo.</p>
        <%
            }
        %>

        <a href="${pageContext.request.contextPath}/Index.jsp" class="boton">Volver a Cargar Archivo</a>
    </section>
    <footer>
        <p>&copy; © 2024 Mi Empresa XD. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
