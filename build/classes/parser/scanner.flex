/* Archivo: Scanner.flex
Se definen los simbolos válidos para el compilador con ayuda de la libreria JFlex */


/* LIBRERIAS Y PAQUETES */

package parser;
import java_cup.runtime.Symbol;
import java.util.LinkedList;

// VARIABLES, CONSTANTES

%%

%init{ //Se inicializan variables
    int contador=0;
%init}

%eofval{
	return new Symbol(sym.EOF,new String("Fin del archivo"));
%eofval}

%{
    int contador = 0;
%}

%public
%class Scanner
%cup
%standalone
%unicode
%line  //Activa el contador de lineas
%column //Activa el contador de columnas
%char
%ignorecase
%full


/* EXPRESIONES REGULARES */

blanco = [ \n\t\r]
error_identificador = ([0-9]+[a-zA-Z])+[a-zA-Z]+[0-9]* 
malos = "&"[a-zA-Z]*|"@"[a-zA-Z]*|"!"[a-zA-Z]*|"¡"[a-zA-Z]*
letra = [A-Za-z] 
digito = [0-9] 
alfanumerico = {letra}|{digito} 
caracter = \'([^'])?\'   
entero = (-*[0-9]+)
real = (-?[0-9]+)(.[0])[eE][-+]?[0-9]+
exponencial = (-?[0-9]+)?(\.[0-9]+)[eE][-+]?[0-9]+
flotante_caso1 = [0][.][1-9]
flotante_caso2 = (-?[0-9]+)(\.[0-9]+)
flotante_caso3 = (-?[0-9]+)(.[0]) 
identificador_caso1 = [$]([_]|[a-zA-Z])[a-zA-Z_0-9]*
identificador_caso2 = [a-zA-Z][a-zA-Z_0-9]*
negacion = "no"|"No"
nombre_propio = [A-ZÑ]+[a-zñ]*

%%

/*******ACCIONES*******/  

{negacion} {contador++; return new Symbol(sym.Negacion,yyline, yycolumn, yytext());}

/************************ espacios en blanco y otros *************************/

{blanco} {/*Ignore*/}

/****************************** literales ************************************/

{real} {contador++; return new Symbol(sym.Real,yyline, yycolumn, yytext());}
{exponencial} {contador++; return new Symbol(sym.Exponencial,yyline, yycolumn, yytext());}
{flotante_caso1} {contador++; return new Symbol(sym.Flotante,yyline, yycolumn, yytext());}
{flotante_caso2} {contador++; return new Symbol(sym.Flotante,yyline, yycolumn, yytext());}
{flotante_caso3} {contador++; return new Symbol(sym.Flotante,yyline, yycolumn, yytext());}
{entero} {contador++; return new Symbol(sym.Entero,yyline, yycolumn, yytext());}



/******************************* pronombres **********************************/

"yo" {contador++; return new Symbol(sym.Pronombre,yyline, yycolumn, yytext());}
"tu" {contador++; return new Symbol(sym.Pronombre,yyline, yycolumn, yytext());}
"usted" {contador++; return new Symbol(sym.Pronombre,yyline, yycolumn, yytext());}
"él" {contador++; return new Symbol(sym.Pronombre,yyline, yycolumn, yytext());}
"ella" {contador++; return new Symbol(sym.Pronombre,yyline, yycolumn, yytext());}
"nosotros" {contador++; return new Symbol(sym.Pronombre,yyline, yycolumn, yytext());}
"ustedes" {contador++; return new Symbol(sym.Pronombre,yyline, yycolumn, yytext());}
"ellos" {contador++; return new Symbol(sym.Pronombre,yyline, yycolumn, yytext());}
"ellas" {contador++; return new Symbol(sym.Pronombre,yyline, yycolumn, yytext());}

/******************************* adverbios ***********************************/

"como" {contador++; return new Symbol(sym.Adverbio,yyline, yycolumn, yytext());}
"muy" {contador++; return new Symbol(sym.Adverbio,yyline, yycolumn, yytext());}
"bien" {contador++; return new Symbol(sym.Adverbio,yyline, yycolumn, yytext());}
"mal" {contador++; return new Symbol(sym.Adverbio,yyline, yycolumn, yytext());}
"que" {contador++; return new Symbol(sym.Adverbio,yyline, yycolumn, yytext());}
"donde" {contador++; return new Symbol(sym.Adverbio,yyline, yycolumn, yytext());}
"luego" {contador++; return new Symbol(sym.Adverbio,yyline, yycolumn, yytext());}
"hasta" {contador++; return new Symbol(sym.Adverbio,yyline, yycolumn, yytext());}
"cuanto" {contador++; return new Symbol(sym.Adverbio,yyline, yycolumn, yytext());}
"cuantos" {contador++; return new Symbol(sym.Adverbio,yyline, yycolumn, yytext());}

