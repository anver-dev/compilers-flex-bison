%{
  /* Equipo: 
    - Ana Karina Vergara Guzman (2153010383)
    - Yessicaa Fabiola Santiago Valdes (2173011484)
  */
 #include "compilador_tabla_arreglos.tab.h"
 #include <stdio.h>
 #include <math.h>
 #include <stdlib.h>
%}

DIGITO [0-9]
DECIMAL [0-9]+"."[0-9]+
LETRA [a-zA-Z]

%%

"principal"                 { return PRINCIPAL; }
"mientras"                  { return MIENTRAS; }
"leer"                      { return LEER; }
"imprimir"                  { return IMPRIMIR; }
"para"                      { return PARA; }
"si"                        { return SI; }
"otro"                      { return OTRO; }
"{"                         { return ABRIR_BLOQUE; }
"}"                         { return CERRAR_BLOQUE; }
"entero"                    { return ENTERO; }
"flotante"                  { return FLOTANTE;}
"doble"                     { return DOBLE;}
"cadena"                    { return TIPO_CADENA;}
"<-"                        { return ASIGNACION;}
"+"                         { return MAS; }
"*"                         { return POR; }
"/"                         { return DIV; }
"-"                         { return MENOS; }
"%"                         { return MOD; }
"<"                         { return MENOR_QUE; }
">"                         { return MAYOR_QUE; }
"<="                        { return MENOR_IGUAL_QUE; }
">="                        { return MAYOR_IGUAL_QUE; }
"=="                        { return IGUAL_QUE; }
"!="                        { return DISTINTO; }
"!"                         { return NEGACION; }
"||"                        { return OR; }
"&&"                        { return AND; }
"\""[a-zA-Z0-9_,\- ]*"\""   { return CADENA; }
0|[1-9]{DIGITO}*            { return NUMERO; }
{DECIMAL}                   { return NUMERO_DECIMAL; }
{LETRA}[a-zA-Z0-9_]*        { yylval = yytext; return IDENTIFICADOR; }
[ \t\n\r]+                  { /*IGNORAR*/ }
.                           { return(yytext[0]); }

%%


