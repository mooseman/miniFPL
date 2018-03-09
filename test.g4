grammar test;
import testTokens;

prog :  (stmt)+ ; 

stmt
    : func_decl   
    | func_call 
    | assignment
    | logical_stmt 
    | comment
;

func_decl 
    :  func_name arg_list '=' equation EOL  
; 

func_call 
    :  func_name ( arg_list )
;

func_name 
    :  Identifier
; 

arg_list 
    :  arg ( arg )* 
; 

eqn_part 
    :  value
    |  variable 
    |  func_call 
;

equation
    :  eqn_part
    |  equation Op eqn_part
;

value 
    :  integer
    |  string 
    |  list 
; 
    
variable 
    :  Identifier
;



