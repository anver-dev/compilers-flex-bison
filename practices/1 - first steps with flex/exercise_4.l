%{
  /* Ejercicio 4: Validando expresiones regulares de
     los ejercicios 2 y 3 */
%}

%%

[s|S]"alir"	          { return 0; }
([a|c|d]|b[a|c|d])*b?	  { printf("Cadena sin b's consecutivas.\n"); }
((00)*(10)*)*1?|1(0)+     { printf("Cadena con 1's en posición impar.\n"); }
.+			  { printf("Cadena invalida.\n"); }

%%

int main(int argc, char **argv) {
  ++argv, --argc;
  
  if(argc > 0)
    yyin = fopen(argv[0], "r");
  else {
    yyin = stdin;
    printf("Introduce una cadena: (Para finalizar ingresa salir)\n");
  }

  yylex();

  return 0;
}
