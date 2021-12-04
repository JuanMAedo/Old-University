/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;

/**
 *
 * @author juanm
 */
public class Principal {
    public static void main (String [] args) {
    Punto P1 = new Punto(6,5);
    Punto P2 = new Punto(1,1);
    Rectangulo R1 = new Rectangulo ();
    Rectangulo R2 = new Rectangulo (P2,P1);
    System.out.println(R1);
    if (R1.esIgual(R2)) {
    System.out.println(R2);
    }else{
    System.out.println(R1);
    }
    
    
    }
}
