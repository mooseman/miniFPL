lexer grammar lambda; // note "lexer grammar"

// LETTER :  'LETTER' |  'letter' ;  


// other 
LPAREN : '(' ;
RPAREN : ')' ;

LETTER          : [a-z] ;  
NUMBER          : '-'? [1-9] [0-9]* ; 
WS              : [ \t\r\n]+ -> skip ; // toss out whitespace

