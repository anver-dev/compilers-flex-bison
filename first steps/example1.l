%{
/*Soy un comentario :D*/
/*En esta seccion colocamos codigo en C auxiliar :v*/
%}

%%

[a-z][a-zA-Z0-9_]{1,8}	{ printf("\nEsto es un identificador\n"); }
.+			{ printf("\nCadena invalida.\n"); }
\n			{ return 0; }

%%

int main() { 
  printf("Introduce una cadena: ");
  yylex(); // scanner
  return 0;
}


