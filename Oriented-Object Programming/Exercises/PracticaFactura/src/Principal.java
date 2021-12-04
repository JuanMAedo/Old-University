/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Contabilidad.*;
import Fecha.*;
import java.util.Scanner;
/**
 *
 * @author juanm
 */
public class Principal {
    public static void main(String[] args){
        Scanner a = new Scanner(System.in);
        System.out.print("Introduzca el día: ");
        int dia = a.nextInt();
        System.out.print("\nIntroduzca el mes: ");
        int mes = a.nextInt();
        System.out.print("\nIntroduzca el año: ");
        int año = a.nextInt();
        Fecha_Emision fecha1 = new Fecha_Emision(dia,mes,año);
        System.out.print("\nIntroduzca el numero de identificación de la factura: ");
        int ident = a.nextInt();
        System.out.print("\nIntroduzca el NIF del cliente(exclusivamente el numero): ");
        int nif1 = a.nextInt();
        NIF_CIF nif = new NIF_CIF(nif1);
        System.out.print("\nIntroduzca el importe de la operación que se va a registrar: ");
        double importe = a.nextDouble();
        System.out.print("\nIntroduzca 1, si la factura está pagada, o por el contrario escriba 2: ");
        int condicion = a.nextInt();
        Factura F1 = new Factura(ident,nif,fecha1,importe);
        if (condicion == 1){
            F1.SetPagado(true);
        }else{
            F1.SetPagado(false);   
        }
        F1.ImprimirFactura();
        
        
    
    }
}
