
package compiladorcorregir;
 import java_cup.runtime.Symbol;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java_cup.parser;

public class EJECUTAR_COMPILADOR {
  
   
    
    public  static void main(String[] args) {
           
BufferedReader ar =null;
        try {
            ar = new BufferedReader(new FileReader("src\\compiladorcorregir\\Entrada.txt"));
            //System.out.println(ar.readLine());
        } catch (FileNotFoundException ex) {
            Logger.getLogger(EJECUTAR_COMPILADOR.class.getName()).log(Level.SEVERE, null, ex);
        }
            
            
            AnalizadorLexico analex=new AnalizadorLexico(ar);
        
            AnalizadorSintactico sin=new AnalizadorSintactico(analex);
            
        try {
            sin.parse();
        } catch (Exception ex) {
            Logger.getLogger(EJECUTAR_COMPILADOR.class.getName()).log(Level.SEVERE, null, ex);
        }
            
            
            
        try {
            ar.close();
        } catch (IOException ex) {
            Logger.getLogger(EJECUTAR_COMPILADOR.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        
        
 
    }
}
    
    
    

