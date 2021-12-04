/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Principal;

/**
 *
 * @author juanm
 */
import java.io.Serializable;
import java.util.Random;

public class Combinacion implements Serializable {
    private char[] combinacion = new char[4];
    final char [] colores = {'B','N','A','R','V','M'};

    /* MÉTODOS CONSTRUCTORES */
    
    public Combinacion(char[] c){
        combinacion = new char [c.length];
        System.arraycopy(c, 0, combinacion, 0, c.length);     
    }

    public Combinacion () {
        for(int i = 0; 3 >= i ; i++){               
            Random random = new Random();       
            int a = random.nextInt(7000);    /* Llamamos al metodo random.nexInt(num) para que sea siempre positivo el numero aleotorio con el que realizar la division del array de posibles colores */
            combinacion[i] = colores[a%6];      
        }
    }
    
    /* MÉTODOS PROPIOS DE LA CLASE */
    
    public boolean esGanadora(Combinacion C){
        if (this.devolverColocados(C) == 4){return true;}
        else{return false;}
    }
    
    public int devolverColocados(Combinacion C){
        int colocados = 0;
        Combinacion Copia = C.copia();
        for(int i = 0; this.combinacion.length > i ; i++){
           for(int j = 0; Copia.combinacion.length > j; j++){
                if (this.esColocado(Copia,i,j)){
                    Copia.combinacion[j] = '-';    
                    colocados += 1;
                     break;
                } else if(this.esAcierto(Copia,i,j)){
                    Copia.combinacion[j] = '-';
                    break;
                }
            }
        }
        return colocados;
    }
        
    public int devolverAciertos(Combinacion C){
        Combinacion Copia = C.copia();
        int aciertos = 0;
        for(int i = 0 ; this.combinacion.length > i ; i++){
            for(int j = 0; Copia.combinacion.length > j; j++){
                if (this.esAcierto(Copia,i,j)){
                    Copia.combinacion[j] = '-';
                    aciertos += 1;  
                    break;
                }else if(this.esColocado(Copia,i,j)){
                    Copia.combinacion[j] = '-';
                    break;
                }       
            }
        }
        return aciertos;
    }
    
    @Override
    public String toString(){
        char a = combinacion[0];
        char b = combinacion[1];
        char c = combinacion[2];
        char d = combinacion[3];
        String s = "";
        s += Character.toString(a);
        s += Character.toString(b);
        s += Character.toString(c);
        s += Character.toString(d);
        return(s);
    }
    public String posiciones(){
        char a = combinacion[0];
        char b = combinacion[1];
        char c = combinacion[2];
        char d = combinacion[3];
        String s = "";
        s += ("Posición 1º: " + Character.toString(a) + "\n");
        s += ("Posición 2º: " + Character.toString(b) + "\n");        
        s += ("Posición 3º: " + Character.toString(c) + "\n");
        s += ("Posición 4º: " + Character.toString(d) + "\n");
        return(s);
    
    }
    
    private Combinacion copia (){
        return new Combinacion (this.combinacion);
    }
    private boolean esColocado(Combinacion C,int i, int j){
        return((this.combinacion[i] == C.combinacion[j]) && (i == j));
    }
    private boolean esAcierto(Combinacion C, int i, int j){
        return((this.combinacion[i] == C.combinacion[j]) && (i != j));
    }
    
    
    public static void main (String [] args){
       char [] b = {'A','B','A','V'};
        Combinacion c = new Combinacion(b);      
        System.out.println(c.combinacion);   
        char [] a = {'A','B','A','V'};
        Combinacion p = new Combinacion(a);
        System.out.println(c.devolverAciertos(p));
        System.out.println(c.devolverColocados(p));
        if(c.esGanadora(p))System.out.println("Ganador");
    }
}
