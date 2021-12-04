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


public class AlmacenLogin implements Serializable {
   
    
    private ArrayList <Usuario> usuarios = new ArrayList <Usuario> ();

    public AlmacenLogin(){};
    public AlmacenLogin(ArrayList a){
        usuarios = a;
    }
    
    public ArrayList <Usuario> getListaUsuarios(){
        return(usuarios);
    }
    public boolean identificar(Usuario U){
        return(usuarios.contains(U));
    }
    
    public boolean registrar(Usuario U){
        if (usuarios.contains(U)){
            return false;
        } else{
        usuarios.add(U);
        return true;
        }
    }
    
    public ArrayList <Usuario> GetUsuarios(){
        return usuarios;
    }
    
    public Usuario devolverUsuario(Usuario U){
        Iterator i = GetUsuarios().iterator();
        while (i.hasNext() && ! this.equals(U)){
            Usuario u2 = (Usuario) i.next();
            if (u2.equals(U)){return u2;}
        }
        return null;
    }
    
    @Override
    public String toString(){
        String s = "";
        for(Usuario u : usuarios){
             s += u.toString();
        }
        return s;
    }
        
}
