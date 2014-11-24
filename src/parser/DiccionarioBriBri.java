/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package parser;

import java.util.List;

/**
 *
 * @author Wal
 */
public class DiccionarioBriBri {
    
    // coleccion de palabras soportadas por el programa
    public String[] Espanol = {"la", "camisa", "pantalon"};
    List PalabrasEspanol = java.util.Arrays.asList(Espanol);
 
    // equivalente en bribri
    public String[] BriBri = {"laBriBri", "CamisaBriBri", "PantalonBriBri"};
    List PalabrasBriBri = java.util.Arrays.asList(BriBri);
}
