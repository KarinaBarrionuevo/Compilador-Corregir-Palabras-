
package compiladorcorregir;


public class token {
     private int columnas;
     private int filas;
     private String cadena;
     private String tipo;

    public token(int columnas, int filas, String cadena, String tipo) {
        this.columnas = columnas;
        this.filas = filas;
        this.cadena = cadena;
        this.tipo=tipo;
    }
    public token(int columnas, int filas, String cadena) {
        this.columnas = columnas;
        this.filas = filas;
        this.cadena = cadena;
        
    }

    public int getColumnas() {
        
        return columnas+1;
    }

    public int getFilas() {
        return filas+1;
    }

    public String getCadena() {
        return cadena;
    }

    public void setCadena(String cadena) {
        this.cadena = cadena;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    @Override
    public String toString() {
        return "token{" + "columnas=" + columnas + ", filas=" + filas + ", cadena=" + cadena + ", tipo=" + tipo + '}';
    }
     
     
     
     
     
     
     
     
     
     
    
    
}
