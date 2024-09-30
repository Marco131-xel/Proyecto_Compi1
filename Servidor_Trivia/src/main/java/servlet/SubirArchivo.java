package servlet;

import almacenar.ArchivoXSON;
import analizador.parser;
import analizador.scanner;
import datos.Usuario;
import excepciones.Errores;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.LinkedList;

@WebServlet("/Usuarios")
@MultipartConfig  // Para procesar archivos
public class SubirArchivo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Ruta al archivo recovery.xson
        String rutaArchivo = getServletContext().getRealPath("/WEB-INF/data/recovery.xson");

        // Leer los usuarios desde el archivo recovery.xson
        List<Usuario> listaUsuarios = ArchivoXSON.leerXSON(rutaArchivo);

        // Pasar la lista de usuarios al JSP
        request.setAttribute("listaUsuarios", listaUsuarios);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/templates/usuario/verUsuarios.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part archivo = request.getPart("archivo");
        String contenido = new String(archivo.getInputStream().readAllBytes(), StandardCharsets.UTF_8);

        // Procesar el archivo y obtener la lista de usuarios y errores
        List<Usuario> listaUsuarios = procesarXSON(contenido, request);  // Ya enviamos el request para manejar los errores

        if (request.getAttribute("listaErrores") != null) {
            // Si hay errores, los pasamos al JSP de errores
            RequestDispatcher dispatcher = request.getRequestDispatcher("/templates/errores/ErroresUsu.jsp");
            dispatcher.forward(request, response);
        } else if (listaUsuarios != null && !listaUsuarios.isEmpty()) {
            // Si no hay errores y la lista de usuarios no está vacía, guardamos los usuarios
            String rutaArchivo = getServletContext().getRealPath("/WEB-INF/data/recovery.xson");
            ArchivoXSON.guardarXSON(listaUsuarios, rutaArchivo);

            request.setAttribute("listaUsuarios", listaUsuarios);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/templates/usuario/mostrar.jsp");
            dispatcher.forward(request, response);
        } else {
            // Si la lista de usuarios está vacía
            System.out.println("La lista de usuarios está vacía.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/templates/usuario/verUsuarios.jsp");
            dispatcher.forward(request, response);
        }
    }

    private List<Usuario> procesarXSON(String contenido, HttpServletRequest request) {
        List<Usuario> listaUsuarios = new LinkedList<>();
        // Aquí vas a integrar tu analizador JFlex y CUP
        try {
            scanner scanner = new scanner(new java.io.StringReader(contenido)); // Usando JFlex Scanner
            parser parser = new parser(scanner);  // Usando CUP parser

            parser.parse();  // Inicia el análisis

            if (!parser.listaErrores.isEmpty()) {
                request.setAttribute("listaErrores", parser.getListaErrores());
                return null;
            }
            listaUsuarios = parser.getUsuarios();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaUsuarios;
    }
}