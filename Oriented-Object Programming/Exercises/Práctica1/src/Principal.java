/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package práctica1;

/**
 *
 * @author juanm
 */
public class Principal {
    public static void main (String[] args) {
        Intervalo I = new Intervalo();
        Intervalo I2 = new Intervalo (16);
        Intervalo I3 = new Intervalo(-5,8);
        Intervalo I4 = new Intervalo (I3);
        Intervalo I5 = new Intervalo();
        I.MostrarPantalla();
        I2.MostrarPantalla();
        I3.MostrarPantalla();
        I4.MostrarPantalla();
        System.out.println("La longitud es " + I4.Longitud());
        if (I3.Comparar(I3)) {
            System.out.println("Hola mundo, los Intervalos son iguales");
        }
        I4.Desplazar(2);
        I4.MostrarPantalla();
        if(I2.ComprobarValor(6)) {
            System.out.println("Esta incluido el valor");
        } 
        if(I2.ComprobarIntervalo(I4)) {
            System.out.println("El intervalo [" +I4.GetInferior() + "," + I4.GetSuperior() + "] está incluido en el intervalo [" + I2.GetInferior() + "," + I2.GetSuperior()+ "]");
        }
        I4 = I4.Interseccion(I2,I3);
        I4.MostrarPantalla();
        
        I4 = I4.Union(I2, I3);
        I4.MostrarPantalla();
    
        I5 = I2.Copia();
        I5.MostrarPantalla();
    } 
    
}
