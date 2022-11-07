%{
  /* 
  Ejercicio 3: Expresión regular para todas las cadenas que tienen 1’s 
  únicamente en las posiciones impares en el alfabeto = {0|1}
  */
%}

DIGITO [0-9]
DECIMAL [0-9]"."[0-9]
PALABRA_RESERVADA imprimir|leer|si|sino|mientras|para|haz|programa|entero|flotante|caracter|constante|regresa|romper|continuar
OPERADOR_ARITMETICO "+"|"-"|"*"|"/"|"%"
OPERADOR_RELACIONAL "<"|">"|"<="|">="|"=="|"!="
OPERADOR_LOGICO "&&"|"||"|"!"

%%

{PALABRA_RESERVADA}                         { printf("Esto es una palabra reservada\n");}
[a-z][a-zA-Z0-9_]*			                    { printf("Esto es un identificador\n"); }
("-"?{DIGITO})+                             { printf("Esto es un número entero\n"); }
("-"?{DECIMAL})+                            { printf("Esto es un número con decimales\n"); }
("-"?{DECIMAL}"E"("-"?){DIGITO})+           { printf("Esto es un número en notacion cientifica\n"); }
"//".+                                      { printf("Esto es un comentario de un renglón\n"); }
{OPERADOR_ARITMETICO}                       { printf("Esto es un operador aritmetico\n"); }
({OPERADOR_RELACIONAL}|{OPERADOR_LOGICO})   { printf("Esto es un operador relacional o lógico\n"); }
"()"|"{}"|"[]"                              { printf("Esto es un parentesis\n"); }
[ \t]			                                  { /*ESPACIOS*/ }
.+					                                { printf("Cadena invalida.\n"); 		}
\n    					                            { return 0; 					}

%%

int main() { 
  printf("Introduce una cadena: ");
  yylex();

  return 0;
}
