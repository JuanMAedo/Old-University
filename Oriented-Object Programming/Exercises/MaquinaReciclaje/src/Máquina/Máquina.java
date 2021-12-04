/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Máquina;
import Usuario.Usuario;
import java.util.Scanner;
import java.util.ArrayList;
import java.text.DecimalFormat;
import java.text.NumberFormat;
/**
 *
 * @author juanm
 */
public class Máquina {
    private double dinero;
    private ArrayList <Usuario> usuarios = new ArrayList<> ();  
    
 
    
/*MÉTODOS GET Y SET DE LA CLASE USUARIO*/
    private void setUsuario(Usuario u){    
        usuarios.add (u);
    }
   
    public void Menu() {
        
        Scanner kbd = new Scanner(System.in);
        System.out.println("-------------------------" + "\n" +
                           "Seleccione su opción:" );
        System.out.println("1.- Identificarse." +"\n" + 
                           "2.- Crear un Nuevo Uusario." + "\n" + 
                           "3.- Salir" + "\n");
        int numero = kbd.nextInt();
        if ((numero == 1) || (numero == 2)){
            switch (numero) {
                case 1:
                    Usuario a = identificar();
                    if (a == null){
                        System.out.println("Este usuario no está registrado");
                        Menu();
                    }
                    a.mensajeBienvenida();
                    do{
                        if (preguntaReciclaje()){
                            a.reciclar();}
                    }while(preguntaReciclaje() == true);
                    a.imprimirTotalReciclado();
                    a.imprimirEtiquetasLatas();
                    break;
                case 2:
                    Usuario b = nuevoUsuario();
                    if (b == null){
                        Menu();
                    }  
                    boolean s = preguntaReciclaje();
                    do{
                        if (s){
                            b.reciclar();}
                    }while(preguntaReciclaje());
                    b.imprimirTotalReciclado();
                    b.imprimirEtiquetasLatas();
                    break;
                default:
                    System.out.println("Introduzca un comando válido");
                    break;
                    }    
        }else if (numero == 3){
             despedida();       
        }
        for(Usuario r : usuarios){
            dinero += r.getSaldo();
        }
    }
    
    public Usuario registrar(){
        return nuevoUsuario();
    }
    
    public Usuario identificar() {
        int ident = solicitarNumero();
        return(estaRegistrado(ident));
    }

    private Usuario nuevoUsuario(){
        Scanner a = new Scanner(System.in);
        
        System.out.print("Introduzca el nombre: ");
        String nombre = a.nextLine();
        int num;
        boolean res;
        do{
            num = solicitarNumero();
            if (estaRegistrado(num) != null){
                System.err.println("Existe un usuario ya registrado con ese identificador");
                res = false;
                return null;
            } else {
                Usuario U = new Usuario(nombre,num);
                setUsuario(U);
                System.out.println("El usuario ha sido creado con éxito");
                res = true;
                return U;
            }}while(res == false);
            
    }    
    
    private int solicitarNumero() {
        Scanner b = new Scanner(System.in);
        System.out.print("Introduzca su número de usuario: ");
        int numero = b.nextInt();
        return numero;
    }
    
    
    private Usuario estaRegistrado(int num) {
        Usuario usu = new Usuario("", num, 0);
        
        /*Usuario "cebo", acorde con equals*/
        if (this.usuarios.contains(usu)) {
            int i = this.usuarios.indexOf(usu);
            usu = (Usuario) this.usuarios.get(i);
        } else {
            usu = null;
        }
         return usu;
    }

    private void despedida(){
        System.out.println("Hasta luego, ¡Vuelva pronto!");
    }
    private boolean preguntaReciclaje(){
        Scanner k = new Scanner(System.in);
        System.out.println("¿Quiere empezar a reciclar? s/n");
        String a = k.nextLine();
        if (a.equals("s")){
            return true;
        }else{
            return false;
        } 
    }


    public static void main (String[] args){
        Máquina ad = new Máquina();
        ad.Menu();
    }


}