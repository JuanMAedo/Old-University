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
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.*;

public class Usuario implements Serializable {
    private String usuario;
    private String clave;
    private boolean administrador;
    private int partidas_ganadas, partidas_perdidas, puntos_anotados, puntos_encajados;
    private double porcentaje_victorias;
    private ArrayList <Partida> Partidas = new ArrayList <> ();
    
    /* CONSTRUCTORES */
    
    public Usuario(String usuario, String clave, boolean admin){
        this.usuario = usuario;
        this.clave = clave;
        this.administrador = admin;
    }
    
     public Usuario(String usuario, String clave){
        this.usuario = usuario;
        this.clave = clave;
        this.administrador = false;
    }
    /* MÉTODOS GET Y SET */
    
    public String GetUsuario(){
        return(usuario);
    }
    public String GetClave(){
        return(clave);
    }
    public boolean GetAdministrador(){
        return(administrador);
    }
    public void SetPartida(Partida a){Partidas.add(a);}        
    public int GetPGanadas(){ return(partidas_ganadas);}
    public int GetPPerdidas(){ return(partidas_perdidas);}
    public int GetPAnotados(){ return(puntos_anotados);}
    public int GetPEncajados(){ return(puntos_encajados);}
    public double GetPVictorias(){ return(porcentaje_victorias);}
    public void SetPGanadas(int num){partidas_ganadas = num;}
    public void SetPPerdidas(int num){partidas_perdidas = num;}
    public void SetPAnotados(int num){puntos_anotados = num;}
    public void SetPEncajados(int num){puntos_encajados = num;}
    public void SetPVictorias(double num){porcentaje_victorias = num;}
    
    public ArrayList <Partida> GetPartidas(){
        return(Partidas);
    }
    /* MÉTODOS PROPIOS DE LA CLASE */
    @Override
    public boolean equals(Object O){
        if(this == O) return true;
        if(this == null) return false;
        if(getClass() != O.getClass()) return false;
        Usuario A1 = (Usuario) O;
        if ( GetClave().equals(A1.GetClave())){
            return (GetUsuario().equals(A1.GetUsuario()));
        }else{
            return false;
        }
    } 
    
    @Override
    public String toString(){
        NumberFormat nf = new DecimalFormat("###");
        return(usuario + " - Part. Ganadas: " + GetPGanadas() + " - Part. Perdidas: " + GetPPerdidas() + "\n" +
                "- P. anotados: " + GetPAnotados() + " - P. Encajados: " + GetPEncajados() + " - % Victorias: " + nf.format(GetPVictorias()) + " %" + "\n");
    }
    public double calcularPorcentaje(){
        double a;
        a = GetPGanadas() + GetPPerdidas();
        double aux = GetPGanadas() / a;
        a = 100 * aux;
        return a;
    }
}
