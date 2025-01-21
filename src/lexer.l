%{
#include "parser.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%option noyywrap

%%

"yojay"            { return ADD; }          // Addition
"hrasam"           { return SUB; }          // Subtraction
"gunam"            { return MUL; }          // Multiplication
"bhagam"           { return DIV; }          // Division
"adhikam"          { return GT; }           // Greater than
"nyunam"           { return LT; }           // Less than
"samanam"          { return EQ; }           // Equal to
"vyatyasam"        { return NEQ; }          // Not equal to
"nasti"            { return NOT; }          // Negation
"mithya"           { return FALSE; }        // False
"satyam"           { return TRUE; }         // True
"punaravrtti"      { return WHILE; }        // While loop
"paryantam"        { return FOR; }          // For loop
"vidhanam"         { return FUNCTION; }     // Function declaration
"pratyagamanam"    { return RETURN; }       // Return statement
"pradarshayati"    { return PRINT; }        // Print statement
"yadi"             { return IF; }           // If statement
"athava"           { return ELSE; }         // Else statement
"="                { return ASSIGN; }       // Assignment
[a-zA-Z_][a-zA-Z0-9_]* { yylval.sval = strdup(yytext); return IDENTIFIER; } // Variables
[0-9]+             { yylval.ival = atoi(yytext); return NUMBER; }           // Numbers
\"[^\"]*\"         { yylval.sval = strdup(yytext); return STRING; }         // Strings
"//".*             { /* Ignore single-line comments */ }
[ \t\n]+           { /* Ignore whitespace */ }
.                  { return yytext[0]; }     // Other single characters

%%
