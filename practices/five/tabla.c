#include <stdio.h>
#include <stdlib.h>

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

void imprimir_lista(struct Simbolo *primer_nodo){
    if (esta_vacia(primer_nodo)) {
        printf("\nLista vacia\n");
        return; 
    }
    
    while (primer_nodo != NULL) {
        printf("%s\n", primer_nodo->nombre);
        primer_nodo = primer_nodo->sig; 
    }
}

int main(){
    imprimir_lista(NULL);
    char *name = "a";
    char *name2 = "b";

    struct Simbolo *primer_nodo = crear_nodo(name, NULL);
    
    primer_nodo = insertar_inicio(primer_nodo, name2);
    
    imprimir_lista(primer_nodo);
}