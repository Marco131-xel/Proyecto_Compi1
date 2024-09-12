package socket;

//import jakarta.ws.rs.client.Client;
import java.io.*;
import java.net.*;

public class Servidor extends Thread{
    private ServerSocket server;
    private int port;
    
    public Servidor(int port){
        this.port = port;
    }
    
    public void run(){
        try{
            server = new ServerSocket(port);
            System.out.println("Servidor de sockets iniciado en el puerto: " + port);
            
            while(true){
                Socket cliente = server.accept();
                System.out.println("Cliente conectado: " + cliente.getInetAddress().getHostAddress());
                new ClienteMovil(cliente).start();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        int port = 8080;
        new Servidor(port).start();
    }
}