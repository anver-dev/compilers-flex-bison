%{
 #include "compilador.tab.h"
 #include <stdio.h>
 #include <math.h>
 #include <stdlib.h>
%}

DIGITO [0-9]
LETRA [a-zA-Z]

%%

"<-"                                          { return ASIGNACION; }
"||"                                            { return OR; }
"mientras"                               { return MIENTRAS; }
"leer"                                       { return LEER; }
"imprimir"                               { return IMPRIMIR; }
"{"                                            { return ABRIR_BLOQUE; }
"}"                                            { return CERRAR_BLOQUE; }
"entero"                                  { return ENTERO; }

"principal"                              { return PRINCIPAL; }
"\""[a-zA-Z0-9_,\- ]*"\""       { return CADENA; }
0|[1-9]{DIGITO}*                   { return NUMERO; }
{LETRA}[a-zA-Z0-9_]*           { yylval = yytext;  return IDENTIFICADOR; }
[ \t\n\r]+                               { /*IGNORAR*/ }
.                                              { return(yytext[0]); }

%%














































