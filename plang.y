%{
#include <stdio.h>
#include<stdbool.h>
#include"lex.yy.c"
#include<string.h>
void yyerror (char const *);
int mth2(int, int, int);
void mth3();
int mainn(char *);     
void scan(char *argv[]);                                      /* C declaration used in action*/
char err[55] = "Error";
extern int yylineno;
int a =-1;
int b =-1;
struct types{char id[50]; int value; int type;};
struct types st[50];
%}
%union{int number; char *string; } 
%token <number> NUMBER INTEGER
%token <number> NUM FLOAT_T
%token <string> IDENTIFIER
%type<number> arithm
%type<string> typeint
%type<string> typefloat
%type<string> typeboolean
%type<number> relationalexp
%token CONST STRING INCREMENT DECREMENT LE GE ASSIGNMENT_OP NE EQ
%token AND_OP OR_OP MULTASSIGN_OP DIVDASSIGN_OP MOD ADDASSIGN_OP SUBDASSIGN_OP  STATIC
%token CHAR INT FLOAT  VOID IF ELSE FOR TRUEA FALSEA BOOLEAN TRY CATCH THROW EXCEPTION EXIT_PROG SCANNER FUNCTION
%token IMPORT CLASS PACKAGE MAIN STRINGTYPE  PUBLIC PRINTING
%token LP RP LBRACE RBRACE LSQR RSQR LOOPEND
%token PLUS MINUS MULT DIV LESS_OP GREATER_OP COMMA COLON DOT  NOT SEMICOLON
%nonassoc EQUAL
%left PLUS MINUS MUL DIVIDE //left-associative, it indicates highest precedence
%right LESS GREATER  NE LESS_OR GREATER_OR DEQ 
%%
//**************RULES***********************//
program: statements
         ;
statements: packstmt importstmt blockstmts
            ;
            ;
class: IDENTIFIER
           ;
blockstmts: PUBLIC CLASS class LBRACE mainmthd method RBRACE //example-public class name{ psvm throw Exception
          ;
methodname:IDENTIFIER
          ;
mainmthd: PUBLIC STATIC VOID MAIN LP RP exception body
            ;
method: FUNCTION methodname LP RP body
        |
        ;
body: LBRACE stmts RBRACE
        ;
stmts: stmts stmt
    |
    ;
stmt:  nonblockstmt 
       |blockstmt 
       |SEMICOLON
       |methodname LP RP
       ;
nonblockstmt: variabledec SEMICOLON
	      |expr SEMICOLON
	      |singlestmt
              ;
singlestmt:printstmt
	     |scanstmt
	     |endstmt
             ;

blockstmt: if        
	|for
        | try
        ;

variabledec: datatype
	        |texttype
                ;
texttype: STRINGTYPE
	  |CHAR
           ;
datatype: INT typeint
    	  | FLOAT  typefloat
     | BOOLEAN  typeboolean
	  | STRINGTYPE typestring
           ;
typeboolean: IDENTIFIER EQUAL relationalexp {if(mainn($1)==-1) {b++; strcpy(st[b].id,$1); st[b].type =3; st[b].value = $3;} else { st[a].value = $3; } }
   | IDENTIFIER {if(mainn($1)==-1) {b++; strcpy(st[b].id,$1); st[b].type =3; } }
   ;
typestring: IDENTIFIER EQUAL STRING {printf("\tvalue\n"); printf("%s",yytext); }
            ;
typefloat: IDENTIFIER EQ arithm {if(mainn($1)==-1) {b++; strcpy(st[b].id,$1); st[b].type =1; st[b].value = $3;} }
      | typefloat COMMA IDENTIFIER {if(mainn($3)==-1) { b++; strcpy(st[b].id,$3);  st[b].type =1; } else {yyerror(err);}}
      | IDENTIFIER {if(mainn($1)==-1) {b++; strcpy(st[b].id,$1);  st[b].type =1; }}
       ;
typeint: IDENTIFIER EQ arithm {if(mainn($1)==-1){b++; strcpy(st[b].id,$1); st[b].type =0; st[b].value = $3;} }
         | typeint COMMA IDENTIFIER {if(mainn($3)==-1) {b++; strcpy(st[b].id,$3);  st[b].type =0; } else {yyerror(err);} }
         | IDENTIFIER {if(mainn($1)==-1) {b++; strcpy(st[b].id,$1); st[b].type =0; } }
         | IDENTIFIER EQ relationalexp    {a = mainn($1);  if(a==-1) {b++; strcpy(st[b].id,$1); st[b].type =3; st[b].value = $3;} else { st[a].value = $3; } }
         ;
expr: arithm
      | relationalexp
      ;
