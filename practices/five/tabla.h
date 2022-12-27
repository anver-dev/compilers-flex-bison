char tabla[80];
int ultimo = -1;

struct Simbolo {
	char *nombre; 
	struct Simbolo *sig; 
}


int ya_esta(char simbolo) {
	int i = 0;
	
	for(i = 0; i < 80; i++) {
		if(tabla[i] == simbolo) {
			return 1;
		}
	}
	return 0;
}

void insertar(char simbolo) {
	if(!ya_esta(simbolo)){
		 printf("\nInsertando variable %c",simbolo); 
		ultimo++;
		tabla[ultimo] = simbolo;
	}else{
		printf("\nLa variable %c ya existe",simbolo);
		return;
	}	
}