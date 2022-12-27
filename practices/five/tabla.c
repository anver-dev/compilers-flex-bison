#include <stdio.h>
#include <stdlib.h>
#include <string.h>

  /* Equipo: 
    - Ana Karina Vergara Guzman (2153010383)
    - Yessicaa Fabiola Santiago Valdes (2173011484)
  */

struct Simbolo {
	char *nombre; 
	struct Simbolo *sig; 
};

struct Simbolo *crear_nodo(char *nombre, struct Simbolo *sig) {
    struct Simbolo *nuevo_nodo = (struct Simbolo*) malloc(sizeof(struct Simbolo)); 

    if (nuevo_nodo == NULL) {
        printf("\nProblema al crear el nodo\n"); 
        exit(0);
    }

    nuevo_nodo->nombre = nombre; 
    nuevo_nodo->sig = sig; 

    return nuevo_nodo; 
}

int esta_vacia(struct Simbolo *primer_nodo) {
    return primer_nodo == NULL;
}

struct Simbolo *insertar_inicio(struct Simbolo *primer_nodo, char *nombre) {
    struct Simbolo *nuevo_nodo = crear_nodo(nombre, primer_nodo);
    primer_nodo = nuevo_nodo; 

    return primer_nodo; 
}

void insertar_final(struct Simbolo *primer_nodo, char *nombre) {
    if (esta_vacia(primer_nodo)) {
        insertar_inicio(primer_nodo, nombre);
        return; 
    }
    
    struct Simbolo *nuevo_nodo = crear_nodo(nombre, NULL); 

    while (primer_nodo->sig !=NULL) {
        primer_nodo = primer_nodo->sig; 
    }

    primer_nodo->sig = nuevo_nodo; 
}

void imprimir_lista(struct Simbolo *primer_nodo) {
    if (esta_vacia(primer_nodo)) {
        printf("\nLista vacia\n");
        return; 
    }
    
    while (primer_nodo != NULL) {
        printf("%s\n", primer_nodo->nombre);
        primer_nodo = primer_nodo->sig; 
    }
}

struct Simbolo *insertar_ordenAl(struct Simbolo *primer_nodo, char *nombre) {
    if(esta_vacia(primer_nodo) || strcmp(primer_nodo->nombre, nombre) > 0) {
        primer_nodo = insertar_inicio(primer_nodo, nombre);
        return primer_nodo; 
    }

    struct Simbolo *nuevo_nodo = crear_nodo(nombre, NULL);
    struct Simbolo *aux = primer_nodo;

    while(aux->sig != NULL && strcmp(aux->sig->nombre, nombre) < 0) {
        aux = aux->sig;
    }
    
    nuevo_nodo->sig = aux->sig;
    aux->sig = nuevo_nodo;

    return primer_nodo;
}

int main() {
    imprimir_lista(NULL);

    char *test = "b";
    char *test2 = "a";
    char *test3 = "c";
    char *test4 = "d";
    char *test5 = "2";

    struct Simbolo *primer_nodo = crear_nodo(test, NULL);

    primer_nodo = insertar_inicio(primer_nodo, test4);

    primer_nodo = insertar_ordenAl(primer_nodo, test4);
    primer_nodo = insertar_ordenAl(primer_nodo, test2);
    primer_nodo = insertar_ordenAl(primer_nodo, test3);

    insertar_final(primer_nodo, test5);
    imprimir_lista(primer_nodo);
}
