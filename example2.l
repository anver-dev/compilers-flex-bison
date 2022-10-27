%{
/*Soy un comentario :D*/
/*En esta seccion colocamos codigo en C auxiliar :v*/
%}

%%

if|else|while|for|do			{ printf("Esto es una palabra reservada :D\n");	}
[a-z][a-zA-Z0-9_.]{5,30}@gmail.com	{ printf("Esto es un correo de Gmail :)\n");	}
[a-z][a-zA-Z0-9_]{1,8}			{ printf("Esto es un identificador\n"); 	}
.+					{ printf("Cadena invalida.\n"); 		}
\n					{ return 0; 					}

%%

int main() { 
  printf("Introduce una cadena: ");
  yylex(); // scanner
  return 0;
}


