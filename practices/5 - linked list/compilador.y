%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include "tabla.h"
#define YYSTYPE char *


int yylex();
int yyerror(const char *s);
%}



%start programa

%token ENTERO CADENA
%token IDENTIFICADOR NUMERO
%token ABRIR_BLOQUE CERRAR_BLOQUE
%token PRINCIPAL
%token LEER IMPRIMIR MIENTRAS
%token ASIGNACION
%token OR

%left '<' OR
%right ASIGNACION
%%

programa : PRINCIPAL '(' ')' ABRIR_BLOQUE
           declaraciones                                               { printf("\nDeclaraciones bien estructuradas\n"); }
           instrucciones
           CERRAR_BLOQUE                                          { printf("\nPrograma bien estructurado\n"); }
         ;
         
declaraciones : /*cadena vacia*/
	    | declaraciones declaracion          
	    ;         
         
declaracion : 
			ENTERO ids_declaracion 
            ;
            
ids_declaracion : IDENTIFICADOR ';'                                 { insertar($1[0]); }
		   | IDENTIFICADOR ASIGNACION expresion ';'        { insertar($1[0]); }
		   | IDENTIFICADOR ASIGNACION expresion ',' ids_declaracion    { insertar($1[0]); }
		   | IDENTIFICADOR ',' ids_declaracion                      { insertar($1[0]); }
		   ;

instrucciones : /*cadena vacia*/
	    | instrucciones instruccion ';'
	    ;
	    
instruccion : LEER '(' IDENTIFICADOR ')'
			| IDENTIFICADOR ASIGNACION expresion
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




int main(int argc, char **argv){
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



























