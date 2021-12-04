/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Residuos;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Calendar;
import java.util.Random;
import java.text.SimpleDateFormat;
/**
 *
 * @author juanm
 */
public class Lata extends Residuo{

    private String etiqueta;
    private static int num;
    private final double p = 0.10;
    
    public Lata (double precio) {
        super(precio);
        num++;
        etiqueta = generarFecha();
    }
    
    public String getEtiqueta(){
        return(etiqueta);
    }
    private String generarFecha() {
        Calendar fecha;
        String res = "";
    
        Random aleatorio;
        aleatorio = new Random();

        fecha = Calendar.getInstance();
        fecha.set (aleatorio.nextInt(10)+2020, aleatorio.nextInt(12)+1, aleatorio.nextInt(30)+1);
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        res = sdf.format(fecha.getTime());
        return(res);
    }
    
    @Override
    public String toString(){
        NumberFormat nf = new DecimalFormat("#.##");
        return("Ha reciclado 1 lata con peso: " + nf.format(getPeso()));
    }
    
    public void  imprimirEtiqueta() {
        System.out.println( getEtiqueta());
    }    
}
