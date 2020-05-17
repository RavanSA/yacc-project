
INTEGER [+-]?{DIGIT}+
FLOAT {INTEGER}\.{INTEGER}
BOOLEAN true|false
LP \(
RP \)
LBRACE \{
RBRACE \}
LSQR \[
RSQR \]
QUOT \"
PLUS \+
MINUS \-
SIGN [-+]?
MULT \*
MOD \%
SEMICOLON \;
COMMA	\,
DOT	\.
DIV \/
INCREMENT \+\+
DECREMENT \-\-
LOWERCASE [a-z]
UPPERCASE [A-Z]
IDENTIFIER {LOWERCASE}({LOWERCASE}|{UPPERCASE}|{DIGIT})*
IF If
ELSE Else
WHILE While
FOR For
INTEGERTYPE Int
BOOLEANTYPE Boolean
FLOATTYPE Float
RETURN Return
INPUT Input
OUTPUT Output
SPACE [ \t]+
COMMENT [##]+.*
DIGIT [0-9]
ASSIGNMENT_OP \=
OR_OP \|\|
AND_OP \&\&
XOR_OP x\|
IF_THEN_OP \=\>
EQUAL_OP \=\=
LESSTHAN_OP \<\<
GREATERTHAN_OP \>\>
NOT_OP \!
TRY Try
CATCH Catch
THROW Throw
EXCEPTION Exception
%%
{DIGIT}		return (DIGIT);	
{COMMENT}            return (COMMENT);
{ASSIGNMENT_OP}            return (ASSIGNMENT_OP);
{OR_OP}            return (OR_OP);
{AND_OP}            return (AND_OP);
{XOR_OP}            return (XOR_OP);
{IF_THEN_OP}            return (IF_THEN_OP);
{EQUAL_OP}            return (EQUAL_OP);
{LESSTHAN_OP}            return (LESSTHAN_OP);
{GREATERTHAN_OP}            return (GREATERTHAN_OP);
{NOT_OP}            return (NOT_OP);
{INTEGER}            return (INTEGER);
{FLOAT}            return (FLOAT);
{BOOLEAN}            return (BOOLEAN);
{LP}            return (LP);
{RP}            return (RP);
{LBRACE}            return (LBRACE);
{RBRACE}            return (RBRACE);
{LSQR}            return (LSQR);
{RSQR}            return (RSQR);
{QUOT}            return (QUOT);
{PLUS}            return (PLUS);
{MINUS}            return (MINUS);
{SIGN}            return (SIGN);
{MULT}            return (MULT);
{DIV} 				return (DIV);
{MOD}            return (MOD);
{SEMICOLON}            return (SEMICOLON);
{COMMA}            return (COMMA);
{DOT}            return (DOT);
{INCREMENT}            return (INCREMENT);
{DECREMENT}            return (DECREMENT);
{FOR}		return (FOR);
{WHILE}		return (WHILE);
{IDENTIFIER}            return (IDENTIFIER);
{IF} 		return (IF);
{ELSE} 	return (ELSE);
{INTEGERTYPE} return (INTEGERTYPE);
{BOOLEANTYPE} return (BOOLEANTYPE);
{FLOATTYPE} return (FLOATTYPE);
{RETURN} return (RETURN);
{INPUT} return (INPUT);
{OUTPUT} return (OUTPUT);
START return (START);
END return (END);
%% 

int yywrap() {
	return 1;
}



