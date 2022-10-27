%{
/*Soy un comentario :D*/
/*En esta seccion colocamos codigo en C auxiliar :v*/
#include <string.h>
int longitud;
%}

DIGITO [0-9]

%%

[1-9]{DIGITO}*				{ printf("Es un numero natural :)\n"); }
([0|1][0|1])*				{ printf("Binario de longitud PAR"); }
if|else|while|for|do			{ printf("Esto es una palabra reservada :D\n");	}
[a-z][a-zA-Z0-9_.]{5,30}@gmail.com	{ printf("Esto es un correo de Gmail :)\n");	}
[a-z][a-zA-Z0-9_]*			{ printf("Esto es un identificador\n"); longitud = strlen(yytext);	}
.+					{ printf("Cadena invalida.\n"); 		}
\n					{ return 0; 					}

%%

int main() { 
  printf("Introduce una cadena: ");
  yylex(); // scanner
  if(longitud > 0) {
    printf("La longitud del identificador es: %d\n", longitud);
  }
  return 0;
}
