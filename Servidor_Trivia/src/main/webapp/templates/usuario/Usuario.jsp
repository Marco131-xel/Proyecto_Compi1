<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuario</title>
</head>
<body>
    <h2>Agregar Usuarios</h2>

    <section>
        <!-- FORMULARIO PARA CARGAR ARCHIVOS -->
        <form action="${pageContext.request.contextPath}/Usuarios" method="post" enctype="multipart/form-data">
            <label for="archivo">Seleccione un archivo xson:</label>
            <input type="file" name="archivo" id="archivo" accept=".xson" required>
            <input type="submit" value="Cargar Archivo">
        </form>
    </section>

    <section>
        <form action="${pageContext.request.contextPath}/Usuarios" method="get">
            <input type="submit" value="Ver Usuarios Ingresados">
        </form>
    </section>

</body>
</html>