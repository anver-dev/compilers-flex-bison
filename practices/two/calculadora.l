%{
  /* Equipo: 
    - Ana Karina Vergara Guzman (2153010383)
    - Yessicaa Fabiola Santiago Valdes (2173011484)
  */
  #include <ctype.h>
  #include <stdio.h>

  #include "calculadora.tab.h"
%}

%%
 
"+"               { return MAS; }
"*"               { return POR; }
"/"               { return DIV; }
"-"               { return MENOS; }
"\n"              { return EOL; /*  End Of Line */ }
"|"               {return ABS;} /*Valor absoluto*/
[=()]             { return *yytext; }
"-"?[0-9]*        { yylval = atoi(yytext);  return NUMERO; }
[ \t]             { /*IGNORAR*/ }
.                 { /*IGNORAR*/ }

%%

int yywrap(void){
	return 1;
}


