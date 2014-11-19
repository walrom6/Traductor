/* Archivo: Funciones.java
Contiene las diferentes funciones que se utilizarán en la lógica del proyecto */

package parser;

import java.io.FileInputStream;

public class Funciones {
    
    public void Sintactico(FileInputStream archivo) throws Exception 
    {
        //Scanner lexico = new Scanner(archivo);
        //ArrayList<Token> tokens = new ArrayList();
        //Symbol nuevoSimbolo = lexico.next_token();
        try{
            parser p = new parser (new Scanner(archivo));
            p.parse();
            //p.scan();
        }
        catch(Exception e)
        {            
            e.printStackTrace();
            System.out.println("Error del parser:" + e.getMessage());
        }
    }
    
}
