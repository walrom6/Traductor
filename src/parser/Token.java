/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package parser;

/**
 *
 * @author crist_000
 */
public class Token {
    
    public int numToken;
    public int linea;
    public int columna;
    public String texto;
    public String tipo;
    public int numSimbolo;
    
    Token(int _numToken,int _linea,int _columna,String _texto,String _tipo)
    {
        numToken = _numToken;
        linea = _linea;
        columna = _columna;
        texto = _texto;
        tipo = _tipo;
    }
    
    Token(int _numToken,int _linea,int _columna,String _texto,int _numSimbolo)
    {
        numToken = _numToken;
        linea = _linea;
        columna = _columna;
        texto = _texto;
        numSimbolo = _numSimbolo;
    }
    
}
