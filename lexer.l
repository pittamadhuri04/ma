%{
#include "parser.tab.h"
#include <string.h>
#include <stdio.h>

// Declare yyerror if needed
void yyerror(const char *s);
%}

%%

[a-zA-Z_][a-zA-Z0-9_]*     { yylval.str = strdup(yytext); return IDENTIFIER; }
[0-9]+                     { yylval.str = strdup(yytext); return NUMBER; }

"="                        { return ASSIGN; }
"*"                        { return MUL; }
"+"                        { return ADD; }
"-"                        { return SUB; }
"("                        { return LPAREN; }
")"                        { return RPAREN; }
";"                        { return SEMICOLON; }

[ \t\n\r]+                 { /* skip whitespace */ }
.                          { yyerror("Unknown character"); return -1; }

%%

int yywrap(void) {
    return 1;
}
