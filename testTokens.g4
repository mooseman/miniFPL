

lexer grammar testTokens; // note "lexer grammar"

// operators
Op  : '*' 
    | '/' 
    | '+' 
    | '-' 
    | '^' 
;


// logical
RelOp : '!='
      | '=='  
      | '>=' 
      | '<=' 
      | '>' 
      | '<' 
;

// relational
AND : 'AND' | 'and' ;
OR  : 'OR' | 'or' ;
NOT : 'NOT' | 'not' ;

// other
COMMA  : ',' ;
LPAREN : '(' ;
RPAREN : ')' ;
EOL    : ( '\r'?'\n' ) ;  

// functions


// keywords
PRINT   : 'PRINT' | 'print' ;
INPUT   : 'INPUT' | 'input' ;
LET     : 'LET' | 'let' ;
REM     : 'REM' | 'rem' ;
IF      : 'IF' | 'if' ;
THEN    : 'THEN' | 'then' ;
ELSE    : 'ELSE' | 'else' ;
END     : 'END' | 'end';
FOR     : 'FOR' | 'for' ;
WHILE   : 'WHILE' | 'while' ;
REPEAT  : 'REPEAT' | 'repeat' ;
UNTIL   : 'UNTIL' | 'until' ;
STEP    : 'STEP' | 'step' ;
NEXT    : 'NEXT' | 'next' ;
TO      : 'TO' | 'to' ;
CONTINUE    : 'CONTINUE' | 'continue' ;
EXIT    : 'EXIT' | 'EXIT' ;

// comments
COMMENT : REM ~[\r\n]* ;

// literals
ID              : [a-zA-Z]+ ;  // match identifiers
INTEGER         : '-'? [1-9]+ [0-9]* 
FLOAT          : [0-9]+ ('.' [0-9]+)?;   // match floats
STRINGLITERAL   : '"' ~ ["\r\n]* '"' ;
DOLLAR          : '$' ;
NEWLINE         :'\r'? '\n' ;  // return newlines to parser (end-statement signal)
WS              : [ \t]+ -> skip ; // toss out whitespace
//NUMBER
//    : ('0' .. '9') + (('e' | 'E') NUMBER)*
//    ; 

