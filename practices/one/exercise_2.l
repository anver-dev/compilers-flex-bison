%{
  /* Ejercicio 2: Expresión regular para todas las cadenas que no contienen b’s consecutivas
     en el alfabeto = {a, b, c, d}
  */
%}

%%

([a|c|d]|b[a|c|d])*b?  	{ printf("CADENA VÁLIDA.\n"); }
.+     	                { printf("CADENA INVALIDA.\n"); }
\n 		        { return 0; }

%%

int main() { 
  printf("Introduce una cadena sin b's consecutivas: ");
  yylex();

  return 0;
}
