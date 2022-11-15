%{
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
[=()]             { return *yytext; }
"0"|[1-9][0-9]*   { yylval = atoi(yytext);  return NUMERO; }
[ \t]             { /*IGNORAR*/ }
.                 { /*IGNORAR*/ }

%%

int yywrap(void){
	return 1;
}


