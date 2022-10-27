# Info
Files for flex need saved with .l extension. This files contains three parts:
- Auxiliar code in C
- Regular expresions with their action in C
- Main and more code in C
# Commands
For generate c file:
```
  flex name_file.l
```
For generate executable file: 
```
  cc lex.yy.c -lfl
```
This command generate a.out file that can be executed. 
