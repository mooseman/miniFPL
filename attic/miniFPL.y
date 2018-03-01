


%token INT FLOAT CHAR STRING BOOL LIST 


%%

program:        func_decl 
             ; 

func_decl:      func_name "::"  arg_types  "->" return_type ";"       
             ; 

func_name:      identifier 
            ;  

arg_types:       type 
             |   arg_types "->" type  
             ;   

return_type:     type 
             ;  

list:         empty_list 
          |   filled_list  
          ; 

empty_list:  "[" "]"
          ; 

filled_list:  "[" list_elements "]"   
          ; 

list_elements:  element 
             |  list_elements ',' element  
             ;

element:        type 
             ;

type:           char 
             |  integer 
             |  float 
             |  string 
             |  bool 
             |  list 
             ;           

identifier:     first_char 
            |   first_char other_chars   
            ; 

first_char:     '_' 
            |   LETTER 
            ; 

other_chars:    first_char 
            |   DIGIT other_chars 
            ;       

type:           INT 
            |   FLOAT 
            |   CHAR 
            |   STRING 
            |   BOOL 
            |   LIST  
            |   NONE 
            ;          


