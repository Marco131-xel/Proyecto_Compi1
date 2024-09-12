package socket;

import java.io.*;
import java.net.*;


public class ClienteMovil extends Thread {
    private Socket clienteSocket;
    
    public ClienteMovil(Socket socket){
        this.clienteSocket = socket;
    }
    
    public void run(){
        try {
            BufferedReader entrada = new BufferedReader(new InputStreamReader(clienteSocket.getInputStream()));
            PrintWriter salida = new PrintWriter(clienteSocket.getOutputStream(), true);
            
            String clientemensaje;
            while((clientemensaje = entrada.readLine()) != null){
                System.out.println("Mensaje del cliente: " + clientemensaje);
                salida.println("Mensaje recibido: " + clientemensaje);
            }
            
            clienteSocket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}