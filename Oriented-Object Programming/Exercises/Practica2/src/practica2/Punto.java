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
public class Punto {

    private int cordenada_X, cordenada_Y;

    public Punto(int X, int Y) {
        if ((X >= 0) && (Y >= 0)) {
            cordenada_X = X;
            cordenada_Y = Y;
        } 
    }
    
/*Metodos Get y Set de encapsulacion */
    
    public int GetX() {
        return cordenada_X;
    }

    public int GetY() {
        return cordenada_Y;
    }

    public void SetX(int X) {
        if (X >= 0) {
            cordenada_X = X;
        } else {
            System.out.println("Error, no se puede guardar un X negativo");
        }
    }

    public void SetY(int Y) {
        if (Y>= 0) {
            cordenada_Y = Y;
        } else {
            System.out.println("Error, no se puede guardar un Y negativo");
        }
    }

    /* Metodos operativos de la clase punto*/
    
    @Override
    public String toString () {
        return (" (" + cordenada_X + "," + cordenada_Y + ")" );
    }
     
    public Punto DesplazarXY (int X, int Y) {
        if ((cordenada_X + X >= 0) && (cordenada_Y + Y >= 0)){
           SetX( GetX() + X);
           SetY ( GetY() + Y);
           return new Punto(cordenada_X, cordenada_Y);
        }
        return null;
    } 
    
   public boolean esIgual (Punto P) {
       return ((P.GetX() == GetX()) && (P.GetY() == GetY()));
   }
   
   public Punto Copia () {
   Punto P = new Punto (GetX() , GetY());   
   return P;
   }
   
   public boolean estaDebajo (Punto P) {
       return (GetY() < P.GetY());
   }
   
   public boolean estaDerecha (Punto P) {
       return (GetX () < P.GetX() );
   }
}
