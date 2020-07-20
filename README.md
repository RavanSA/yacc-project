•	Project Group Members - Ravan Sadigli(20160807005)
•	Name of the programming language : “Plang”
•	Grammar in BNF form :
<program> ::= <statements>
<statements> ::=<packstmt>  <importstmt>  <blockstmts>
<class> ::=identifier
<blockstmts> ::= <class> <mainmthd> <exception> <method>
<methodname>::=identifier
<mainmthd> ::= <exception> <body>
<method> ::=<methodname> <body>
<body> ::=  <statement>
<stmts> ::= <stmts> <stmt>
<stmt>::=<nonblockstmt>|<blockstmt>|<method_name>
<nonblock >::=<variabledec>|<expr>| <singlestmt>
<singlestmt> ::= <printstmt>|<scanstmt>|<endstmt>
<blockstmt> ::= <if> | <for>| <try>
<variabledec> ::= <datatype> | <texttype>
<texttype>:: = <String> <typestrinf>| <char> <typechar>
<datatype>::= <integer> < typeint>|<float> <typefloat>| <boolean> <typeboolean>
<typeboolean>::=identifier | identifier =  <relationexp>
<typestring>::= identifier = string
<typechar>::= identifier = char
<typeint>::= identifier =  <arithm>| identifier = <relational>
<typefloat>::= identifer = <arithm >|identifier , identifier
<expr>::=<arithm ><|relationexp>
<if> ::= if <booleanop> <body>
<elseif> ::= else <ifelse>
<ifelse> ::= if <booleanop> <body>| <body>
<for> ::= for ( <loopargument> ) <bodyloop>
<bodyloop> ::= ( <loop> ) 
<loop> ::= <stmts> <loopstmt>
<loopstmt> ::= loopend ( ) ;
<loopargument> ::=  <loopargument1> ; <loopargument2> ; <loopargument3>
<loopargument1> ::= <variabledec> | <expr> 
<loopargument2> ::= <relationexp>
<loopargument3> :: = <arithm>
<try> ::= try (<try2>)
<try2> ::= catch ( <catch2> ) 
<exception>::=throw exception
<packstmt> ::= package identifier ;
<importstmt> ::= import identifier . *;| import identifier.*
<printstmt> ::= printing ();
<scanstmt> ::= scanner ();
<endstmt> ::= exit_success;
<comment>::= // | /*--------*/
<integer> ::=  <int>  <sign>  <int> | <int>  <relationsign >  <int> | <digit>
<float> ::= <float> <sign> <float> | <float>  <relationsign>  <flot> | <int>.<digit>
 <boolean> ::= true | false 
<String>::=<letter> | <digit> | <symbol>
<char> ::=<charachter>
 <charachter> ::= <letter> | <digit> 
 <booleanop>::=<expr>  and  <expr> | <expr> or <expr> 
 <relationsign> ::= ++ |-- |< | <= | > | >= | != | ==
<sign>::= + | - | * | / | =
 <digit> ::=0 | 1 |....| 9 
   
  
•	Explaining to the syntax of the language
Plang is designed as a simple programming language. The syntax of the language looks like java. The beginning of Pl begins with the package and import. Then, we need to set the name of the class, which starts with the public class or class as in java, and it followed by the main method. 
There are four primitive types in the Plang. These are int, String, float, and boolean. Its purposes are described below:
1.	int – it stores integer
2.	String – it holds sequence of element
3.	float - it holds decimal numbers
4.	boolean – it stores only two possible values, true or false. 
Also, conditional statements are available in this programming language. The syntax is the same as in Java (basic if and if-else statements).
There are func keywords used for the defining method. Methods are defined outside the main method, and we can call the method inside the smain method. And, we can use the loop using the for keyword. To end the loop, we need to use the endloop keyword.
Comments are also similar to java. And, the data in the comments are ignored by the compiler.
1.	For one line, we need to use // 
2.	For multi line, we need to /*....*/
It also has methods like scan and printing. And, we can stop the execution using the exit keyword. And, the example of the plang can be found in the file called example.plang.



