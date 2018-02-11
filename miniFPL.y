


%token IDENTIFIER CONSTANT STRING_LITERAL 
%token LE_OP GE_OP EQ_OP NE_OP INC_OP DEC_OP 
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
	| INC_OP unary_expression
    | DEC_OP unary_expression
    ;

unary_operator
	| '*'
	| '+'
	| '-'	
	| '!'
    ;

cast_expression
    : unary_expression
    ; 

multiplicative_expression
	: cast_expression
	| multiplicative_expression '*' cast_expression
    | multiplicative_expression '/' cast_expression
    ;

additive_expression
	: multiplicative_expression
	| additive_expression '+' multiplicative_expression
	| additive_expression '-' multiplicative_expression
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













