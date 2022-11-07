%{
  /* 
  Ejercicio 3: Expresión regular para todas las cadenas que tienen 1’s 
  únicamente en las posiciones impares en el alfabeto = {0, 1}
  */
%}
CEROS_PARES (00)*
P1 (10)*
P2 1(0)+


%%
({CEROS_PARES}({P1}|{P2}))*1?   { printf("CADENA VALIDA\n"); }
.+					                    { printf("CADENA INVALIDA.\n"); 		}
\n    					                { return 0; 					}

%%

int main() { 
  printf("Introduce una cadena que contiene 1's solo en posiciones impares: ");
  yylex();

  return 0;
}
