%{
  /* Ejercicio 1: Permite contar el número de caracteres, de palabras y de líneas ingresadas o de un archivo. */

  int caracteres = 0;
  int palabras = 0;
  int lineas = 0;
%}

%%

[s|S]"alir"		{ palabras++; caracteres += strlen(yytext); lineas++; return 0; }
[a-zA-A]+		{ palabras++; caracteres += strlen(yytext); }
[ \t]			{ caracteres++; }
\n			{ caracteres++; lineas++; }
.			{ caracteres++; }

%%

int main(int argc, char **argv) {
  ++argv, --argc;
  
  if(argc > 0)
    yyin = fopen(argv[0], "r");
  else
    yyin = stdin;

  yylex();
  printf("\nNúmero de líneas: %d", lineas);
  printf("\nNúmero de palabras: %d", palabras);
  printf("\nNúmero de caracteres: %d\n", caracteres);

  return 0;
}
