/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package parser;

import java.util.ArrayList;
import java.util.Collections;
import parser.DiccionarioBriBri;

/**
 *
 * @author Wal
 */
public class Palabra {
    
    ArrayList<String> ListaPalabras;
    DiccionarioBriBri Diccionario;
    
    public Palabra(){
        ListaPalabras = new ArrayList();
        Diccionario = new DiccionarioBriBri();
    }
    
    public ArrayList<String> getPalabras(){
        return ListaPalabras;
    }
    
    public void printPalabras(){
        for (int i = 0; i < ListaPalabras.size(); i++) {
            System.out.println(ListaPalabras.get(i));
        }
    }
    
    public void traducir(){
        //Collections.reverse(this.ListaPalabras);
        String traducir = "";
        for (int i = 0; i < this.ListaPalabras.size(); i++) {
            String PalabraActual = this.ListaPalabras.get(i);
            if (Diccionario.PalabrasEspanol.indexOf(PalabraActual) > -1) {
                traducir += " " + Diccionario.BriBri[Diccionario.PalabrasEspanol.indexOf(PalabraActual)];
                System.out.println(traducir);
            } else {
                System.out.println("La palabra no se encuentra contenida en el diccionario");
            }
        }
    }
        
}
