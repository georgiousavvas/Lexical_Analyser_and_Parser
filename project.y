%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *);					
extern FILE *yyin;
extern int linenum;
extern int tb;
extern int tbflag;
extern int yylineno;

%}

%error-verbose
%token Wbook
%token Styles
%token Style
%token Id
%token Styleid
%token Wsheet
%token Name
%token Table
%token Excol
%token Exrow
%token Protected
%token Col
%token Row
%token Cell
%token Height
%token Width
%token Hidden
%token Data
%token Meracross
%token Merdown
%token Type
%token datastring
%token datanumber
%token databoolean
%token datadatetime



%token Num
%token String
%token String2
%token Boolean
%token Datetime

%token ss
%token st
%token en
%token sl
%token eq
%token cl

%start program


%%


program : workbook {printf("\n\nThe syntax of the XML file is correct \n");} 

;


workbook : stss cl Wbook en worksheet2 stsl ss cl Wbook en 
|
  stss cl Wbook en styles2 worksheet2 stsl ss cl Wbook en 
;

styles2 :  styles2 styles | styles ;

styles : stss cl Styles en stsl ss cl Styles en 
|
 stss cl Styles en style2 stsl ss cl Styles en  
;

worksheet2 : worksheet2 worksheet {--tb;}| worksheet;


worksheet : stss cl Wsheet ss cl Name eq String en stsl ss cl Wsheet en
| 
stss cl Wsheet ss cl Name eq String en table2 stsl ss cl Wsheet en 
|
stss cl Wsheet ss cl Name eq String  ss cl Protected eq Boolean en stsl ss cl Wsheet en 
|
 stss cl Wsheet ss cl Name eq String ss cl Protected eq Boolean en table2 stsl ss cl Wsheet en
; 

style2:  style2 style  | style ; 

style : stssclStyle ss cl Id eq String en stsl ss cl Style en
;

table2 :  table2 table {--tb;}| table;

table : stss cl Table en stsl ss cl Table en
|
stss cl Table en column2 stsl ss cl Table en
|
stss cl Table en row2 stsl ss cl Table en
|
stss cl Table en column2 row2 stsl ss cl Table en
|
stss cl Table  tableop2 en stsl ss cl Table en
|
stss cl Table tableop2 en row2 stsl ss cl Table en
|
stss cl Table tableop2 en column2 stsl ss cl Table en
|
stss cl Table tableop2 en column2 row2 stsl ss cl Table en
;

tableop2 :  tableop2 tableop | tableop ;

tableop : ss cl Excol eq Num
|
ss cl Exrow eq Num
|
ss cl Styleid eq String
;

column2 :  column2 column {--tb;}| column ;

column: stss cl Col slen
|
stss cl Col colop2 slen
;

colop2 :  colop2 colop | colop;

colop : ss cl Styleid eq String
|
ss cl Hidden eq Boolean
|
ss cl Width eq Num
;

row2 :  row2 row {--tb;} | row;

row : stss cl Row en stsl ss cl Row en
|
stss cl Row en cell2 stsl ss cl Row en
|
stss cl Row rowop2 en stsl ss cl Row en
|
stss cl Row rowop2 en cell2 stsl ss cl Row en
;

rowop2 :  rowop2 rowop | rowop;

rowop : ss cl Styleid eq String
|
ss cl Hidden eq Boolean
|
ss cl Height eq Num
;

cell2 :  cell2 cell {--tb;}| cell;

cell : stss cl Cell en stsl ss cl Cell en
|
stss cl Cell en data2 stsl ss cl Cell en
|
stss cl Cell cellop2 en stsl ss cl Cell en
|
stss cl Cell cellop2 en data2 stsl ss cl Cell en
;

cellop2 :  cellop2 cellop | cellop ;

cellop : ss cl Styleid eq String
|
ss cl Meracross eq Num
|
ss cl Merdown eq Num
;

data2 :  data2 data {--tb;}| data  ;

data : stssclData ss cl Type eq var en stsl ss cl Data en
|
stssclData ss cl Type eq var en String2 stsl ss cl Data en
;

var : datanumber | datadatetime | databoolean | datastring ;

stss : st ss {++tb;}
;

stsl : st sl {--tb; tbflag=0;}
;

slen : sl en {--tb;}
;

stssclStyle : stss cl Style {tbflag=1;} 
;

stssclData : stss cl Data {tbflag=1;}
;



%%

void yyerror(const char *s) {

    fprintf(stderr," %s at line number : %d \n ---> ",s,yylineno);

}


int main (int argc , char **argv){

	yyin = fopen(argv[1] , "r");
	if(!yyin){printf("cant open file"); return 1;}
	do{
	yyparse();
	}while(!feof(yyin));
	printf("\n");	
	return 0;
}

 