relationalexp: arithm LESS_OP arithm {$$ = mth2($1,$3,1);}
      	| arithm GREATER_OP arithm {$$ = mth2($1,$3,2);}
      	| arithm EQ arithm {$$ = mth2($1,$3,8);}
      	| arithm NE arithm {$$ = mth2($1,$3,4);}
      	| arithm LE arithm {$$ = mth2($1,$3,3);}
      	| arithm GE arithm {$$ = mth2($1,$3,7);}
	| arithm OR_OP arithm {$$ = mth2($1,$3,6);}
	| arithm AND_OP arithm {$$ = mth2($1,$3,5);}
      	| TRUEA {$$=1;}
      	| FALSEA {$$=0;}
        | IDENTIFIER EQUAL relationalexp {a = mainn($1);if(a!=-1) { st[a].value = $3; } else { yyerror(err);}}
        ;
arithm: arithm MUL arithm {$$ = $1 * $3;} // arithm * arithm
     | arithm DIVIDE arithm {$$ = $1 / $3;}// arithm / arithm
     | arithm PLUS arithm { $$ = $1 + $3;}// arithm + arithm
     | arithm MINUS arithm  {$$ = $1 - $3;}// arithm - arithm
     | IDENTIFIER {a = mainn($1); if(a!=-1) { $$ = st[a].value; } else {yyerror(err);} }
     | NUMBER {$$ =  $1; } 
     | FLOAT_T {$$=$1;}
     | INTEGER {$$ =  $1; }
     | IDENTIFIER INCREMENT {a = mainn($1); $$=st[a].value+1;}
     | IDENTIFIER DECREMENT {a = mainn($1); $$=st[a].value-1;}
     | INCREMENT IDENTIFIER {a = mainn($2); $$=st[a].value+1;}
     | DECREMENT IDENTIFIER {a = mainn($2); $$=st[a].value-1;}
     | IDENTIFIER EQUAL arithm {a = mainn($1); if(a!=-1) { st[a].value = $3; } else {yyerror(err);}}
     ;
if: IF LP relationalexp RP body   	 
    | IF LP relationalexp RP body elseif
    ;
elseif :  ELSE ifelse
          | elseif  ELSE ifelse
          ;
ifelse : IF LP relationalexp RP body
      	 | body
         ;
for: FOR LP forargs RP bodyloop
     ;
bodyloop: LBRACE loop RBRACE
          ;
loop: stmts loop_stmt
      ;
loop_stmt: LOOPEND LP RP SEMICOLON {
    int j=-1;
    printf("\nTime\tValue\t\n");
    for(j=0;j<=b;j++){    
	for(b=0;b<=st[j].value;b++){
		printf("%s\t%d\t\n",st[j].id,st[j].value);
      }
    }
printf("%s","LOOP");}

;
forargs: arg1 SEMICOLON arg2 SEMICOLON arg3
         ;
arg1: variabledec
      |expr
       ;
arg2: relationalexp
      ;
arg3: arithm
      ;
try: TRY LBRACE try2 RBRACE
     ;
try2: CATCH LBRACE catch RBRACE
      ;
catch: { void yyerror (char const *);}
       ;
exception: THROW EXCEPTION { void yyerror (char const *);}  
           ;
packstmt: PACKAGE IDENTIFIER SEMICOLON
          ;
importstmt: IMPORT IDENTIFIER DOT MULT SEMICOLON
            | IMPORT class SEMICOLON
            | IMPORT MULT SEMICOLON
            ;
printstmt: PRINTING LP RP SEMICOLON {mth3();}
           ;
scanstmt: SCANNER LP RP SEMICOLON {void scan(char *argv[]);}
          ;
endstmt: EXIT_PROG {exit(0);}
         ;
%%
/****************auxiliary routines*******************/
int main(){
yyparse();
return 1;
}
void yyerror (char const *err1){   // mainly used for throw exception
     printf("Error found at line -  %d\n" , yylineno); // For example : Error found at line 5
      fprintf (stderr, "%s\n", err1); // For example : syntax error
       
} 
int mth2(int a, int b, int k ){   //checking condition
switch(k){
case 1: if (a<b)
    	return 1;// return TRUEA
    	else
    	return 0;// return FALSEA
    	break;
case 2: return (a>b);
     	break;  	 
case 3: return (a<=b);
     	break;   	
case 4: return (a!=b);
     	break;
case 5: return (a&&b);
     	break;
case 6: return (a||b);
     	break;
case 7: return (a>=b);
     	break;    	 
case 8: return (a==b);
     	break;    	 
  }
}   
void mth3(){
    int j=-1;
    printf("name\tvalue\t\n");
    for(j=0;j<=b;j++){    
	printf("%s\t%d\t\n",st[j].id,st[j].value);		
  }
}
int mainn(char *pointer){
    int j=-1;
    for(j=0;j<b+1;j++){
     if(strcmp(pointer, st[j].id)==0){    
   	return j;
     }
    }
return -1;
}
void scan(char *argv[]){ // used in scanstmt
FILE *f1;
f1=fopen(argv[1],"w+");
yyout=f1;
fprintf(yyout,"%s",yytext);
} 	 
