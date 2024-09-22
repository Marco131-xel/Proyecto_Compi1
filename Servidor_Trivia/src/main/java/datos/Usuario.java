package datos;

public class Usuario {
    
    String usuario;
    String password;
    String nombre;
    String institucion;

    public Usuario(String usuario, String password, String nombre, String institucion) {
        this.usuario = usuario;
        this.password = password;
        this.nombre = nombre;
        this.institucion = institucion;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getInstitucion() {
        return institucion;
    }

    public void setInstitucion(String institucion) {
        this.institucion = institucion;
    }

    @Override
    public String toString() {
        return "Usuario{" + "usuario=" + usuario + ", password=" + password + ", nombre=" + nombre + ", institucion=" + institucion + '}';
    }
    
}
