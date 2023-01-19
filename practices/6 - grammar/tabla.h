char tabla[80];
int ultimo = -1;

struct Simbolo {
	char nombre_simbolo[80]; 
	char tipo[20];
	int inicializada;
	struct Simbolo *sig; 
};

struct Simbolo *crear_nodo(char nombre[80], struct Simbolo *sig);
struct Simbolo *insertar_inicio(struct Simbolo *primer_nodo, char nombre[80]);
void imprimir_lista(struct Simbolo *primer_nodo);

int esta_inicializada(struct Simbolo *primer_nodo, char nombre[80]) {
	if(primer_nodo == NULL || primer_nodo->sig == NULL) {
		return 0;
	}

	struct Simbolo *aux = primer_nodo;


	while(aux->sig->inicializada != 0) {
        aux = aux->sig;
		return 0;
    }

	printf("La variable %c no esta inicializada. \n", *nombre);
    return 1;
}

int ya_esta(struct Simbolo *primer_nodo, char nombre[80]) {
	if(primer_nodo == NULL || primer_nodo->sig == NULL) {
		return 0;
	}

	struct Simbolo *aux = primer_nodo;
	
	printf("Ya existe la variable %d \n", strcmp(aux->sig->nombre_simbolo, nombre));

    while(strcmp(aux->sig->nombre_simbolo, nombre) != 0) {
        aux = aux->sig;
		return 0;
    }

	printf("Ya existe la variable %c \n", *nombre);
    return 1;
}

struct Simbolo *insertar(struct Simbolo *primer_nodo, char nombre[80]) {

	if(primer_nodo == NULL || strcmp(primer_nodo->nombre_simbolo, nombre) > 0) {
		printf("Insertando al inicio: %c \n", *nombre);
        primer_nodo = insertar_inicio(primer_nodo, nombre);
		return primer_nodo;
    }
	
	struct Simbolo *nuevo_nodo = crear_nodo(nombre, NULL);
    struct Simbolo *aux = primer_nodo;
	
	if (aux->sig == NULL && strcmp(primer_nodo->nombre_simbolo, nombre) == 0) {
		printf("La variable %c ya existe", *nombre);
		return primer_nodo;
	}
	
    while(aux->sig != NULL) {
		if (ya_esta(primer_nodo, nombre)) {
			printf("La variable %c ya existe", *nombre);
			return primer_nodo;
		}
		
        aux = aux->sig;
    }
    
	printf("Insertando %c \n", *nombre);
    nuevo_nodo->sig = aux->sig;
    aux->sig = nuevo_nodo;	

	imprimir_lista(primer_nodo);

	return aux;
}

struct Simbolo *insertar_inicio(struct Simbolo *primer_nodo, char nombre[80]) {
    struct Simbolo *nuevo_nodo = crear_nodo(nombre, primer_nodo);
    primer_nodo = nuevo_nodo; 

    return primer_nodo; 
}


struct Simbolo *crear_nodo(char nombre[80], struct Simbolo *sig) {
	struct Simbolo *nuevo_nodo = (struct Simbolo*) malloc(sizeof(struct Simbolo)); 

    if (nuevo_nodo == NULL) {
        printf("\nProblema al crear el nodo\n"); 
        exit(0);
    }

	strcpy(nuevo_nodo->nombre_simbolo, nombre);
    nuevo_nodo->sig = sig;
	nuevo_nodo->inicializada = 0;

    return nuevo_nodo; 
}

void imprimir_lista(struct Simbolo *primer_nodo) {
    if (primer_nodo == NULL) {
        printf("\nLista vacia\n");
        return; 
    }
    
    while (primer_nodo != NULL) {
        printf("%s\n", primer_nodo->nombre_simbolo);
        primer_nodo = primer_nodo->sig; 
    }
}