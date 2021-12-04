/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

/**
 *
 * @author juanm
 */
public class Coche {
    
    double INCREMENTO = 5;
    double MEJORA = 15;
    private double velocidadRecta, velocidadCurva; /* En km/h */
    private String nombreCoche;
   
   public Coche (String nombre) {
        if (nombre != null) {
            nombreCoche = nombre;
        } else {
            nombreCoche = ("");
        }
        velocidadRecta = 0;
        velocidadCurva = 0;
   }

   public Coche (String nombre, double velRecta) {
        if (nombre != null) {
            nombreCoche = nombre;
        } else {
            nombreCoche = ("");
        }
        SetVelocidadRecta(velRecta);
        velocidadCurva = 0;
   }

   public Coche (String nombre, double velRecta, double velCurva) {
        if (nombre != null) {
            nombreCoche = nombre;
        } else {
            nombreCoche = ("");
        }
        SetVelocidadRecta(velRecta);
        SetVelocidadCurva(velCurva);
   }
   
   public Coche (String nombre,Coche C){
        if (nombre != null) {
            nombreCoche = nombre;
        } else {
            nombreCoche = ("");
        }
        SetVelocidadRecta(C.GetVelocidadRecta());
        SetVelocidadCurva(C.GetVelocidadCurva());
   } 
   
   public double GetVelocidadRecta() {
        return (velocidadRecta);
   }
   
   public double GetVelocidadCurva () {
        return(velocidadCurva);
   }
   
   public String GetNombre() {
        return nombreCoche;
   }
   
   public void SetVelocidadRecta (double velocidad) {
        if (velocidad >= 0) {
            velocidadRecta = velocidad;
        } else {
            velocidadRecta = 0;
        }
   } 
   
   public void SetVelocidadCurva (double velocidad) {
        if (velocidad >= 0) {
            velocidadCurva = velocidad;
        } else {
            velocidadCurva = 0;
        }
   }
   
   public void acelerarRecta () {
       SetVelocidadRecta(GetVelocidadRecta() + INCREMENTO);
   }
   
   public void acelerarCurva () {
       SetVelocidadRecta(GetVelocidadCurva() + INCREMENTO);
   }
   
   public void decelerarRecta () {
       SetVelocidadRecta(GetVelocidadRecta() - INCREMENTO);
   }
   
   public void decelerarCurva () {
       SetVelocidadRecta(GetVelocidadCurva() - INCREMENTO);
   }
   
   public void mejorarCoche () {
       SetVelocidadRecta(GetVelocidadRecta() + MEJORA);
       SetVelocidadCurva(GetVelocidadCurva() + MEJORA);
   }
   
   public double tiempoRecta (double R) {
       if (GetVelocidadRecta() == 0){
           return(-1);
       } else {
            double velocidad = (GetVelocidadRecta()/3600);
            return(R/velocidad);
       }
   }
   
   public double tiempoCurva (double C) {
       if (GetVelocidadCurva() == 0){
            return(-1);
       } else {
            double velocidad = (GetVelocidadCurva()/3600);
            return(C/velocidad);
       }
    }
   
   public boolean cocheDetenido () {
       return((GetVelocidadRecta() == 0) || (GetVelocidadCurva() == 0));
   }
   
   public double recorrerCircuito ( Circuito C) {
       if (!(cocheDetenido())){
           return(this.tiempoRecta(C.TotalCurvas()) + this.tiempoCurva(C.TotalRectas()));
       }
        return (-1);
   }
   
   public Resultado competir (Coche Car, Circuito Cir, int vueltas) {
       double resultadoC1 = (this.recorrerCircuito(Cir) * vueltas);
       double resultadoC2 = (Car.recorrerCircuito(Cir) * vueltas);
       double [] tiempos ={resultadoC1, resultadoC2};
       Coche [] coches = {this,Car};
       return(new Resultado(coches, tiempos));
    }
   
   @Override
    public String toString() {
        return (GetNombre() + "{ velRecta= " + GetVelocidadRecta() + ", velCurva= " + GetVelocidadCurva() + "}");
    }
}


