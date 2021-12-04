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


import java.io.*;
import java.util.*;


public class Clasificacion {
    private ArrayList <Usuario> ListaUsuarios = new ArrayList <> ();
    
    public Clasificacion(AlmacenLogin a){
        ListaUsuarios =  (ArrayList<Usuario>) a.getListaUsuarios().clone();
    }
    
    
    public void volcar_a_txt(String nombreFichero) throws IOException{
         PrintWriter ficheroSalidaText = new PrintWriter(new BufferedWriter(new FileWriter(nombreFichero)));
         for (Usuario u: ListaUsuarios){
             ficheroSalidaText.print(u);
         }
         ficheroSalidaText.close();
    }
       
       
    public String porVictorias() {
        Collections.sort(ListaUsuarios,new CompararPorVictorias());
        String s = "";
        for(Usuario u: ListaUsuarios){
            s += u.toString();
        }
        return s;
            
    }
     public String porPorcentaje() {
        Collections.sort(ListaUsuarios,new CompararPorPorcentaje());
        String s = "";
        for(Usuario u: ListaUsuarios){
            s += u.toString();
        }
        return s;
    }
    
    private class CompararPorPorcentaje implements Comparator{

        @Override
        public int compare(Object o1, Object o2) {
           Usuario u1 = (Usuario) o1;
           Usuario u2 = (Usuario) o2;
           if (u1.GetPVictorias() == u2.GetPVictorias()) return 0;
           if (u1.GetPVictorias() < u2.GetPVictorias()) return 1;
           return -1;
        }
    }     
    private class CompararPorVictorias implements Comparator{

         @Override
        public int compare(Object o1, Object o2) {
           Usuario u1 = (Usuario) o1;
           Usuario u2 = (Usuario) o2;
           if (u1.GetPGanadas() == u2.GetPGanadas()) return 0;
           if (u1.GetPGanadas() < u2.GetPGanadas()) return 1;
           return -1;
        }
    }
    
}