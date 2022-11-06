%{
  /* Ejercicio 2: Expresión regular para todas las cadenas que no contienen b’s consecutivas
     en el alfabeto = {a, b, c, d}
  */
%}

ACD [a|c|d]

%%

({ACD}|b{ACD})*b?  			{ printf("Cadena sin b's consecutivas.\n"); }
.+					            { printf("Cadena invalida.\n"); 		}
\n    					        { return 0; 					}

%%

int main() { 
  printf("Introduce una cadena: ");
  yylex();

  return 0;
}
