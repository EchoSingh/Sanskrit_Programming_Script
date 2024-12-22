%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern int yylex();
extern int yyparse();
void yyerror(const char *s);

typedef struct {
    char *name;
    int value;
} Variable;

Variable variables[100];
int var_count = 0;

int get_variable(const char *name) {
    for (int i = 0; i < var_count; i++) {
        if (strcmp(variables[i].name, name) == 0)
            return variables[i].value;
    }
    yyerror("Undefined variable");
    return 0;
}

void set_variable(const char *name, int value) {
    for (int i = 0; i < var_count; i++) {
        if (strcmp(variables[i].name, name) == 0) {
            variables[i].value = value;
            return;
        }
    }
    variables[var_count].name = strdup(name);
    variables[var_count].value = value;
    var_count++;
}
%}

%union {
    int ival;      // For numbers and boolean values
    char *sval;    // For strings and identifiers
}

%token <ival> ADD SUB MUL DIV GT LT EQ NEQ NOT
%token <ival> WHILE FOR TRUE FALSE NUMBER
%token <sval> IDENTIFIER STRING FUNCTION RETURN
%token PRINT IF ELSE ASSIGN

%type <ival> expr
%type <sval> statement

%left ADD SUB
%left MUL DIV

%%

program:
    statement_list
    ;

statement_list:
    statement_list statement
    | statement
    ;

statement:
    IDENTIFIER ASSIGN expr { set_variable($1, $3); free($1); }
    | PRINT '(' STRING ')' { printf("%s\n", $3); free($3); }
    | PRINT '(' expr ')' { printf("उत्तरम्: %d\n", $3); }
    ;

expr:
    expr ADD expr { $$ = $1 + $3; }
    | expr SUB expr { $$ = $1 - $3; }
    | expr MUL expr { $$ = $1 * $3; }
    | expr DIV expr { $$ = $1 / $3; }
    | NUMBER { $$ = $1; }
    | IDENTIFIER { $$ = get_variable($1); free($1); }
    ;

%%

int main() {
    printf("कार्यक्रम आरंभ: अपना कोड लिखें।\n");
    return yyparse();
}

void yyerror(const char *s) {
    fprintf(stderr, "त्रुटि: %s\n", s);
}
