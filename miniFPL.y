


%token IDENT CONSTANT STRING_LITERAL 
%token CASE OF OTHERWISE PRINT 

%start translation_unit
%%

expr:          simple_expr 
          |    complex_expr 
          |    ";" simple_expr  
          |    ";" complex_expr    
          ; 

terminal:     var_name 
          |   integer 
          |   float 
          |   char 
          |   string 
          |   bool
          |   list  
          ; 

list:         empty_list 
          |   filled_list  
          ; 

empty_list:  "[" "]"
          ; 

filled_list:  "[" terminal 
          |   filled_list ","  terminal "]"   
          ; 

simple_expr:    terminal
            |   "(" expr ")"
            |   var_name "=" simple_expr
            |   condition
            |   print_expr
            |   func_call 
            |   simple_expr "*" simple_expr
            |   simple_expr "/" simple_expr
            |   simple_expr "+" simple_expr
            |   simple_expr "-" simple_expr
            ;   

print_expr:     PRINT expr ";" 
            ; 

type:           INT 
            |   FLOAT 
            |   CHAR 
            |   STRING 
            |   BOOL 
            |   LIST  
            |   NONE 
            ;          

complex_expr:    case_expr 
             |   func_expr 
             ;    

case_expr:       case_head case_body 
             ; 

case_head:       CASE var_name OF "\n" 
             ; 

case_body:        case_line 
             |    case_body "\n" case_line  
             ; 

case_line:        in_value "->" out_value ";" 
             ;

in_value:        integer 
             |   float 
             |   char 
             |   string 
             |   bool
             |   list  
             |   OTHERWISE 
             ;  
             
out_value:       in_value 
             |   simple_expr
             ;   

func_call:      func_name func_vars ";" 
             ; 

func_vars:      varname 
             |  func_vars varname 
             ; 

func_expr:      func_decl func_body 
             ; 

func_decl:      func_name "::"  arg_types  "->" return_type ";"       
             ; 

arg_types:       type 
             |   arg_types "->" type  
             ;   

return_type:     type 
             ;  

func_body:      simple_expr  ";" 
             |  func_body simple_expr 
             |  case_expr  
             ; 

condition:      simple_expr
            |   condition "and" condition
            |   condition "or" condition
            |   "not" condition
            |   simple_expr ">"  simple_expr
            |   simple_expr ">=" simple_expr
            |   simple_expr "<"  simple_expr
            |   simple_expr "<=" simple_expr
            |   simple_expr "==" simple_expr
            |   simple_expr "!=" simple_expr
            ;  

var_name:       identifier 
            ; 

func_name:    identifier 
            ;  

identifier:    IDENT 
            ; 



