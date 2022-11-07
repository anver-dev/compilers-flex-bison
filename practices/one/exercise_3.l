%{
  /* 
  Ejercicio 3: Expresión regular para todas las cadenas que tienen 1’s 
  únicamente en las posiciones impares en el alfabeto = {0, 1}
  */
%}

%%

1(01|0(00)*1)+      		      { printf("Cadena con 1's en posición impar.\n"); }
.+					            { printf("Cadena invalida.\n"); 		}
\n    					        { return 0; 					}

%%

int main() { 
  printf("Introduce una cadena: ");
  yylex();

  return 0;
}
