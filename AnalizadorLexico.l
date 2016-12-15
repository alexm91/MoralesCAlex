%{
#include <stdio.h>
int linea=1;
%}

PalabraReservadaCompilador "int"|"if"|"bool"|"char"|"string"|"if"|"then"|"else"|"while"|"do"|"input"|"output"|"return"
CaracteresEspeciales ","|";"|":"|"("|")"|"["|"]"|"{"|"}"|"+"|"-"|"*"|"/"|"<"|">"|"="|"!"|"&"|"$"
OperadoresCompuestos "<="|">="|"=="|"!="|"&&"|"||"
espacio	[ \t\n]
id	[a-zA-Z][a-z0-9]* 
int	("-"?[0-9]*)
float	([0-9]+"."[0-9]+)
char	[a-zA-Z]
string	[a-zA-Z]*
bool	(true|false)

%% 


"int"|"if"|"bool"|"char"		printf("Palabra reservada: %s\n", yytext);
"string"|"if"|"then"|"else"|"while"	printf("Palabra reservada: %s\n", yytext);
"do"|"input"|"output"|"return"		printf("Palabra reservada: %s\n", yytext);

","|";"|":"|"("|")"|"["|"]"		printf("Caracter especial: %s\n", yytext);
"{"|"}"|"+"|"-"|"*"|"/"			printf("Caracter especial: %s\n", yytext);
"<"|">"|"="|"!"|"&"|"$"			printf("Caracter especial: %s\n", yytext);

"<="|">="|"=="|"!="|"&&"|"||"		printf("Operando compuesto: %s\n", yytext);

[ \t\n]+
"{"[^}\n]*"}"

{int}+					printf("Un entero: %s\n", yytext);
{float}     		 		printf("Un entero real: %s\n", yytext);
{bool}					printf("un bool: %s\n", yytext);
{char}					printf("Una letra: %s\n", yytext);
{string}				printf("Una palabra: %s\n", yytext);
{id}        				printf("Un identificador: %s\n", yytext );
.					{printf("Error Lexico: %s\t en la linea: %d\n", yytext, linea); exit(0);}

%%
main(){
if((yyin = fopen("entrada.txt", "rt"))==NULL)
{
 printf("\nError con el archivo de entrada");
}
else
{
yylex();
}
fclose(yyin);
}
int yywrap() {
  return 1;
}

