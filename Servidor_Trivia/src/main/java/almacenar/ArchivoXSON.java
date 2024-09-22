package almacenar;

import analizador.*;
import datos.Usuario;
import java.io.*;
import java.util.LinkedList;
import java.util.List;

public class ArchivoXSON {

    public static List<Usuario> leerXSON(String rutaArchivo) {
        List<Usuario> usuarios = new LinkedList<>();
        try {
            // Lee el contenido del archivo en un String
            StringBuilder contenido = new StringBuilder();
            BufferedReader reader = new BufferedReader(new FileReader(rutaArchivo));
            String linea;
            while ((linea = reader.readLine()) != null) {
                contenido.append(linea).append("\n");
            }
            reader.close();

            // Ahora procesa el contenido con el scanner y parser
            scanner scanner = new scanner(new java.io.StringReader(contenido.toString()));
            parser parser = new parser(scanner);

            parser.parse(); // Inicia el análisis

            if (!parser.listaErrores.isEmpty()) {
                parser.listaErrores.forEach(error -> {
                    System.out.println(error.getDesc());
                });
            } else {
                usuarios = parser.getUsuarios();
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

        // Añadir solo los nuevos usuarios que no estén ya en la lista existente
        for (Usuario nuevoUsuario : nuevosUsuarios) {
            if (!usuariosExistentes.contains(nuevoUsuario)) {
                usuariosExistentes.add(nuevoUsuario);
            }
        }

        FileWriter writer = null;
        try {
            // Crear el archivo si no existe
            File archivo = new File(rutaArchivo);
            archivo.getParentFile().mkdirs(); // Crear las carpetas si no existen
            writer = new FileWriter(archivo);

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

            writer.flush();
            System.out.println("Archivo guardado correctamente en: " + rutaArchivo);
        } catch (IOException e) {
            System.out.println("Error al guardar el archivo XSON: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (writer != null) {
                    writer.close();
                }
            } catch (IOException e) {
                System.out.println("Error al cerrar el FileWriter: " + e.getMessage());
                e.printStackTrace();
            }
        }
    }

}
