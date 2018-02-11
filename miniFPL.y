


%token IDENTIFIER CONSTANT STRING_LITERAL 
%token LE_OP GE_OP EQ_OP NE_OP DBL_COLON RIGHT_ARROW 
%token IF THEN ELSE IN CASE OF AND OR NOT OTHERWISE 

%start translation_unit
%%

primary_expression
	: IDENTIFIER
	| CONSTANT
	| STRING_LITERAL
	| '(' expression ')'
	;

postfix_expression
	: primary_expression 
    | postfix_expression '[' ']'
	| postfix_expression '[' expression ']'
    | postfix_expression '(' argument_expression_list ')' 
    ;  

argument_expression_list
	: assignment_expression
	| argument_expression_list ',' assignment_expression
	;

unary_expression
	: postfix_expression	
    ;

unary_operator
	| '*'
	| '+'
	| '-'	
	| '!'
    ;

multiplicative_expression
	: unary_expression
	| multiplicative_expression '*' unary_expression
    | multiplicative_expression '/' unary_expression
    ;

additive_expression
	: multiplicative_expression
	| additive_expression '+' multiplicative_expression
	| additive_expression '-' multiplicative_expression
    ; 

relational_expression
	: additive_expression
	| relational_expression '<' additive_expression
	| relational_expression '>' additive_expression
	| relational_expression LE_OP additive_expression
	| relational_expression GE_OP additive_expression
	;

equality_expression
	: relational_expression
	| equality_expression EQ_OP relational_expression
	| equality_expression NE_OP relational_expression
	;

and_expression
	: equality_expression
	| and_expression AND equality_expression
    ;  

or_expression
	: equality_expression
	| or_expression OR equality_expression
    ;  

assignment_expression
	: conditional_expression
	| unary_expression assignment_operator assignment_expression
	;

assignment_operator
	: '=' 
    ;  

expression
	: assignment_expression
	| expression ',' assignment_expression
	;

constant_expression
	: conditional_expression
    ;  

type 
    : INT 
    | FLOAT 
    | CHAR 
    | STRING 
    | BOOL 
    | LIST 
    ;           

function 
    : func_declaration func_body 
    ; 

func_declaration 
    : func_name DBL_COLON input_type RIGHT_ARROW return_type 
    ; 

func_name 
    : identifier
    ; 

input_type 
    : type 
    | input_type RIGHT_ARROW type
    ; 

return_type 
    : type 
    ;  

func_body 
    : stmt+ 
    ; 












%%
#include <stdio.h>
extern char yytext[];
extern int column;
void yyerror(char const *s)
{
	fflush(stdout);
	printf("\n%*s\n%*s\n", column, "^", column, s);
}













