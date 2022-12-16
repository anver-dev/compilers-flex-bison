%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#define YYSTYPE char*

char tabla[80];
int ultimo = -1; 

int ya_esta(char simbolo); 
void insertar(char simbolo); 
int yylex();
int yyerror(const char *s);
%}

%start programa

%token ENTERO CADENA FLOTANTE DOBLE TIPO_CADENA
%token IDENTIFICADOR NUMERO NUMERO_DECIMAL
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
     
declaracion : tipoDato IDENTIFICADOR                                        {insertar($2[0]);}
            | tipoDato IDENTIFICADOR ASIGNACION expresionAsignacion         {insertar($2[0]);}  
            | declaracion ',' IDENTIFICADOR                                 {insertar($3[0]);}
            | declaracion ',' IDENTIFICADOR ASIGNACION expresionAsignacion  {insertar($3[0]);}
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
	    
instruccion : LEER '(' IDENTIFICADOR ')'
            | IDENTIFICADOR ASIGNACION expresionAsignacion
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

int ya_esta(char simbolo){
  int i = 0; 

  for(i = 0; i<80; i++){
    if(tabla[i] == simbolo){
      return 1; 
    }
  }
  return 0; 
}

void insertar(char simbolo){
  if(!ya_esta(simbolo)){
    printf("\n Insertando variable %c", simbolo); 
    ultimo++;
    tabla[ultimo] = simbolo; 
  }else{
    printf("\n\n La variable '%c' ya existe\n",simbolo); 
    return; 
  }
}

