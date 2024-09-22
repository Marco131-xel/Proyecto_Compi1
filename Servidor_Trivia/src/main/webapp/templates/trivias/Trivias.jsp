<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trivias</title>
</head>
<body>
    <h2>Agregar Trivias</h2>

    <section>
        <!-- PARA CARGAR ARCHIVOS-->
        <form action="SubirTrivia" method="post" enctype="multipart/form-data">
            <label for="archivo">Seleccione un archivo xson:</label>
            <input type="file" name="archivo" id="archivo" accept=".xson" required>
            <input type="submit" value="Cargar Archivo">
        </form>
    </section>
</body>
</html>