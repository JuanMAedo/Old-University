/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Fecha;

/**
 *
 * @author juanm
 */
public class Fecha_Emision {
    int dia;
    int mes;
    int año;
    
    public Fecha_Emision(int dia, int mes, int año){
        if ((dia < 1) || (dia > 31) || (mes < 1)|| (mes > 12) || (((mes == 4)||(mes == 6)||(mes == 9)||(mes == 11))&& dia > 30) || ((mes == 2) && (dia > 28) && (!esBisiesto(año)) || ((mes == 2) && (dia > 29) && (esBisiesto(año))))){
            System.err.println("Fecha Incorrecta, se genera por defecto al día 01/01/2000 ");
            SetDia(01);
            SetMes(01);
            SetAño(2000);
        } else {
            SetDia(dia);
            SetMes(mes);
            SetAño(año);
        }
    }    
    
    public int GetDia(){
        return(dia);
    }

    public int GetMes(){
        return(mes);
    }
    public int GetAño(){
        return(año);
    }
    
    public void SetDia(int dia) {
        if ((dia<=31) && (dia > 0)) {
            this.dia = dia;   
        }
    }  
    
    public void SetMes(int mes) {
        if ((mes <= 12) && (mes > 0)) {
            this.mes = mes;   
        }
    }
    
    public void SetAño(int año) {
        this.año = año;   
    }
    
    private boolean esBisiesto(int año) {
        return((año % 4 == 0) & (año % 100 != 0) && (año % 400 == 0));
    }
    public int longitud(int lon){
        if (lon/10 > 0) {
            return(2);
        }else{
            return(1);
        }
    }
    @Override
    public String toString(){
        if ((this.longitud(dia) == 1) && (this.longitud(mes) == 1)){
            return("0" + dia + "/" + "0" + mes + "/" + año);
        }else if ((this.longitud(dia) == 1) && (this.longitud(mes) == 2)){
            return("0" + dia + "/" + mes + "/" + año);
        }else if ((this.longitud(dia) == 2) && (this.longitud(mes) == 2)){
            return( dia + "/"  + mes + "/" + año);
        }else{
            return( dia + "/" + "0" + mes + "/" + año);
        }    
    }
}