/********************************* verbos ************************************/

"hacer" {contador++; return new Symbol(sym.Verbo,yyline, yycolumn, yytext());}
"tener" {contador++; return new Symbol(sym.Verbo,yyline, yycolumn, yytext());}
"tomar" {contador++; return new Symbol(sym.Verbo,yyline, yycolumn, yytext());}
"coser" {contador++; return new Symbol(sym.Verbo,yyline, yycolumn, yytext());}
"doblar" {contador++; return new Symbol(sym.Verbo,yyline, yycolumn, yytext());}
"poner" {contador++; return new Symbol(sym.Verbo,yyline, yycolumn, yytext());}
"lavar" {contador++; return new Symbol(sym.Verbo,yyline, yycolumn, yytext());}
"limpiar" {contador++; return new Symbol(sym.Verbo,yyline, yycolumn, yytext());}
"andar" {contador++; return new Symbol(sym.Verbo,yyline, yycolumn, yytext());}
"guardar" {contador++; return new Symbol(sym.Verbo,yyline, yycolumn, yytext());}
"sacar" {contador++; return new Symbol(sym.Verbo,yyline, yycolumn, yytext());}
"colgar" {contador++; return new Symbol(sym.Verbo,yyline, yycolumn, yytext());}
"abotonar" {contador++; return new Symbol(sym.Verbo,yyline, yycolumn, yytext());}

/**************************** verbos conjugados ******************************/

"voy" {contador++; return new Symbol(sym.Verbo,yyline, yycolumn, yytext());}
"estoy" {contador++; return new Symbol(sym.Verbo,yyline, yycolumn, yytext());}
"está" {contador++; return new Symbol(sym.Verbo,yyline, yycolumn, yytext());}
"abotono" {contador++; return new Symbol(sym.Verbo,yyline, yycolumn, yytext());}
"tengo" {contador++; return new Symbol(sym.Verbo,yyline, yycolumn, yytext());}

/******************************* sustantivos *********************************/

"casa" {contador++; return new Symbol(sym.Sustantivo,yyline, yycolumn, yytext());}
"papa" {contador++; return new Symbol(sym.Sustantivo,yyline, yycolumn, yytext());}
"mama" {contador++; return new Symbol(sym.Sustantivo,yyline, yycolumn, yytext());}
"padre" {contador++; return new Symbol(sym.Sustantivo,yyline, yycolumn, yytext());}
"madre" {contador++; return new Symbol(sym.Sustantivo,yyline, yycolumn, yytext());}
"hermano" {contador++; return new Symbol(sym.Sustantivo,yyline, yycolumn, yytext());}
"hermana" {contador++; return new Symbol(sym.Sustantivo,yyline, yycolumn, yytext());}
"hijo" {contador++; return new Symbol(sym.Sustantivo,yyline, yycolumn, yytext());}
"hija" {contador++; return new Symbol(sym.Sustantivo,yyline, yycolumn, yytext());}
"armario" {contador++; return new Symbol(sym.Sustantivo,yyline, yycolumn, yytext());}
"caja" {contador++; return new Symbol(sym.Sustantivo,yyline, yycolumn, yytext());}
"cesto" {contador++; return new Symbol(sym.Sustantivo,yyline, yycolumn, yytext());}
"lavadora" {contador++; return new Symbol(sym.Sustantivo,yyline, yycolumn, yytext());}
"pila" {contador++; return new Symbol(sym.Sustantivo,yyline, yycolumn, yytext());}
"gancho" {contador++; return new Symbol(sym.Sustantivo,yyline, yycolumn, yytext());}

/******************************** adjetivos **********************************/

