%{
  /* Equipo: 
    - Ana Karina Vergara Guzman (2153010383)
    - Yessicaa Fabiola Santiago Valdes (2173011484)
  */
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

#include "tabla.h"

struct Simbolo *primer_nodo = NULL; 

int yylex();
int yyerror(const char *s);

%}

%union{
	int intval; /* entero */
	char *cadena; /* entero */
}

%start programa

%token ENTERO CADENA FLOTANTE DOBLE 
%token TIPO_CADENA
%token <cadena> IDENTIFICADOR 
%token NUMERO NUMERO_DECIMAL
%token ABRIR_BLOQUE CERRAR_BLOQUE
%token PRINCIPAL
%token LEER IMPRIMIR MIENTRAS PARA SI OTRO

%left MENOR_QUE MAYOR_QUE MENOR_IGUAL_QUE MAYOR_IGUAL_QUE 
%left IGUAL_QUE DISTINTO
%left MAS MENOS
%left POR DIV MOD
%left OR AND

%right ASIGNACION 
%right NEGACION

%%

programa : PRINCIPAL '(' ')' ABRIR_BLOQUE
           declaraciones
           instrucciones
           CERRAR_BLOQUE      { printf("\n\n Programa bien estructurado\n\n"); }
         ;
         
declaraciones : /*cadena vacia*/
	            | declaraciones declaracion ';'
	            ;         
     
declaracion : tipoDato IDENTIFICADOR                                        {primer_nodo = insertar(primer_nodo, $2);}
            | tipoDato IDENTIFICADOR ASIGNACION expresionAsignacion         {primer_nodo = insertar(primer_nodo, $2);}  
            | declaracion ',' IDENTIFICADOR                                 {primer_nodo = insertar(primer_nodo, $3);}
            | declaracion ',' IDENTIFICADOR ASIGNACION expresionAsignacion  {primer_nodo = insertar(primer_nodo, $3);}
            ;

expresionAsignacion : NUMERO
           | NUMERO_DECIMAL
           | CADENA
           | IDENTIFICADOR
           ;

tipoDato : ENTERO
         | FLOTANTE
         | DOBLE
         | TIPO_CADENA
         ;  

instrucciones : /*cadena vacia*/
              | instrucciones instruccion ';'
              ;
	    
instruccion : LEER '(' IDENTIFICADOR ')'						{if(!esta_inicializada(primer_nodo, $3)) { printf("La variable no esta inicializada");}}
            | IDENTIFICADOR ASIGNACION expresionAsignacion		{if(!ya_esta(primer_nodo, $1)) { printf("La variable no esta inicializada");}}
            | IMPRIMIR '(' CADENA ')'							
            | MIENTRAS '(' expresion ')' ABRIR_BLOQUE
                 instrucciones
              CERRAR_BLOQUE
            | PARA '(' expresion ';' expresion ';' expresion ')' ABRIR_BLOQUE
                 instrucciones
              CERRAR_BLOQUE
            |  PARA '(' IDENTIFICADOR ASIGNACION expresionAsignacion ';' expresion ';' expresion ')' ABRIR_BLOQUE
                 instrucciones
              CERRAR_BLOQUE
            |  PARA '(' declaracion ';' expresion ';' expresion ')' ABRIR_BLOQUE
                 instrucciones
              CERRAR_BLOQUE
             
            | SI '(' expresion ')' ABRIR_BLOQUE
                instrucciones
              CERRAR_BLOQUE
            | SI '(' expresion ')' ABRIR_BLOQUE
                instrucciones
              CERRAR_BLOQUE OTRO ABRIR_BLOQUE
                instrucciones
              CERRAR_BLOQUE
            ;            

expresion : expresionAritmetica
          | expresionRelacional
          | expresionLogica
          | expresionAsignacion
      	  ;

expresionAritmetica : expresionAsignacion
                    | expresionAritmetica MAS expresionAritmetica      
 	                  | expresionAritmetica MENOS expresionAritmetica    
	                  | expresionAritmetica POR expresionAritmetica      
	                  | expresionAritmetica DIV expresionAritmetica                                          
	                  | expresionAritmetica MOD expresionAritmetica                   
      	            ;

expresionRelacional : expresionAritmetica MENOR_QUE expresionAritmetica
                    | expresionAritmetica MAYOR_QUE expresionAritmetica
                    | expresionAritmetica MENOR_IGUAL_QUE expresionAritmetica
                    | expresionAritmetica MAYOR_IGUAL_QUE expresionAritmetica
                    | expresionAritmetica IGUAL_QUE expresionAritmetica
                    | expresionAritmetica DISTINTO expresionAritmetica
                    ;

subExpresionLogica : expresionRelacional
                   | expresionAsignacion
                   ;

expresionLogica : subExpresionLogica AND subExpresionLogica
                | subExpresionLogica OR subExpresionLogica
                | subExpresionLogica DISTINTO subExpresionLogica
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

int yyerror(const char *s) {
    fprintf(stderr, "Error | linea: %d\n%s\n",yylineno, s);
}

