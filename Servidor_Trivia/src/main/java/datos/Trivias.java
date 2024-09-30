package datos;

public class Trivias {
    
    String id_trivia;
    String tiempo;
    String nombre;
    String tema;

    public Trivias(String id_trivia, String tiempo, String nombre, String tema) {
        this.id_trivia = id_trivia;
        this.tiempo = tiempo;
        this.nombre = nombre;
        this.tema = tema;
    }

    public String getId_trivia() {
        return id_trivia;
    }

    public void setId_trivia(String id_trivia) {
        this.id_trivia = id_trivia;
    }

    public String getTiempo() {
        return tiempo;
    }

    public void setTiempo(String tiempo) {
        this.tiempo = tiempo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    @Override
    public String toString() {
        return "Trivias{" + "id_trivia=" + id_trivia + ", tiempo=" + tiempo + ", nombre=" + nombre + ", tema=" + tema + '}';
    }
}
