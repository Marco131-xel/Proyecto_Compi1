package datos;

public class Componentes{
    
    String id;
    Trivias trivia;
    String respuesta;
    String clase;
    String texto;
    String opciones;

    public Componentes(String id, Trivias trivia, String respuesta, String clase, String texto, String opciones) {
        this.id = id;
        this.trivia = trivia;
        this.respuesta = respuesta;
        this.clase = clase;
        this.texto = texto;
        this.opciones = opciones;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Trivias getTrivia() {
        return trivia;
    }

    public void setTrivia(Trivias trivia) {
        this.trivia = trivia;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    public String getClase() {
        return clase;
    }

    public void setClase(String clase) {
        this.clase = clase;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public String getOpciones() {
        return opciones;
    }

    public void setOpciones(String opciones) {
        this.opciones = opciones;
    }

    @Override
    public String toString() {
        return "Componentes{" + "id=" + id + ", trivia=" + trivia + ", respuesta=" + respuesta + ", clase=" + clase + ", texto=" + texto + ", opciones=" + opciones + '}';
    }
    
}
