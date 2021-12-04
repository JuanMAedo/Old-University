/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Residuos;
import java.util.Random;
import java.text.DecimalFormat;
import java.text.NumberFormat;
/**
 *
 * @author juanm
 */
public class Residuo {
    
    private double precio;
    private double peso;
    
    public Residuo(double p){
        precio = p;
        peso = generarPeso();
    }
    
    public double getPrecio(){
        return(precio);
    }
    
    public double getPeso(){
        return(peso);
    }
    
    private double generarPeso(){ 
        Random aleatorio;
        aleatorio= new Random();
        return(aleatorio.nextDouble());
    }      
}
