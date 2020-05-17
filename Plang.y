%{
int yylex();
void yyerror(const char *s);
%}

%token LP RP LBRACE RBRACE LSQR RSQR QUOT PLUS MINUS SIGN MULT MOD DIV SEMICOLON COMMA DOT INCREMENT DECREMENT IDENTIFIER LETTER CHARACTER INTEGER FLOAT BOOLEAN IF ELSE WHILE FOR INPUT OUTPUT SPACE COMMENT DIGIT ASSIGNMENT_OP OR_OP AND_OP XOR_OP  IF_THEN_OP EQUAL_OP LESSTHAN_OP GREATERTHAN_OP NOT_OP INTEGERTYPE BOOLEANTYPE FLOATTYPE VARIABLE LOWERCASE UPPERCASE RETURN START END TRY CATCH THROW EXCEPTION
%%

start: program;

program: START statements END; 

statements: statement
		|statement statements
		;
				
statement: if_statement 
		|loop 
		|function_decleration
		|function_call
		|decleration
		|assignment
		|input_statement 
		|output_statement
                |COMMENT
                |exception_stmt
                |exception
		;


if_statement: IF LP expression RP body
     		|if_statement ELSE body
		;

body: LBRACE statements RBRACE;

loop : for 
	|while
	;


while: WHILE LP expression RP body;


for : FOR LP assignment SEMICOLON expression SEMICOLON assignment RP body;

function_decleration: datatype IDENTIFIER LP variable_list_decleration RP LBRACE statements RETURN assignment_valid RBRACE ;


function_call: IDENTIFIER LP parameter_list RP 
		;
exception_stmt: TRY LP try_stmt RP;

try_stmt: CATCH LP catch_stmt RP;

catch_stmt: {void yyerror( char const *);} ;

exception: THROW EXCEPTION {void yyerror( char const *);} ;


decleration: variable_decleration
		|array_decleration
		; 

variable_list_decleration: variable_decleration
	|variable_list_decleration SEMICOLON variable_decleration
	;

variable_decleration: datatype parameter_list;

array_decleration: datatype LSQR RSQR IDENTIFIER;


datatype: INTEGERTYPE 
	|FLOATTYPE
	|BOOLEANTYPE
	;

parameter_list: parameter 
		|parameter COMMA parameter_list
		;

parameter: IDENTIFIER;



assignment: variable ASSIGNMENT_OP assignment_valid 
		|datatype variable ASSIGNMENT_OP assignment_valid
		|variable INCREMENT
		|variable DECREMENT
		;

assignment_valid: variable | expression;

variable: IDENTIFIER 
	|array 
	|function_call 
	|input_statement
	;

array: IDENTIFIER LSQR INTEGER RSQR;


expression : arithmetic_ex | logical_ex;

arithmetic_ex: arithmetic_valid 
		|arithmetic_ex arithmetic_op arithmetic_valid
		;

arithmetic_valid: INTEGER 
		|FLOAT 
		|DIGIT
		;

arithmetic_op: PLUS 
		|MINUS 
		|MULT 
		|DIV 
		|MOD
		;

logical_ex: BOOLEAN 
		|variable logical_op variable 
		|variable logical_op expression
		;

logical_op: OR_OP 
		|AND_OP 
		|XOR_OP 
		|IF_THEN_OP 
		|EQUAL_OP 
		|LESSTHAN_OP 
		|GREATERTHAN_OP 
		|NOT_OP
		;

input_statement: INPUT LP RP;
output_statement: OUTPUT LP RP;

%%
#include "lex.yy.c"
int main() { 
yyparse();
return 0;
}

