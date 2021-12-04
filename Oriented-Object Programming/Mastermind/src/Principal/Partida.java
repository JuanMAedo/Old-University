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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;


public class Partida implements Serializable{
    protected LocalDateTime Fecha;
    private Usuario usuario1,usuario2;
    private Ronda [] Total_Rondas;
    
    /* CONSTRUCTORES */
    
    public Partida( Usuario U1, Usuario U2,int rondas ){
        Fecha = LocalDateTime.now();
        Total_Rondas = new Ronda [rondas];
        usuario1 = U1;
        usuario2 = U2;
    }
   

    /* MÉTODOS GET Y SET */
    public String getFecha(){
        return Fecha.format(DateTimeFormatter.ofPattern("dd/MM/YYYY ', a las' HH:mm:ss ' horas'", new Locale("es","AR")));
    }
    
    public void setRondaInd(int num, Ronda a){
        Total_Rondas[num] = a;
    }
    public Ronda[] getRondas(){
        Ronda [] dev = new Ronda [Total_Rondas.length];
       System.arraycopy(Total_Rondas, 0, dev, 0, Total_Rondas.length);
       return dev;
    } 
    public int getPuntosU1(){
        int puntos  = 0;
        for(int i = 0;Total_Rondas.length > i; i++){
            if (i % 2 != 0) {
                puntos += Total_Rondas[i].GetPuntos();
            }
        }
        return puntos ;
    }
    public int getPuntosU2(){
        int puntos  = 0;
        for(int i = 0;Total_Rondas.length > i; i++){
            if (i % 2 == 0) {
                puntos += Total_Rondas[i].GetPuntos();
            }
        }    
        return puntos;
    }
    public Usuario esGanador(){
        int a = getPuntosU1();
        int b = getPuntosU2();
        if ( a> b){return usuario1;}
        else{return usuario2;}
    }
    public Usuario US1(){return(usuario1);}
    public Usuario US2(){return(usuario2);}
    /* MÉTODOS PROPIOS DE LA CLASE */    
    
    public void darResultado(){
        usuario1.SetPAnotados(usuario1.GetPAnotados() + getPuntosU1());
        usuario1.SetPEncajados(usuario1.GetPEncajados() + getPuntosU2());
        usuario2.SetPAnotados(usuario2.GetPAnotados() + getPuntosU2());
        usuario2.SetPEncajados(usuario2.GetPEncajados() + getPuntosU1());
        if (esGanador() == usuario1){
            usuario1.SetPGanadas(usuario1.GetPGanadas() + 1);
            usuario2.SetPPerdidas(usuario2.GetPPerdidas() + 1);
                
        }else{
            usuario2.SetPGanadas(usuario2.GetPGanadas() + 1);
            usuario1.SetPPerdidas(usuario1.GetPPerdidas() + 1);
            
        }
        
        double PVic1 = usuario1.calcularPorcentaje();
        double PVic2 = usuario2.calcularPorcentaje();
        usuario1.SetPVictorias(PVic1);
        usuario2.SetPVictorias(PVic2);
        usuario1.SetPartida(this);
        usuario2.SetPartida(this);
    }
    
    @Override
    public String toString(){
        return("Fecha: " + getFecha() + ", " + usuario1.GetUsuario() + " vs " + usuario2.GetUsuario());
    }
}
