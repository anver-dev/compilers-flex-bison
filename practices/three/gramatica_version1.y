%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#define YYSTYPE double

int yylex();
int yyerror(const char *s);
%}

%start programa

%token ENTERO CADENA FLOTANTE DOBLE TIPO_CADENA

%token IDENTIFICADOR NUMERO NUMERO_DECIMAL
%token ABRIR_BLOQUE CERRAR_BLOQUE
%token PRINCIPAL
%token LEER IMPRIMIR MIENTRAS
%token OR

%%

programa : PRINCIPAL '(' ')' ABRIR_BLOQUE
           declaraciones
           instrucciones
           CERRAR_BLOQUE      { printf("\nPrograma bien estructurado\n"); }
         ;
         
declaraciones : /*cadena vacia*/
	            | declaraciones declaracion ';'
	            ;         
         
declaracion : /*cadena vacia*/
            | tipoDato IDENTIFICADOR
            | tipoDato IDENTIFICADOR '<''-' asignacion
            | declaracion ',' IDENTIFICADOR
            | declaracion ',' IDENTIFICADOR '<''-' asignacion 
            ;

asignacion : /*cadena vacia*/
           | NUMERO
           | NUMERO_DECIMAL
           | CADENA
           | IDENTIFICADOR
           ;

tipoDato : /*cadena vacia*/
         | ENTERO
         | FLOTANTE
         | DOBLE
         | TIPO_CADENA
         ; 
 

instrucciones : /*cadena vacia*/
              | instrucciones instruccion ';'
              ;
	    
instruccion : LEER '(' IDENTIFICADOR ')'
            | IMPRIMIR '(' CADENA ')'
            | MIENTRAS '(' expresion ')' ABRIR_BLOQUE
                 instrucciones
              CERRAR_BLOQUE
            ;            

expresion : expresion '<' expresion
          | expresion OR expresion
          | NUMERO
          | IDENTIFICADOR
      	  ;
	  
%%

#include "lex.yy.c"

int main(int argc, char **argv) {
  ++argv, --argc;
  
  if(argc > 0)
    yyin = fopen(argv[0], "r");
  else
    yyin = stdin;

  yyparse();
}

int yyerror(const char *s){
    fprintf(stderr, "Error | linea: %d\n%s\n",yylineno, s);
}


