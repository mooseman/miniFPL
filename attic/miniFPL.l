

/*  miniFPL.l  */ 

digit			[0-9]
letter          [a-zA-Z_]


%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "y.tab.h"

void count(void);
%}

%%

[0-9]+      { 
             yylval = atoi(yytext); 
             return INTEGER;
            }  


[a-zA-Z_][a-zA-Z_][0-9]  { return IDENTIFIER;  } 
 
\"([^\\\"]|\\.)*\"       { return STRING_LITERAL; }  



"/*"			    { comment(); }
"//"[^\n]*          { /* double-slash comment */   }

";"                 { count();  return(';');   }
"->"                { count();  return("->"); }

[ \t\v\n\f]         { count(); }

%%

int yywrap(void)
{
	return 1;
}



void comment(void)
{
	char c, prev = 0;
  
	while ((c = input()) != 0)      /* (EOF maps to 0) */
	{
		if (c == '/' && prev == '*')
			return;
		prev = c;
	}
	error("unterminated comment");
}


int column = 0;

void count(void)
{
	int i;

	for (i = 0; yytext[i] != '\0'; i++)
		if (yytext[i] == '\n')
			column = 0;
		else if (yytext[i] == '\t')
			column += 8 - (column % 8);
		else
			column++;

	ECHO;
}




