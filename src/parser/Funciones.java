/* Archivo: Funciones.java
Contiene las diferentes funciones que se utilizarán en la lógica del proyecto */

package parser;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java_cup.runtime.Symbol;

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
    /*
    Función leerTokens: Se encarga de leer el contenido de un archivo token por token. 
    */
    public void leerTokens(FileInputStream archivo) throws IOException
    {

        Scanner lexico = new Scanner(archivo);
        ArrayList<Token> tokens = new ArrayList();
        Symbol nuevoSimbolo = lexico.next_token();

        while (nuevoSimbolo.right != 0) // Hasta cuando no sea el final de archivo
        {
            
            tokens.add((Token)nuevoSimbolo.value);
            nuevoSimbolo = lexico.next_token();
        }
        
        ArrayList<ArrayList<String>> lista = new ArrayList(new ArrayList());
        for(int x=0;x<tokens.size();x++)
        {
            Token simbActual = tokens.get(x);
            ArrayList<String> caracter = new ArrayList();
            ArrayList<String> nueva = new ArrayList();
            int bandera = 0;
            for(int y=0;y<lista.size();y++)
            {
                caracter = lista.get(y);
                if (caracter.get(0).equals(simbActual.texto))
                {
                    int cantidad = (Integer.parseInt(caracter.get(2))) + 1;
                    nueva.add(simbActual.texto);
                    nueva.add(darTipoOperador(simbActual.numSimbolo));
                    nueva.add(cantidad+"");
                    nueva.add(caracter.get(3)+"-"+simbActual.linea);
                    bandera=1;
                    lista.remove(y);
                }   
             }
            if (bandera == 1) lista.add(nueva);
            else 
            {
                nueva.add(simbActual.texto);nueva.add(darTipoOperador(simbActual.numSimbolo));nueva.add("1");nueva.add(simbActual.linea+"");
                lista.add(nueva);
            }     
        }
        
        String listas = "";
        ArrayList<String> ArrayTemporal = new ArrayList();
        for(int n = 0; n < lista.size() ; n++){
            ArrayTemporal = lista.get(n);
            listas = ConteoLineas(ArrayTemporal.get(3));
            ArrayTemporal.set(3, listas);
            lista.set(n, ArrayTemporal);
        }
       
        ImprimirTablaSimbolos(lista);
       
    }
    
    private String darTipoOperador(int _numero)
    {
        if ((0 < _numero) && (_numero < 6)) return ("Operador Aritmético");
        if ((5 < _numero) && (_numero < 9)) return ("Operador Lógico");
        if ((8 < _numero) && (_numero < 11)) return ("Operador Inc/Dec");
        if ((10 < _numero) && (_numero < 17)) return ("Operador Relación");
        if ((16 < _numero) && (_numero < 28)) return ("Operador Asignación");
	if ((27 < _numero) && (_numero < 34)) return ("Operador Bits");
	if ((33 < _numero) && (_numero < 36)) return ("Operador Sin Tipo");
	if ((35 < _numero) && (_numero < 46)) return ("Operador Separador");
	if (_numero == 50) return ("Numero Octal");
	if (_numero == 51) return ("Numero FlotanteExponente");
	if (_numero == 52) return ("Numero HexaDecimal");
	if (_numero == 53) return ("Numero Entero");
	if (_numero == 54) return ("Numero Flotante");
	if (_numero == 60) return ("Identificador");
	if (_numero == 61) return ("String");
	if (_numero == 62) return ("Char");
	if ((99 < _numero) && (_numero < 200)) return ("Reservada");
	else return ("Error");
    }
    
    private String ConteoLineas(String _lineas)
    {
        String lineas = _lineas;
        String[] listaLineasTemp = lineas.split("-");
        ArrayList <String> listaLineas = new ArrayList<String>(Arrays.asList(listaLineasTemp));
        String Temporal = listaLineas.get(0);
        String nuevoLineas = "";
        int contador = 0;
        while(listaLineas.isEmpty() == false){
            if (Temporal.equals(listaLineas.get(0))){
                contador = contador+1;
                listaLineas.remove(0);
            }
            
            else{
                if(contador > 1){nuevoLineas = nuevoLineas+Temporal+"("+contador+"), ";}
                else{nuevoLineas = nuevoLineas+Temporal+", ";}
                Temporal = listaLineas.get(0);
                contador = 0;
            }   
        }
        if(contador > 1){nuevoLineas = nuevoLineas+Temporal+"("+contador+")";}
        else{nuevoLineas = nuevoLineas+Temporal;}
        return nuevoLineas;
    }
    
    private void ImprimirTablaSimbolos(ArrayList<ArrayList<String>> _Lista)
    {
        System.out.println("");
        System.out.println("");
        System.out.println("        TOKENS  |  TIPO DE TOKENS  |  LINEAS");
        System.out.println("___________________________________________________________________________________________________________________________");
        ArrayList<String> ArrayTemporal = new ArrayList();
        for(int c = 0; c < _Lista.size(); c++){
            ArrayTemporal = _Lista.get(c);
            System.out.println("        "+ArrayTemporal.get(0)+"     |    "+ArrayTemporal.get(1)+"    |    "+ArrayTemporal.get(3));
            System.out.println("---------------------------------------------------------------------------------------------------------------------------");
            System.out.println("___________________________________________________________________________________________________________________________");
           
        }
        System.out.println("");
        System.out.println("");
    }
}
