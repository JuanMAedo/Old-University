package práctica1;

/**
 *
 * @author juanm
 */
public class Intervalo {

    /** Atributos del intervalo */
	private int inferior, superior;
	
	/** Inicializar sin argumentos */
	public Intervalo () {
		inferior = 0;
		superior = 1;
	}
	
	/** Inicializar con argumento de limite superior */
	public Intervalo ( int superior ) {
            inferior = 0;
            this.superior = superior;
	}
	
	/** Inicializar con dos argumentos */
	public Intervalo (int inferior, int superior) {
            if ( superior >= inferior) {
                    this.inferior = inferior;
                    this.superior = superior;
            }
            else {
                    this.inferior = 0;
                    this.superior = 1;
            }
	}
	
	/** Inicializar con los datos de otro intervalo
     * @param I */
	public Intervalo ( Intervalo I) {
            superior = I.GetSuperior();
            inferior = I.GetInferior();
	}
	/** Metodos Get y Set
     * @return  */ 
	
	public int GetSuperior () {
            return superior;
	}
	
	public int GetInferior () {
            return inferior;
	}
	
	public void SetSuperior (int superior) {
            if (superior > inferior){
                this.superior = superior;
            }
            else{
                System.out.println ("Error, no se puede guardar un intervalo inverso");
            }
        }
	
	public void SetInferior (int inferior) {
            if (inferior <= superior) {
                this.inferior = inferior;
            }    
            else{
                System.out.println ("Error, no se puede guardar un intervalo inverso");
            }
        }
    /** Método para visualizar por pantalla los valores del intervalo*/
        
        public void MostrarPantalla () {
            System.out.println("El intervalo va de: " + GetInferior() + " a " + GetSuperior());
        } 
        
        public int Longitud () {
           int longitud = GetSuperior() - GetInferior();
           return longitud;
        }
        
        public boolean Comparar (Intervalo I){
            if ((GetSuperior() == I.GetSuperior()) && (GetInferior() == I.GetInferior())) {
               return true;
            }
            else {
                return false;
            }    
        }
        
        public Intervalo Desplazar (int valor) {
            SetSuperior(GetSuperior() + valor);
            SetInferior(GetInferior() + valor);
            return new Intervalo(inferior, superior);
        }
        
        public boolean ComprobarValor ( int a) {
            return ((a <= this.superior) && ( a >= this.inferior));
        }
        
         public boolean ComprobarIntervalo ( Intervalo I ) {
            return ((this.superior >= I.GetSuperior()) && ( this.inferior <= I.GetInferior()));
        }
         
         public Intervalo Copia () {
             return new Intervalo (inferior, superior);
         }
         
         public Intervalo Interseccion (Intervalo I, Intervalo J) {
             int inf, sup;
             if (I.GetInferior() >= J.GetInferior()){
                  inf = I.GetInferior();
             }
             else{
                  inf = J.GetInferior();
             }
             if (I.GetSuperior() <= J.GetSuperior()) {
                 sup = I.GetSuperior();
             }
             else {
                 sup = J.GetSuperior();
             }
             if (inf < sup){
                 Intervalo resultado = new Intervalo (inf, sup);
                 return resultado;
             }
             else {
                 return null;
             }
         }
      public Intervalo Union (Intervalo I, Intervalo J) {
          int inf, sup;
          if ( (Interseccion( I, J )) != null) {
            if (I.GetInferior() <= J.GetInferior()) {
                inf = I.GetInferior();
            }
            else {
                inf = J.GetInferior();
            }
            if (I.GetSuperior() >= J.GetSuperior()) {
                sup = I.GetSuperior();
            }
            else {
                sup = J.GetSuperior();
            }
            Intervalo resultado = new Intervalo(inf, sup);
            return resultado;
          }
          else{
              return null;
          }
      }   
}
