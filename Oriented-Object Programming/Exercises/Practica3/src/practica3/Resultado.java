/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;
    import java.text.DecimalFormat;
    import java.text.NumberFormat;
/**
 *
 * @author juanm
 */
public class Resultado {
    private Coche[] cocheCompeticion;
    private double[] tiempoCompeticion;
    
    public Resultado (Coche[] coches, double[] tiempos){
        SetCochesCompeticion(coches);
        SetTiemposCompeticion(tiempos);
    }
  
    public Coche[] GetCochesCompeticion () {
        Coche [] car = new Coche [cocheCompeticion.length];
        System.arraycopy(cocheCompeticion, 0, car, 0, cocheCompeticion.length);
        return car;
    }
    
    public double[] GetTiemposCompeticion () {
        double [] tie = new double [tiempoCompeticion.length];
        System.arraycopy(tiempoCompeticion, 0, tie, 0, tiempoCompeticion.length);
        return tie;
    }
    
    public void SetCochesCompeticion (Coche[] C) {
        cocheCompeticion = new Coche [C.length];
        System.arraycopy(C,0,cocheCompeticion,0, cocheCompeticion.length);
    }
    public void SetTiemposCompeticion (double[] T){
        tiempoCompeticion = new double [T.length];
        System.arraycopy(T,0,tiempoCompeticion,0, tiempoCompeticion.length);
    }
    
    public double getRes1 () {return tiempoCompeticion[0];}
    public double getRes2() {return tiempoCompeticion[1];}
    public void setRes1 (double r1) { tiempoCompeticion[0] = r1;}
    public void setRes2 (double r2) { tiempoCompeticion[1] = r2;}

    
    public String ganador () {
        NumberFormat nf = new DecimalFormat("##.###");
        String s;
        if (getRes1() < 0 || getRes2() < 0) {
           s =("La carrera queda anulada, ya que al menos un competidor no ha salido \n ");
        } else {
            if (getRes1() < getRes2()) {
                s =("El ganador de la competicion ha sido: " + cocheCompeticion[0].GetNombre() + ", con un tiempo total de: " + nf.format(tiempoCompeticion[0]) + " segundos.\n" + "El siguiente clasificado ha sido: " + cocheCompeticion[1].GetNombre() + ", con un tiempo total de: " + nf.format(tiempoCompeticion[1]) + " segundos.\n");
            }else if (getRes1() > getRes2()){
                s =("El ganador de la competicion ha sido: " + cocheCompeticion[1].GetNombre() + ", con un tiempo total de: " + nf.format(tiempoCompeticion[1]) + " segundos.\n" + "El siguiente clasificado ha sido: " + cocheCompeticion[0].GetNombre() + ", con un tiempo total de: " + nf.format(tiempoCompeticion[0])+ " segundos.\n");
            } else {
                s = ("Empate \n");
            }
        } 
        return (s);
    }
}
