// Es el paquete del proyecto java en donde se generará la clase
package compiladorcorregir;

/* librería necesaria para importar la clase Symbol y 
 trabajar con los tokens que se especificarán más adelante*/
import java_cup.runtime.Symbol;

//Se importa la clase token que se encuentra dentro del paquete ejerciciocompilador
//para poder crear los tokens
import compiladorcorregir.token;



/*------------- Sección de opciones y declaraciones------------*/
%%
/* Acceso a la columna y fila actual */
%line
%column

/* Habilitar la compatibilidad con el interfaz CUP para el generador sintactico*/
%cup

/* Nombre de la clase generada para el analizador lexico */
%class AnalizadorLexico
%{
    /*  Generamos un nuevo objeto java_cup.runtime.Symbol  para guardar el tipo de token 
        encontrado */
    private Symbol symbol(int tipo) {
        return new Symbol(tipo, yyline, yycolumn);
    }
    /* Generamos un nuevo objeto java_cup.runtime.Symbol  para el tipo de token encontrado 
       junto con su valor */
    private Symbol symbol(int tipo, Object valor) {
        return new Symbol(tipo, yyline, yycolumn, valor);
    }
%}

/*-- MACRO DECLARACIONES --*/
/* identifica el  fin de línea y es asignado a una variable*/
LineTerminator = \r|\n|\r\n|\n\r\
/* Se crea una nueva variable que tiene el valor de LineTerminator
  e identifico los salto de linea, tabulaciones y espacios en blaco*/
WhiteSpace = {LineTerminator}|[ \f\t]

/* forma cadenas de letras mediante cerradura positiva*/
ALFABETO = [a-zA-Z]+

%%
//YYINITIAL es el estado inicial del analizador léxico al escanear una expresión.
<YYINITIAL> {
 
/* Declaración de la barra como carácter  reservado del lenguaje del compilador
 y retorna un objeto de tipo Symbol, el  cual se encuentra estructurado de un valor entero correspondiente 
 a la barra y a su vez se crear un objeto token con el número de columna, líneas y el valor. */
     "/"  {return new Symbol(sym.BARRA, new token(yycolumn, yyline, yytext() )); }

/* Declaración de la palabra corregir_palabra como operador reservado del lenguaje del compilador y 
retorna un objeto de tipo Symbol, el  cual se encuentra estructurado de un valor entero correspondiente 
 al corregir_palabra y a su vez se crear un objeto token con el número de columna, líneas y el valor. */
    "corregir_palabra"  {return new Symbol(sym.CORREGIR, new token(yycolumn, yyline, yytext() )); }

/* Declaración de la palabra imprimir como operador reservado del lenguaje del compilador y 
retorna un objeto de tipo Symbol, el  cual se encuentra estructurado de un valor entero correspondiente 
 al imprimir y a su vez se crear un objeto token con el número de columna, líneas y el valor. */
    "imprimir"   {return new Symbol(sym.IMPRIMIR, new token(yycolumn, yyline, yytext() )); }

/* Declaración del alfabeto como operador  del lenguaje del compilador y 
retorna un objeto de tipo Symbol, el  cual se encuentra estructurado de un valor entero correspondiente 
 al ALFABETO y a su vez se crear un objeto token con el número de columna, líneas y el valor. */

    {ALFABETO}      {return new Symbol(sym.ALFABETO, new token(yycolumn, yyline, yytext() )); }
    
    //No hace nada al encontrar el espacio
    {WhiteSpace}       {/* ignora salto */} 
 }  
/* Si el token contenido en la entrada no coincide con ninguna regla
    entonces se marca un token ilegal */
    . {System.err.println("caracter invalido" + yytext() + "["+ yyline + ":"+ yycolumn + "]");}

