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
public class Circuito {
   private double [] rectas ;
   private double [] curvas;
   

    public Circuito (double[] R,double[] C) {
     SetRectas(R);
     SetCurvas(C);
    }
    
    public double[] GetRectas() {
        double[] rec = new double [rectas.length];
        System.arraycopy(rectas, 0, rec, 0, rectas.length);
        return rec;
    }
    public double[] GetCurvas() {
        double[] curv = new double [curvas.length];
        System.arraycopy(rectas, 0, curv, 0, curvas.length);
        return curv;
    }
    
    public void SetRectas(double[] R) {
        rectas = new double [R.length];
        System.arraycopy(R,0,rectas,0, R.length);
    }
    
    public void SetCurvas(double[] C) {
        curvas = new double [C.length];
        System.arraycopy(C,0,curvas,0, C.length);
    }
    
    public double TotalCurvas() {
        double kmCurvas = 0.0;
        for (int i = 0; i < GetCurvas().length;i++) {
            kmCurvas += this.curvas[i];
        }
        return (kmCurvas);
    }
    
    public double TotalRectas() {
        double kmRectas = 0.0;
        for (int i = 0; i< GetRectas().length; i++) {
            kmRectas += this.rectas[i];
        }
        return (kmRectas);
    }
}
