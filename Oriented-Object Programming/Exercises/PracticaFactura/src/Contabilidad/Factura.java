/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad;
    import  Fecha.Fecha_Emision;
    import java.text.DecimalFormat;
    import java.text.NumberFormat;
/**
 *
 * @author juanm
 */
public class Factura {
    private int identificador;
    private NIF_CIF NIF_CIF;
    private Fecha_Emision fecha;
    private double importe;
    private double IVA;
    private double total;
    private boolean pagado;
    
    
    /* Métodos Constructores  */
    public Factura (int id, NIF_CIF cliente,Fecha_Emision fecha, double importe){
           SetIdentificador(id);
           SetCliente(cliente.copia());
           SetFecha(fecha);
           SetImporte(importe);
           SetIVA(15);
           SetTotal(this.Calculo());
    } 
    
    /* Métodos Get y Set de los Atributos de la clase Factura */
    public int GetIdentificador(){
        return(identificador);
    }
    
    public NIF_CIF GetCliente(){
        return(NIF_CIF);
    }
    
    public Fecha_Emision GetFecha(){
        return(fecha);
    }
    
    public double GetImporte(){
        return(importe);
    }
    
    public double GetIVA(){
        return(IVA);
    }
    
    public double GetTotal(){
        return(total);
    }
    
    public boolean GetPagado(){
        return(pagado);
    }
    private void SetIdentificador(int ident){
        this.identificador = ident;
    }
    private void SetCliente(NIF_CIF cliente){
        this.NIF_CIF = cliente;
    }
    private void SetFecha(Fecha_Emision fecha){
        this.fecha = fecha;
    }
    public void SetImporte(double importe){
        this.importe = importe;
    }
    public void SetTotal(double total){
        this.total = total;
    }
    public void SetPagado(boolean pagado){
        this.pagado = pagado;
    }
    public void SetIVA(double impuesto){
        this.IVA = impuesto;
    }
    
    @Override
    public String toString(){
        NumberFormat a = new DecimalFormat("###.##");
        String s = "Identificador: " + GetIdentificador()+ "\n"  + "Fecha: " + GetFecha() + "\n" + "Cliente: " + GetCliente() +"\n"  + "Importe(Antes del IVA): " + a.format(GetImporte()) + "€\n" + "IVA aplicado: " + GetIVA() +"%\n" + "Importe Total: " + a.format(GetTotal()) + "€\n" + "Estado de Factura(Pendiente de cobro/Pagada): " ;
        if (GetPagado()){
            s += "PAGADA";
        } else{
            s+= "Pendiente de Cobro";
        }
        return(s);
    }
    
    public void ImprimirFactura(){
         System.out.println(toString());
    }
    private double Calculo(){
        return((importe * IVA/100) + importe);
    }
}
