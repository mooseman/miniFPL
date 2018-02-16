


%token IDENTIFIER CONSTANT STRING_LITERAL 
%token SEMI LE_OP GE_OP EQ_OP NE_OP DBL_COLON RIGHT_ARROW 
%token CASE OF OTHERWISE PRINT 

%start translation_unit
%%

expr      :=  simple_expr 
          |   ( ";" simple_expr )* 
          |   complex_expr 
          |   ( ";" complex_expr )*   
          ; 

terminal  :=  var_name 
          |   integer 
          |   float 
          |   char 
          |   string 
          |   bool
          |   list  
          ; 

list      :=   "[" ( terminal ("," terminal)* ) "]" 
          ; 

simple_expr :=  terminal
            |   "(" expr ")"
            |   var_name = simple_exp
            |   condition
            |   print_expr
            |   func_call 
            |   simple_expr "*" simple_exp
            |   simple_exp "/" simple_exp
            |   simple_exp "+" simple_exp
            |   simple_exp "-" simple_exp 
            ;   

print_expr  :=  PRINT expr ";" 
            ; 

type        :=  INT 
            |   FLOAT 
            |   CHAR 
            |   STRING 
            |   BOOL 
            |   LIST  
            |   NONE 
            ;          

complex_expr :=  case_expr 
             |   func_expr 
             ;    

case_expr    :=  case_head case_body 
             ; 

case_head    :=  CASE var_name OF "\n" 
             ; 

case_body    :=  ( case_line )+ 
             ; 

case_line    :=  in_value "->" out_value ";" 
             ;

in_value     :=  integer 
             |   float 
             |   char 
             |   string 
             |   bool
             |   list  
             |   OTHERWISE 
             ;  
             
out_value    :=  in_value 
             |   simple_expr
             ;   

func_call    :=  func_name ( var_name )*  ";" 
             ; 

func_expr    :=  func_decl func_body 
             ; 

func_decl    := func_name "::" ( arg_type )* "->" return_type ";"       
             ; 

arg_type     := type ( "->" type )* 
             ;   

return_type  := type 
             ;  

func_body    := ( simple_expr )+  ";" 
             |  case_expr  
             ; 

condition  :=   simple_exp
            |   condition "and" condition
            |   condition "or" condition
            |   "not" condition
            |   simple_exp ">"  simple_exp
            |   simple_exp ">=" simple_exp
            |   simple_exp "<"  simple_exp
            |   simple_exp "<=" simple_exp
            |   simple_exp "==" simple_exp
            |   simple_exp "!=" simple_exp




