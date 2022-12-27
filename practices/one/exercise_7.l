%{
  /* 
  Ejercicio 7: programa que acepta la micro sintaxis siguiente:
    - Los identificadores de variables deben comenzar con minúscula seguida de una cadena , 
      de longitud mayor o igual a cero, compuesta por letras minúsculas, letras mayúsculas, 
      números y guión bajo.
    - Números enteros: positivos y negativos.
    - Números con decimales: positivos y negativos.
    - Números en notación científica: -1.8E-92, 20.09E19, etc.
    - Comentarios de un renglón.
    - Operadores aritméticos: +, -, *, /, %
    - Operadores relacionales y lógicos: <, >, <=, >=, ==. !=, &&, ||, !
    - Paréntesis: ( ) { } [ ]
    - Palabras reservadas: imprimir, leer, si, sino, mientras, para, haz, programa, 
      entero, flotante, caracter, constante, regresa, romper, continuar.

  */
%}

DIGITO [0-9]+
DECIMAL [0-9]+"."[0-9]+
PALABRA_RESERVADA imprimir|leer|si|sino|mientras|para|haz|programa|entero|flotante|caracter|constante|regresa|romper|continuar
OPERADOR_ARITMETICO "+"|"-"|"*"|"/"|"%"
OPERADOR_RELACIONAL "<"|">"|"<="|">="|"=="|"!="
OPERADOR_LOGICO "&&"|"||"|"!"

%%

{PALABRA_RESERVADA}                         { printf("%s: palabra reservada\n", yytext); }
[a-z][a-zA-Z0-9_]*			    { printf("%s: identificador\n", yytext); }
{OPERADOR_RELACIONAL}                       { printf("%s: operador relacional\n", yytext); }
{OPERADOR_LOGICO}                           { printf("%s: operador lógico\n", yytext); }
{OPERADOR_ARITMETICO}                       { printf("%s: operador aritmetico\n", yytext); }
"("|")"|"{"|"}"|"["|"]"                     { printf("%s: parentesis\n", yytext); }
("-"?{DECIMAL}"E"("-"?){DIGITO})+           { printf("%s: número en notacion cientifica\n", yytext); }
{DIGITO}                                    { printf("%s: número entero positivo\n", yytext); }
"-"{DIGITO}                                 { printf("%s: número entero negativo\n", yytext); }
{DECIMAL}                                   { printf("%s: número positivo con decimales\n", yytext); }
"-"{DECIMAL}                                { printf("%s: número begativo con decimales\n", yytext); }
"//".+                                      { printf("%s: comentario de un renglón\n", yytext); }
[ \t]			                    { /*ESPACIOS*/ }
.                                           { printf("%s: otro\n", yytext); }
\n    					    { return 0; }

%%

int main() { 
  printf("Introduce una cadena: ");
  yylex();

  return 0;
}
