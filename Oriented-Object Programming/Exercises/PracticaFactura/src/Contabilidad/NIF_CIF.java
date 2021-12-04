/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad;

/**
 *
 * @author juanm
 */
public class NIF_CIF {
    private int numero;
    private char letra;
    final char[] letras = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','P','R','S','T','Q','V','X','Y','Z'};
    
    public NIF_CIF (int num, char letra ){  
        SetLetra(Character.toUpperCase(letra));
        SetNumero(num);
       
    }
    
    public NIF_CIF (int num) {
        SetNumero(num);
        char let = letras[num%23];
        SetLetra(let);
    }
    
    public int GetNumero(){
        return(numero);
    }
    
    public char GetLetra(){
        return(letra);
    }
    
    public void SetNumero(int n){
        numero = n;
    }
    
    public void SetLetra(char let){
        if (let == letras[let%23]) {
            letra = let;
        }else{
            letra =letras[let%23];
        }
    }
    
    @Override
    public  String toString(){
        return(numero + "-" + letra);
    }

    public NIF_CIF copia() {
        return new NIF_CIF(numero,letra);
    }
}    