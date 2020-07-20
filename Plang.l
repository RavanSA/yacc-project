%{
#include <stdio.h>
#include "y.tab.h"
%}

%option yylineno


%x COMMENTS
%%
([0-9]*\.[0-9]+)     {yylval.number=atof(yytext); return INTEGER;}
\"([^\\\"]|\\.)*\"   {return STRING;}
"int"                {return INT;}
"String"             {return STRINGTYPE;}
"char"		     {return CHAR;}
"float"		     {return FLOAT;}
"exit"               {return EXIT_PROG;}
"true"		     {return TRUEA ;}
"false"		     {return FALSEA;}
"boolean"            {return BOOLEAN;}
"printf"             {return PRINTING;}
"public"             {return PUBLIC;}
"main"               {return MAIN;}
"static"             {return STATIC;}
"void"               {return VOID;}
"if"                 {return IF;}
"else"               {return ELSE;}
"for"                {return FOR;}
"endloop"            {return LOOPEND;}
"try"                {return TRY;}
"catch"              {return CATCH;}
"throw"              {return THROW;}
"Exception"          {return EXCEPTION;}
"class"              {return CLASS;}
"package"            {return PACKAGE;}
"import"             {return IMPORT;}
"const"		     {return CONST;}
"scanner"            {return SCANNER;}
"function"           {return FUNCTION;}
"."                  {return DOT;}
[a-zA-Z_]([a-zA-Z_]|[0-9])*	{yylval.string=strdup(yytext); return (IDENTIFIER) ;}
[0-9]+		     {yylval.number=atoi(yytext); return NUMBER;}
[a-zA-Z_]?'(\\.|[^\\'\n])+'  {return CONST;}
([+-]?[0-9]*(\.)[0-9]+)      {yylval.number=atoi(yytext); return NUM;}
"("                 {return LP;}
")"                 {return RP;}
"{"                 {return LBRACE;}
"}"                 {return RBRACE;}
"["                 {return LSQR;}
"]"                 {return RSQR;}
"+"                 {return PLUS;}
"-"                 {return MINUS;}
"*"                 {return MULT;}
"/"                 {return DIV;}
"%"                 {return MOD;}
";"                 {return SEMICOLON;}
":"                 {return COLON;}
","                 {return COMMA;}
"++"                {return INCREMENT;}
"--"                {return DECREMENT;}
"="                 {return ASSIGNMENT_OP;}
"||"                {return OR_OP;}
"&&"                {return AND_OP;}
"=="                {return EQ;}
"<"                 {return LESS_OP;}
">"                 {return GREATER_OP;}
"<="		    {return LE;}
">="		    {return GE;}
"!="                {return NE;}
"!"                 {return NOT;}
"*="                {return MULTASSIGN_OP;}
"/="                {return DIVDASSIGN_OP;}
"+="                {return ADDASSIGN_OP;}
"-="                {return SUBDASSIGN_OP;}
[ \t\n]		        ;
"//".*			;
"/*"			{BEGIN(COMMENTS);}
<COMMENTS>"*/"		{;BEGIN(INITIAL);}
<COMMENTS>.		;
.            		;
%%
