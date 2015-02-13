package compiladorcorregir;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java_cup.runtime.Symbol;
import jflex.Main;


public class EjecutarFlex  {

    
    public static void main(String[] args) {
        File archivo=new File("src\\compiladorcorregir\\ejercicio.flex");
        jflex.Main.generate(archivo);
////        
////           BufferedReader ar=null;
//           try {
//            ar=new BufferedReader(new FileReader("src/compiladorcorregir/Entrada.txt"));
//            AnalizadorLexico analex=new AnalizadorLexico(ar);
//            Symbol token=null;
//               do {                   
//                   token=analex.next_token();
//                   System.out.println(token.value);
//                   
//               } while (token!=null);
//            
//            
//            
//            ar.close();
//            } catch (Exception e) {
//                System.out.println("ERROR ES: "+ e.getMessage());
//            }
//                 
//    
//    
    }
    
}
