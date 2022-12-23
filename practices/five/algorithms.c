#include <stdio.h>
#include <stdlib.h>

/* Lista ligada en C */

struct nodo{
    struct nodo *sig; 
    int dato;
};

struct nodo *crear_nodo(int dato, struct nodo *sig){
    struct nodo *nuevo_nodo = (struct nodo*) malloc (sizeof (struct nodo)); 

    if (nuevo_nodo == NULL){
        printf("\n Problema al crear el nodo\n"); 
        exit(0);
    }

    nuevo_nodo -> dato; 
    nuevo_nodo -> sig = sig; 

    return nuevo_nodo; 
}

struct nodo *insertar_inicio(struct nodo *primer_nodo, int dato){
    struct nodo *nuevo_nodo = crear_nodo (dato, primer_nodo);
    primer_nodo = nuevo_nodo; 
    return primer_nodo; 
}

void imprimir_lista (struct nodo *primer_nodo){
    if (esta_vacia(primer_nodo)){
        printf("\n Lista vacia\n");
        return; 
    }
    
    while (primer_nodo != null){
        printf("%d", primer_nodo -> dato);
        primer_nodo = primer_nodo -> sig; 
    }
}

int main(){
    /* Más cosas */
}

void insertar_final(struct nodo *primer_nodo, int dato){
    if (esta_vacia(primer_nodo)){
        insertar_inicio(primer_nodo, dato);
        return; 
    }
    
    struct nodo *nuevo_nodo (dato, null); 

    while (primer_nodo -> sig !=null ){
        primer_nodo = primer_nodo -> sig; 
    }
    primer_nodo -> sig = nuevo_nodo; 
}

struct nodo *insertar_orden (struct nodo *primer_nodo, int dato){
    if (esta_vacia(primer_nodo) || dato<= primer_nodo -> dato){
        return insertar_inicio (primer_nodo); 
    }
    else{
        struct nodo *nuevo_nodo = crear_nodo (dato, null);
        struct nodo *aux = primer_nodo; 
        while ((aux -> sig != null) && (aux -> sig -> dato < dato )){
            aux = aux -> sig; 
        }
        nuevo_nodo -> sig = aux -> sig; 
        aux -> sig = nuevo_nodo; 
        return primer_nodo; 
    }    
}

void buscar_dato(struct nodo primer_nodo, int dato){
    if (esta_vacia (primer_nodo)){
        return 0; 
    }
    
    else {
        struct nodo *aux = primer_nodo; 
        while (aux != null){
            if (aux -> dato == dato){
                return 1; 
            }
            aux = aux -> sig; 
        }
        return 0; 
    }
}

struct nodo *borrar_inicio(struct nodo primer_nodo){
    if (esta_vacia(primer_nodo)){
        printf("\nLista vacia");
        return null; 
    }
    else{
        struct nodo *aux = primer_nodo; 
        primer_nodo = aux -> sig;
        free(aux); 
        return primer_nodo; 
    }
    
}

struct nodo *borrar_final(struct nodo primer_nodo){
    if (esta_vacia(primer_nodo)){
        printf("\n Lista vacia");
        return null; 
    }
    else{
        struct nodo *aux2 = primer_nodo; 
        struct nodo *aux1 = null; 
        if (aux -> sig == null){
            return borrar_inicio(primer_nodo); 
        }
        while (aux2 -> sig != null){
            aux1 = aux2; 
            aux2 = aux2 -> sig; 
        }
        aux1 -> sig = null; 
        free(aux2);
        return primer_nodo; 
    }
}

struct nodo *borrar_orden (struct nodo *primer_nodo, int dato){
    if (esta_vacia(primer_nodo)){
        printf("\n Lista vacia");
        return null; 
    }
    /* No está completo */
}

/* ***************************************** */

struct Simbolo{ //ya está?
    char nombre[80]; 
};

