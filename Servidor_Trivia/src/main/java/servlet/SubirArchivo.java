package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import analizador.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/SubirArchivo")
@MultipartConfig  // Para procesar archivos
public class SubirArchivo extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtén el archivo del request
        Part archivo = request.getPart("archivo");

        // Leer el contenido del archivo como String
        String contenido = new String(archivo.getInputStream().readAllBytes(), StandardCharsets.UTF_8);

        // Enviar el contenido al analizador (esto se define en tu código)
        procesarXSON(contenido);

        // Redirigir a una página de éxito o mostrar resultados
        response.getWriter().println("Archivo procesado correctamente.");
    }

    private void procesarXSON(String contenido) {
        // Aquí vas a integrar tu analizador JFlex y CUP
        try {
            scanner scanner = new scanner(new java.io.StringReader(contenido)); // Usando JFlex Scanner
            parser parser = new parser(scanner);  // Usando CUP parser

            parser.parse();  // Inicia el análisis

            if (!parser.listaErrores.isEmpty()) {
                parser.listaErrores.forEach(error -> {
                    System.out.println(error.getDesc());
                });
            } else {
                System.out.println("Archivo XSON procesado correctamente.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
