/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Principal;

/**
 *
 * @author juanm
 */
import java.io.Serializable;
import java.util.*;



public class Ronda implements Serializable{
    
    private int [] aciertos,aciertosAux;
    private int [] colocados,colocadosAux;
    private Combinacion [] combinaciones,combinacionesAux ;
    private Combinacion adivinar;
    private int tope;
    private int puntos;

    public Ronda(int intentos,Combinacion adiv) {
        this.adivinar = adiv;
        combinacionesAux = new Combinacion [intentos];
        aciertosAux = new int [intentos];
        colocadosAux = new int[intentos];
        tope = 0;
        puntos = 10;
    }


    /* METODOS GET Y SET */
    public int GetPuntos(){return puntos;}
    public int GetIntentos(){return tope;}
    public int GetAciertos(int pos){return aciertos[pos-1];}
    public int GetColocados(int pos){return colocados[pos-1];}       
    public void SetAciertos(int num,int pos){aciertos[pos] = num;} 
    public void SetColocados(int num,int pos){colocados[pos] = num;}
    public void SetAdivinar(Combinacion C){adivinar = C;}
    public void SetPuntos(int num){puntos += num;}
    public int GetTope(){return tope;}
    
     /* MÉTODOS PROPIOS DE LA CLASE */
    
    public void añadirCombinacion(Combinacion C) {
        combinacionesAux[tope] = C;
    } 
    
    public String jugar(Combinacion C){
        añadirCombinacion(C);
        aciertosAux[tope] = adivinar.devolverAciertos(C);
        colocadosAux[tope] = adivinar.devolverColocados(C);
        String s = (C + " " + adivinar.devolverAciertos(C) + " acierto/s y " + adivinar.devolverColocados(C) + " colocado/s" + "\n");
        tope++;
        if (adivinar.esGanadora(C)){
            s += "¡ES GANADORA!";
            devolverRes();
        }else{puntos--;}
        return(s);
    }
    
    @Override
    public String toString(){
        String s = ""; 
        for (Combinacion C : combinaciones){
            s += C.posiciones();
            s += (C + " " + adivinar.devolverAciertos(C) + " acierto/s y " + adivinar.devolverColocados(C) + " colocado/s" + "\n");
            s +=("######################################" + "\n");
        }

        return(s);
    }
    
    public void devolverRes(){
       combinaciones = new Combinacion [tope];
       colocados = new int[tope];
       aciertos = new int[tope];
       System.arraycopy(combinacionesAux,0,combinaciones,0,tope);
       System.arraycopy(colocadosAux,0,colocados,0,tope);
       System.arraycopy(aciertosAux,0,aciertos,0,tope);
    }
}
