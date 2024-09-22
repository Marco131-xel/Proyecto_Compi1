package almacenar;

import analizador.*;
import datos.Usuario;
import java.io.*;
import java.util.LinkedList;
import java.util.List;

public class ArchivoXSON {

    // Lee los usuarios para almacenarlos
    public static List<Usuario> leerXSON(String rutaArchivo) {
        List<Usuario> usuarios = new LinkedList<>();
        try {
            File archivo = new File(rutaArchivo);
            if (!archivo.exists() || archivo.length() == 0) {
                System.out.println("El archivo XSON no existe o está vacío.");
                return usuarios;
            }

            // Leer el archivo como String
            BufferedReader reader = new BufferedReader(new FileReader(archivo));
            StringBuilder contenido = new StringBuilder();
            String linea;
            while ((linea = reader.readLine()) != null) {
                contenido.append(linea).append("\n");
            }
            reader.close();

            // Verificar si el contenido está vacío
            String contenidoStr = contenido.toString().trim();
            if (contenidoStr.isEmpty()) {
                System.out.println("El archivo XSON está vacío o tiene solo espacios en blanco.");
                return usuarios;
            }

            // Usar tu analizador JFlex y CUP para procesar el contenido del archivo
            scanner scanner = new scanner(new StringReader(contenidoStr)); // JFlex Scanner
            parser parser = new parser(scanner);  // CUP Parser

            parser.parse();  // Ejecutar el análisis sintáctico

            System.out.println("Contenido del archivo XSON:\n" + contenidoStr);

            // Si no hubo errores, obtener la lista de usuarios
            if (parser.listaErrores.isEmpty()) {
                usuarios = parser.getUsuarios();
            } else {
                // Manejar errores si los hubiera
                System.out.println("Errores durante el análisis del archivo XSON:");
                parser.listaErrores.forEach(error -> {
                    System.out.println(error.getDesc());
                });
            }

        } catch (FileNotFoundException e) {
            System.out.println("El archivo no fue encontrado: " + e.getMessage());
        } catch (IOException e) {
            System.out.println("Error al leer el archivo XSON: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error durante el análisis del archivo XSON: " + e.getMessage());
            e.printStackTrace();
        }
        return usuarios;
    }

    // Guardar los usuarios en el archivo XSON
    public static void guardarXSON(List<Usuario> nuevosUsuarios, String rutaArchivo) {
        // Leer los usuarios existentes
        List<Usuario> usuariosExistentes = leerXSON(rutaArchivo);

        // Añadir los nuevos usuarios
        usuariosExistentes.addAll(nuevosUsuarios);

        FileWriter writer = null;  // Declarar fuera del bloque
        try {
            writer = new FileWriter(rutaArchivo);

            // Escribir la cabecera del archivo XSON
            writer.write("<?xson version=\"1.0\" ?>\n");
            writer.write("<!realizar_solicitud: \"USUARIO_NUEVO\" >\n");
            writer.write("{\n  \"DATOS_USUARIO\": [\n");

            for (int i = 0; i < usuariosExistentes.size(); i++) {
                Usuario usuario = usuariosExistentes.get(i);
                writer.write("    {\n");
                writer.write("      \"USUARIO\": \"" + usuario.getUsuario() + "\",\n");
                writer.write("      \"PASSWORD\": \"" + usuario.getPassword() + "\",\n");
                writer.write("      \"NOMBRE\": \"" + usuario.getNombre() + "\",\n");
                writer.write("      \"INSTITUCION\": \"" + usuario.getInstitucion() + "\"\n");
                writer.write("    }");

                if (i < usuariosExistentes.size() - 1) {
                    writer.write(",\n");
                } else {
                    writer.write("\n");
                }
            }

            writer.write("  ]\n}");
            writer.write("\n<fin_solicitud_realizada!>");

            System.out.println("Archivo guardado correctamente en: " + rutaArchivo);
            System.out.println("Contenido guardado:\n" + usuariosExistentes.toString());
        } catch (IOException e) {
            System.out.println("Error al guardar el archivo XSON: " + e.getMessage());
            e.printStackTrace();  // Imprimir la traza completa
        } finally {
            try {
                if (writer != null) {
                    writer.close();  // Asegurarse de que se cierre
                }
            } catch (IOException e) {
                System.out.println("Error al cerrar el FileWriter: " + e.getMessage());
            }
        }
    }

}