"mi" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"mis" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"tu" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"tus" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"su" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"sus" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"nuestro" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"nuestros" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"nuestra" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"nuestras" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"mio" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"mia" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"mios" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"mias" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"tuyo" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"tuyos" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"tuya" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"tuyas" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"suyo" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"suyos" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"suya" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"suyas" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"aquel" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"aquellos" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"aquella" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"aquellas" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"esto" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"estos" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"esta" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"estas" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"bueno" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"malo" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"uno" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"dos" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"tres" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"cuatro" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"cinco" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"seis" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"siete" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"ocho" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"nueve" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"diez" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"transparente" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"oscuro" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"oscura" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"claro" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"clara" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"manchado" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}
"manchada" {contador++; return new Symbol(sym.Adjetivo,yyline, yycolumn, yytext());}

/******************************* preposicion *********************************/

"a" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"ante" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"bajo" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"cabe" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"con" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"contra" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"de" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"desde" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"durante" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"en" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"entre" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"hacia" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"hasta" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"mediante" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"para" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"por" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"segun" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"sin" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"sobre" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}
"para" {contador++; return new Symbol(sym.Preposicion,yyline, yycolumn, yytext());}

/******************************** articulo ***********************************/

"un" {contador++; return new Symbol(sym.Articulo,yyline, yycolumn, yytext());}
"una" {contador++; return new Symbol(sym.Articulo,yyline, yycolumn, yytext());}
"unos" {contador++; return new Symbol(sym.Articulo,yyline, yycolumn, yytext());}
"unas" {contador++; return new Symbol(sym.Articulo,yyline, yycolumn, yytext());}
"el" {contador++; return new Symbol(sym.Articulo,yyline, yycolumn, yytext());}
"la" {contador++; return new Symbol(sym.Articulo,yyline, yycolumn, yytext());}
"los" {contador++; return new Symbol(sym.Articulo,yyline, yycolumn, yytext());}
"las" {contador++; return new Symbol(sym.Articulo,yyline, yycolumn, yytext());}
"lo" {contador++; return new Symbol(sym.Articulo,yyline, yycolumn, yytext());}

/******************************** conjuncion *********************************/

"y" {contador++; return new Symbol(sym.Conjuncion,yyline, yycolumn, yytext());}
"o" {contador++; return new Symbol(sym.Conjuncion,yyline, yycolumn, yytext());}

/*************************** signos de puntuacion ****************************/

"." {contador++; return new Symbol(sym.Signo_Punto,yyline, yycolumn, yytext());}
"," {contador++; return new Symbol(sym.Signo_Coma,yyline, yycolumn, yytext());}
";" {contador++; return new Symbol(sym.Signo_PuntoComa,yyline, yycolumn, yytext());}
"¡" {contador++; return new Symbol(sym.Signo_AdmiracionAbre,yyline, yycolumn, yytext());}
"!" {contador++; return new Symbol(sym.Signo_AdmiracionCierra,yyline, yycolumn, yytext());}
"¿" {contador++; return new Symbol(sym.Signo_PreguntaAbre,yyline, yycolumn, yytext());}
"?" {contador++; return new Symbol(sym.Signo_PreguntaCierra,yyline, yycolumn, yytext());}
"-" {contador++; return new Symbol(sym.Signo_Guion,yyline, yycolumn, yytext());}

/*********************************** ropa ************************************/

"camisa" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"camisas" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"blusa" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"blusas" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"pantalon" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"pantalones" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"enagua" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"enaguas" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"media" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"medias" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"zapato" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"zapatos" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"abrigo" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"abrigos" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"boxer" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"boxers" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"calzon" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"calzones" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"brassier" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"brassieres" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"gorra" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"gorras" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"faja" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"fajas" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"sombrero" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"sombreros" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"manga" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"mangas" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"chaleco" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"chalecos" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"zapato" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"zapatos" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"bolsillo" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"bolsillos" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"bolso" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"billetera" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"botas" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"sandalias" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"cartera" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"billetera" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"delantal" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"estampado" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"guantes" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"talla" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"s" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"m" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}
"l" {contador++; return new Symbol(sym.Ropa, yyline, yycolumn, yytext());}

/***************************** nombres propios *******************************/

{nombre_propio} {contador++; return new Symbol(sym.Nombre_Propio, yyline, yycolumn, yytext());}

/****************************** identificador ********************************/

{identificador_caso1} {contador++; return new Symbol(sym.Identificador, yyline, yycolumn, yytext());}
{identificador_caso2} {contador++; return new Symbol(sym.Identificador, yyline, yycolumn, yytext());}

// **CUALQUIER OTRO**
. { System.out.println("Error Lexico en la Linea: "+yyline+", Columna: "+yycolumn+", -> Caracter Inválido: "+yytext()); }
