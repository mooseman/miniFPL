grammar miniFPL;
import miniFPLExpression, miniFPLTokens;

prog: block EOF;

statement
    : func_decl
    | print_stmt  
    | COMMENT;

block
    : (statement (NEWLINE+ | EOF))*
;

func_decl
    : func_name "::"  arg_types  "->" return_type ";"     
;




