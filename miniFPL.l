

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
"/*"			    { comment(); }
"//"[^\n]*          { /* double-slash comment */   }

"case"              { count();  return(CASE);      } 
"of"                { count();  return(OF);        }  
"otherwise"         { count();  return(OTHERWISE); }  
"print"             { count();  return(PRINT);     }  

"<="			    { count();  return(LE);    }
">="		        { count();  return(GE);    }
"=="			    { count();  return(EQ);    }
"!="			    { count();  return(NE);    }
";"                 { count();  return(';');   }

"::"                { count();  return(DBL_COLON);   } 
"->"                { count();  return(RIGHT_ARROW); } 
"="                 { count();  return('='); }
"<"			        { count();  return('<'); }
">"                 { count();  return('>'); }
"+"                 { count();  return('+'); }
"-"                 { count();  return('-'); }
"*"                 { count();  return('*'); }
"/"                 { count();  return('/'); }
"^"                 { count();  return('^'); }

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




