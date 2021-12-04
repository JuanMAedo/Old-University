/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

import java.util.Scanner;
/**
 *
 * @author juanm
 */
public class Prueba {
    public static void main (String[] args){
    Scanner a = new Scanner(System.in);
    Scanner b = new Scanner(System.in);
    System.out.print("Introduzca el nombre del coche: ");
    String nombre1 = a.nextLine();
    System.out.print("Introduzca la velocidad en recta del coche(en km/h): ");
    double velRecta1 = a.nextDouble();
    System.out.print("Introduzca la velocidad en curva del coche(en km/h): ");
    double velCurva1 = a.nextDouble();
    Coche c1 = new Coche(nombre1, velRecta1, velCurva1);
    System.out.print("Introduzca el nombre del siguiente coche: ");
    String nombre2 = b.nextLine();
    System.out.print("Introduzca la velocidad en recta del coche(en km/h): ");
    double velRecta2 = b.nextDouble();
    System.out.print("Introduzca la velocidad en curva del coche(en km/h): ");
    double velCurva2 = b.nextDouble();
    Coche c2 = new Coche(nombre2,velCurva2, velRecta2);
    Coche c3 = new Coche("Mercedes",20, 5);
    Coche c4 = new Coche("Otro Mercedes",c3);
    System.out.println(c1.GetNombre());
    System.out.println(c1);
    System.out.println(c2.GetNombre());
    System.out.println(c2);
    System.out.println(c3.GetNombre());
    System.out.println(c3);
    System.out.println(c4.GetNombre());
    System.out.println(c4);
    c1.acelerarRecta();
    System.out.println(c1.GetNombre() + " Acelerado en recta");
    System.out.println(c1);
    c1.acelerarCurva();
    System.out.println(c1.GetNombre() + " Acelerado en curva");
    System.out.println(c1);
    c1.acelerarRecta();
    System.out.println(c1.GetNombre() + " Frenado en recta");
    System.out.println(c1);
    c4.mejorarCoche();
    System.out.println(c4.GetNombre() + " Mejorado");
    System.out.println(c4);
    double[] rectas = {1, 3, 2, 4.5, 7};
    double[] curvas = {0.5, 2, 1.5, 3};
    Resultado resultado;
    final int vueltas = 8;
    Circuito suzuka = new Circuito (rectas,curvas);
    resultado = c2.competir (c1,suzuka, vueltas);
    String res = resultado.ganador();
    System.out.println (res);
    
    
    }
    
}
