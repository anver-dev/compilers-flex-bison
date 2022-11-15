%{
  #include <stdio.h>
  #include <ctype.h>

  #define YYSTYPE int

  int yylex();
  int yyerror(const char *s);
%}

%start programa

%token NUMERO
%token MAS MENOS POR DIV
%token EOL

%left MAS MENOS
%left POR DIV


%%

programa : programa instruccion EOL
	 | /*NULO*/
	 ;

instruccion : 
	 | expresion                     { printf(" = %d\n", $1);  }
         ;

expresion : NUMERO
	  | expresion MAS expresion      { $$ = $1 + $3; }
 	  | expresion MENOS expresion    { $$ = $1 - $3; }
	  | expresion POR expresion      { $$ = $1 * $3; }
	  | expresion DIV expresion      { 
                                           if($3 == 0){
                                              printf("\nNo se puede dividir entre cero\n");
					      return 0;
                                           }else{
                                              $$ = $1 / $3;
                                           }
                                         }
          | '(' expresion ')'            { $$ = $1; }
          ;

%%

#include "lex.yy.c"

int main(){
	printf("Introduce una operación aritmética: ");
	yyparse();
}


int yyerror(const char *s){
        printf("\nError %s",s);
 	/*fprintf(stderr, "Error de sintaxis\n",s);*/
}





