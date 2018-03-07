grammar lambda;
import lambdaTokens;

stmt 
   :  LPAREN lambda_stmt arrow expr RPAREN   
; 

LPAREN 
   :  '(' 
;

lambda_stmt 
   :  (BACKSLASH || LETTER) ( LETTER )*
; 

BACKSLASH
   :   '\\'  
; 

RPAREN 
   :   ')' 
; 

arrow
   :  '->' 
; 

expr 
   : LETTER 
   | NUMBER 
   | expr OP expr 
; 

OP :   '+' 
   |   '-' 
   |   '*' 
   |   '/' 
   |   '^' 
; 




