%{
  /* Ejercicio 6: qué hace un programa en Flex cuando encuentra una cadena aceptada por dos o
    más patrones. SOLUCION
  */
%}

%%

"if"  			{ printf("%s: palabra reservada\n", yytext); }
[a-z][a-zA-Z0-9_]*  	{ printf("%s: identificador\n", yytext); }
.+     			{ printf("CADENA INVALIDA.\n"); }
\n 			{ return 0; }

%%

int main() { 
  printf("Introduce una cadena: ");
  yylex();

  return 0;
}
