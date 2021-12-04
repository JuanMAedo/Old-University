
package Usuario;
import java.util.Scanner;
import Residuos.*;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
/**
 *
 * @author juanm
 */
public class Usuario {
    private String nombre;
    private int numero;
    private double saldo;
    private int latas,botellas_grandes,botellas_pequeñas,vidrios;
    private ArrayList <Residuo> residuos = new ArrayList <> ();
    private final double pLata = 0.10; 
    private final double pVidrio = 0.30;
    private final double pBGrande = 0.20;
    private final double pBPequeña = 0.15;
    /* CONSTRUCTORES DE USUARIO */
    
    public Usuario(String nombre, int numero){
        this.nombre = nombre;
        this.numero = numero;
        saldo = 0;
    }    
    public Usuario(String nombre,int numero, double saldo){
        this.nombre = nombre;
        this.numero = numero;
        this.saldo = saldo;
    }    
    
    
    /* MÉTODOS GET Y SET DE LOS ATRIBUTOS DE USUARIO*/
    
    public int getNumero(){
        return(numero);
    }
    public double getSaldo(){
        return(saldo);
    }
    public String getNombre(){
        return(nombre);
    }

    
    public void setSaldo(double num){
        saldo += num;
    }
    /* MÉTODOS PROPIOS DE LA CLASE USUARIO */
    
    public void reciclar(){
        Scanner kbd = new Scanner(System.in);
        System.out.println("¿Qué va a reciclar? " + "\n" + "L (lata), B(Botella) o V(vidrio) ");
        char C = kbd.next().charAt(0);
        String s = Character.toString(Character.toUpperCase(C));
   
        String resulta1 = "Acaba de reciclar un/a ";    
        switch (s) {
            case "B":
      
                System.out.println("¿Cuál es la capacidad de la botella de plástico? P (capacidad < 1\n" +
                    "litro), G (capacidad > 1 litro)");
                char D = kbd.next().charAt(0);
                String a; 
                a= Character.toString(Character.toUpperCase(D));
                if ("G".equals(a)){
                    Residuo Bot_Grande = new Grande(pBGrande);
                    residuos.add(Bot_Grande);
                    botellas_grandes++;
                    setSaldo(pBGrande);
                    System.out.println(resulta1 + "botella de plástico grande y obtener " + pBGrande + " euros");
                } else if("P".equals(a)){
                    Residuo Bot_Pequeña = new Grande(pBPequeña);
                    residuos.add(Bot_Pequeña);
                    botellas_pequeñas++;
                    setSaldo(pBPequeña);
                    System.out.println(resulta1 + "botella de plástico pequeña y obtener " + pBPequeña + " euros");
                }
                break;
                
            case "L":
                Residuo lata = new Lata(pLata);
                residuos.add(lata);
                latas++;
                setSaldo(pLata);
                System.out.println(resulta1 + "lata y obtener " + pLata + " euros");
                break;
                
            case "V":
                Residuo vidrio = new Vidrio(pVidrio);
                residuos.add(vidrio);
                vidrios++;
                setSaldo(pVidrio);
                System.out.println(resulta1 + "vidrio y obtener " + pVidrio + " euros");
                break;
                
            default:
                System.err.println("No ha elegido una opción válida, repita de nuevo");
                break;
        }
    
    }
    
    public void imprimirTotalReciclado(){
        NumberFormat nf = new DecimalFormat("#.##");
        for( Residuo r: residuos){
            System.out.println(r.toString());
        }
            System.out.println("Consiguiendo un total de: " + getSaldo() + " euros.");
            System.out.println("En total de sus sesiones ha reciclado " + vidrios +" vidio(s), " +
                  latas + " lata(s), " + botellas_grandes + " botella(s) grande(s) y " + botellas_pequeñas + " botella(s) pequeña(s)");
            System.out.println("Y los pesos respectivos son: ");
        for( Residuo r: residuos){
            System.out.print(nf.format(r.getPeso()) + " ");    
        }
        System.out.println("\n");
        imprimirEtiquetasLatas();
        
    }
    
    public void imprimirEtiquetasLatas(){
        System.out.println(" Las latas recicladas caducaban en las siguientes fechas: ");
        for (Residuo r: residuos){
            if (r instanceof Lata){
                Lata l = (Lata) r;
                l.imprimirEtiqueta(); 
            }
        }
    }
    public void mensajeBienvenida(){
        NumberFormat nf = new DecimalFormat("#.##");
        
        System.out.println( "---------------------------------------------" +
                            "Bienvenido, " + getNombre() + "\n" +
                            "Su saldo actual es de: " + nf.format(getSaldo()) + " euros" + "\n" +
                            "---------------------------------------------");
    }
            
    /* MÉTODOS REESCRITOS DE LA CLASE USUARIO */
            
    @Override
    public boolean equals(Object O){
        if (this == O) return true;
        if (this == null) return false;
        if (getClass() != O.getClass()) return false;
        Usuario Us = (Usuario) O;
        return(getNumero() == Us.getNumero());
    }
}
