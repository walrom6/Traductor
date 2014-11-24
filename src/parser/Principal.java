/* Proyecto Parser
 * Compiladores
 * Hecho por:
 * Cristian Araya
 * Guillermo Arce
 * I Semestre 2014, ITCR  jolalal*/

package parser;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Scanner;
import parser.Palabra;

public class Principal {

    public static void main(String[] args) throws FileNotFoundException, IOException, Exception {
        
        boolean traduccionValida = true;
        Palabra ListaPalabras = new Palabra();
        
        Funciones principal = new Funciones();
        System.out.println("---------------Inicio Análisis---------------");
        System.out.println("");
        while(true)
        {
            System.out.print("Introduzca el nombre o ruta del archivo:  ");
            String ruta = "";

            Scanner scan = new Scanner (System.in); 
            //ruta = scan.nextLine ();
            ruta = "C:/Users/Wal/Documents/Documentos TEC/II Semestre 2014/Compiladores e Intérpretes/Proyecto/ParserE/prueba.txt";
            System.out.println("");
            System.out.println("");
            try
            {
                FileInputStream archivo = new FileInputStream (ruta);

                //principal.leerTokens(archivo);
                principal.Sintactico(archivo);
                
                break;
            }
            catch(IOException e){System.out.println("El archivo no existe");}
        }
        //File file = new File("C:/Users/Wal/Documents/Documentos TEC/II Semestre 2014/Compiladores e Intérpretes/Proyecto/ParserE/src/parser/scanner.flex");
        //jflex.Main.generate(file);

        System.out.println("");
        System.out.println("----------------Fin Análisis----------------");
    }
}
