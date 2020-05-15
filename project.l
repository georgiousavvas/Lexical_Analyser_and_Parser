%{
#include "y.tab.h"  
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void lexerror(const char*);
//int getcurrentline() { return yylineno; }
int linenum = 1;
int tb = 0;
int tbflag=0;
int i=0;
void tbs(int tb,int tbflag){
	if(tbflag==0){
		for(i=0;i<tb;i++){
			printf("\t");
		}
	}
}
void newl(int tbflag){
	if(tbflag==0){
		printf("\n");	
	}
}
%}

%option yylineno		
%option noyywrap



dig [0-9]
num \"{dig}+\"

string \"[A-Za-z0-9]+\"
string2 [A-Za-z0-9]+


boolean \"["true"|"false"|"TRUE"|"FALSE"|"True"|"False"]\"


year {dig}{4}
month {dig}{2}
day {dig}{2}
datetime \"[year "-" month "-" day]\"


whitespace [ \n\t\r]+
newline \n

str "String"
mystring \"{str}\"

nm "Number"
mynumber \"{nm}\"

dt "DateTime"
mydatetime \"{dt}\"

bl "Boolean"
myboolean \"{bl}\"



%%

"ss"		{ printf("ss"); return ss; }
"<"		{ tbs(tb,tbflag); printf("<"); return st ;}
">"		{  printf(">"); newl(tbflag) ; return en;}
"/"		{ printf("/"); return sl;}
"="		{ printf("="); return eq;}
":"		{ printf(":"); return cl;}


"Workbook"	{ printf("Workbook"); return Wbook;}
"Styles"	{ printf("Styles"); return Styles;}
"Style"		{ printf("Style"); return Style;}
"ID"		{ printf("ID"); return Id;}
"StyleID"	{ printf("StyleID"); return Styleid;}
"Worksheet"	{ printf("Worksheet"); return Wsheet;}
"Name"		{ printf("Name"); return Name;}
"Table"		{ printf("Table"); return Table;}
"ExpandedColumnCount"	{printf("ExpandedColumnCount"); return Excol;}
"ExpandedRowCount"	{printf("ExpandedRowCount"); return Exrow;}
"Protected"	{printf("Protected"); return Protected;}
"Column"	{printf("Column"); return Col;}
"Row"		{printf("Row"); return Row;}
"Cell"		{printf("Cell"); return Cell;}
"Heigth"	{printf("Height"); return Height;}
"Width"		{printf("Width"); return Width;}
"Hidden"	{printf("Hidden"); return Hidden;}
"Data"		{printf("Data"); return Data;}
"MergeAcross"	{printf("MergeAcross"); return Meracross;}
"MergeDown"	{printf("MergeDown"); return Merdown;}
"Type"		{printf("Type"); return Type;}
{mystring}	{printf("%s",yytext); return datastring;}
{mynumber}	{printf("%s",yytext); return datanumber;}
{mydatetime}	{printf("%s",yytext); return datadatetime;}
{myboolean}	{printf("%s",yytext); return databoolean;}


{num}			{printf("%s",yytext); return Num;}
{string}		{printf("%s",yytext); return String;}
{string2}		{printf("%s",yytext); return String2;}
{boolean}		{printf("%s",yytext); return Boolean;}
{datetime}		{printf("%s",yytext); return Datetime;}

[\t\n | \n]		{ ++linenum;}
[ \t\n]+		{printf(" ");}
"<!--".*\n*"-->"	{printf("%s",yytext);}
. 			;
%%
