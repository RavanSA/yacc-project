Ravan Sadigli
Name of the pl: Plang
I changed all files from the old lex repo including Plang.l

BNF grammar
<program> -> START <statements> END 
<statements -> <statement> 
| <statement><statements> 
<statement> -> <if_statement> 
| <loop> 
|<function_decleration> 
|<function_call> 
|<decleration> 
|<expression> 
|<input_statement> 
|<output_statement> 
<if_statement> -> IF (<expression>) {<statements>} 
| IF (<expression>) <body> ELSE <body> 
<body> -> {<statements>} 
<loop> -> <for> 
|<while> 
<while> -> WHILE (< expression>) <body> 
<for> -> FOR (<assignment>; <expression>; <expression>) <body> 
<function_decleration> -> <datatype> <identifier>(<variable_list_decleration>) {<statements> RETURN <assignment_valid>} 
<function_call> -> <indentifier> (<paramater_list>) 
<decleration> -> <variable_decleration> 
|<array_decleration> 
<variable_list_decleration> -> <variable_decleration> 
|<variable_list_decleration> ; <variable_decleration> 
<variable_decleration> -> <datatpye> <parameter_list> 
<array_decleration> -> <datatype> [ ] <identifier> 
<identifier> -> <lowercase> 
|<lowercase><valids> 
<valids> -> <valid> 
|<valid><valids> 
<valid> -> <lowercase> 
|<uppercase> 
|<digit> 
<datatype> -> Int 
| Float 
| Boolean 
<parameter_list> -> <parameter> 
| <parameter> , <parameter_list> 
<parameter> -> <identifier> 
<assignment> -> <variable> = <assignment_valid> 
|<datatype> <variable> = <assignment_valid> 
|<variable>++ 
|<variable>-- 
<assignment_valid> -> <variable> 
|<expression> 
<variable> -> <identifier> 
|<array> 
|<function_call> 
|<input_statement> 
<array> -> <identifier> [<integer>] 
<expression> -> <arithmetic_ex> 
|<logical_ex> 
<arithmetic_ex> -> <arithmetic_valid> 
|<arithmetic_ex> <arithmetic_op> <arithmetic_valid> 
<arithmetic_valid> -> <integer> 
|<float> 
|<digit> 
<arithmetic_op>: -> + 
|- 
|* 
|/ |% 
<logical_ex> -> <boolean> 
| <variable> <logical_op> <variable> 
| <variable> <logical_op> <expression> 
<logical_op> -> < or_op> 
|<and_op> 
|<xor_op> 
|<if_then_op> 
|<equal_op> 
|< lessthan_op> 
|<greaterthan_op> 
|<not_op> 
<input_statement> -> Input ( ) 
<output_statement> -> Output ( ) 
<digit> -> 0|1|2|3|4|5|6|7|8|9 
<uppercase> -> A | B | C | D | E|F|G|H|I|J|K|L|M|N|O| P|Q|R|S|T|U|V|W|X|Y|Z <lowercase> -> a| b | c | d | e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z 
<boolean> -> true|false 
<integer> -> <digit> 
| <digit> <integer> 
<floating> -> <integer> . <integer> 
<or_op> -> || 
<and_op> -> && 
<xor_op> -> x| 
<if_then_op> -> => 
<equal_op> -> == 
<lessthan_op> -> << 
<greaterthan_op> -> >> 
<not_op> -> ! 
<sign> -> - | + 
<increment_op> -> ++ 
<decrement_op> -> -- 
<comment> -> / * <statements> * /
