%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s) { fprintf(stderr, "Error: %s\n", s); }
int yylex(void);
%}

%union {
    char* str;
}

%token <str> IDENTIFIER NUMBER
%token ASSIGN MUL ADD SUB SEMICOLON LPAREN RPAREN

%type <str> stmt id1 id2 id3 id4

%start program

%%

program:
    stmt SEMICOLON {
        printf("Custom instruction: %s\n", $1);
        free($1);
    }
    ;

stmt:
    id1 ASSIGN id2 MUL id3 SUB id4 {
        char *result = malloc(100);
        snprintf(result, 100, "msub %s, %s, %s, %s", $id1, $id2, $id3, $id4);
        $$ = result;
    }
    ;

id1: IDENTIFIER { $$ = $1; };
id2: IDENTIFIER { $$ = $1; };
id3: IDENTIFIER { $$ = $1; };
id4: IDENTIFIER { $$ = $1; };

%%

int main() {
    return yyparse();
}
