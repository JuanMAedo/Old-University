/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;

/**
 *
 * @author juanm
 */
public class Rectangulo {
 
        /* Métodos de inicialización de la clase Rectángulo */
        private Punto ExtremoInf, ExtremoSup;
        
        public Rectangulo () {
            ExtremoInf =  new Punto(0,0);
            ExtremoSup =  new Punto(1,1);
        }
        
        public Rectangulo (int a, int b) {
            ExtremoInf = new Punto (0,0);
            ExtremoSup = new Punto (a,b);
        }
        
        public Rectangulo (Punto a, Punto b) {
            if (a.estaDebajo(b) && b.estaDerecha(a)){
            ExtremoInf = a.Copia();
            ExtremoSup = b.Copia();
            }
        }
        
        public Rectangulo (Rectangulo R) {
            ExtremoInf = R.GetExtInf();
            ExtremoSup = R.GetExtSup();
        }
        
         /* Métodos Get y Set del Rectángulo */
        public Punto GetExtInf ()  {
            return (ExtremoInf);
        }
        
        public Punto GetExtSup () {
            return (ExtremoSup);
        }
        
        public void SetExtInf (Punto P) {
            if((P.estaDebajo(GetExtSup())) && (GetExtSup().estaDerecha(P))){
            ExtremoInf = P.Copia();
            }
        }
        
        public void SetExtSup (Punto P) {
            if((GetExtInf().estaDebajo(P)) && (P.estaDerecha(GetExtInf()))){
            ExtremoSup = P.Copia();
            }
        }
        /* Métodos de operaciones de la clase Rectángulo*/
        
        @Override
        public String toString () {
            return ("El rectangulo esta construido con el extremo inferior derecho como: " + GetExtInf().toString() + ", y el superior izquierdo: " + GetExtSup().toString());
        }
        
        public int base () {
            int bas;
                bas = GetExtSup().GetX() - GetExtInf().GetX();
            return (bas);
        }
        
        public int altura () {
            int alt;
                alt = GetExtSup().GetY() - GetExtInf().GetY();
            return (alt);
        }
        
        public int area () {
            return (base() * altura()); 
        }
        
        public int perimetro () {
            return ( base() * 2 + altura() * 2);
        }
        
        public boolean esIgual (Rectangulo R) {
            return ((R.GetExtInf().esIgual(GetExtInf())) && (R.GetExtSup().esIgual(GetExtSup())));
        }
        
        public Rectangulo desplazarX (int valor) {
            ExtremoSup.SetX(GetExtSup().GetX() + valor);
            ExtremoInf.SetX((GetExtInf().GetX() + valor));
            return new Rectangulo (ExtremoInf, ExtremoSup);
        }
}

