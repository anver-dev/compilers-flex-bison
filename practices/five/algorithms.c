#include <stdio.h>
#include <stdlib.h>

/* Lista ligada en C */

struct nodo {
    struct nodo *sig; 
    int dato;
};

int esta_vacia(struct nodo *primer_nodo) {
    return primer_nodo == NULL;
}

struct nodo *crear_nodo(int dato, struct nodo *sig) {
    struct nodo *nuevo_nodo = (struct nodo*) malloc(sizeof(struct nodo)); 

    if (nuevo_nodo == NULL) {
        printf("\n Problema al crear el nodo\n"); 
        exit(0);
    }

    nuevo_nodo->dato = dato; 
    nuevo_nodo->sig = sig; 

    return nuevo_nodo; 
}

struct nodo *insertar_inicio(struct nodo *primer_nodo, int dato) {
    struct nodo *nuevo_nodo = crear_nodo(dato, primer_nodo);
    primer_nodo = nuevo_nodo; 

    return primer_nodo; 
}

void imprimir_lista(struct nodo *primer_nodo){
    if (esta_vacia(primer_nodo)) {
        printf("\nLista vacia\n");
        return; 
    }
    
    while (primer_nodo != NULL) {
        printf("%d\n", primer_nodo->dato);
        primer_nodo = primer_nodo->sig; 
    }
}

void insertar_final(struct nodo *primer_nodo, int dato) {
    if (esta_vacia(primer_nodo)) {
        insertar_inicio(primer_nodo, dato);
        return; 
    }
    
    struct nodo *nuevo_nodo = crear_nodo(dato, NULL); 

    while (primer_nodo->sig !=NULL) {
        primer_nodo = primer_nodo->sig; 
    }

    primer_nodo->sig = nuevo_nodo; 
}

struct nodo *insertar_orden(struct nodo *primer_nodo, int dato) {
    if (esta_vacia(primer_nodo) || dato <= primer_nodo->dato) {
        return insertar_inicio(primer_nodo, dato); 
    } else {
        struct nodo *nuevo_nodo = crear_nodo(dato, NULL);
        struct nodo *aux = primer_nodo; 

        while ((aux->sig != NULL) && (aux->sig->dato < dato)) {
            aux = aux->sig; 
        }
        nuevo_nodo->sig = aux->sig; 
        aux->sig = nuevo_nodo; 

        return primer_nodo; 
    }    
}

int buscar_dato(struct nodo *primer_nodo, int dato) {
    if (esta_vacia(primer_nodo)) {
        return 0; 
    } else {
        struct nodo *aux = primer_nodo; 
        while (aux != NULL){
            if (aux->dato == dato){
                return 1; 
            }

            aux = aux->sig; 
        }

        return 0; 
    }
}

struct nodo *borrar_inicio(struct nodo *primer_nodo) {
    if (esta_vacia(primer_nodo)) {
        printf("\nLista vacia");
        return NULL; 
    } else {
        struct nodo *aux = primer_nodo; 
        primer_nodo = aux->sig;

        free(aux); 

        return primer_nodo; 
    }
    
}

struct nodo *borrar_final(struct nodo *primer_nodo) {
    if (esta_vacia(primer_nodo)){
        printf("\nLista vacia");
        return NULL; 
    } else {
        struct nodo *aux2 = primer_nodo; 
        struct nodo *aux1 = NULL;

        if (aux2->sig == NULL){
            return borrar_inicio(primer_nodo); 
        }

        while (aux2->sig != NULL){
            aux1 = aux2; 
            aux2 = aux2->sig; 
        }

        aux1->sig = NULL; 
        free(aux2);

        return primer_nodo; 
    }
}

struct nodo *borrar_orden(struct nodo *primer_nodo, int dato) {
    if (esta_vacia(primer_nodo)){
        printf("\n Lista vacia");
        return NULL; 
    }
    /* No está completo */
}

int main(){
    imprimir_lista(NULL);

    struct nodo *primer_nodo = crear_nodo(2, NULL);
    
    primer_nodo = insertar_inicio(primer_nodo, 1);
    insertar_final(primer_nodo, 3);
    
    imprimir_lista(primer_nodo);
}

