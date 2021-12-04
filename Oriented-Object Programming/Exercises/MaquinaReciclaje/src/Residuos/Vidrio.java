/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Residuos;

import java.text.DecimalFormat;
import java.text.NumberFormat;

/**
 *
 * @author juanm
 */
public class Vidrio extends Residuo{
    
    private static int num; 
    private final double p = 0.30;
    
    public Vidrio(double p){
        super(p);
        num++;
    }
    
    @Override
    public String toString(){
        NumberFormat nf = new DecimalFormat("#.##");
        return("Ha reciclado 1 vidreo de peso " + nf.format(getPeso()));
    }
}
