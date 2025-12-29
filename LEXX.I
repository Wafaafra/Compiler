%{
  #include <stdio.h>
  #include <stdlib.h>
  #include "yacc.tab.h"
%}

%%
"somme"           { return SOMME; }
"moyenne"         { return MOYENNE; }
"variance"        { return VARIANCE; }
[0-9]+(\.[0-9]+)? { yylval.fval = atof(yytext); return NUM; } /* Changé f en fval */
"+"               { return '+'; }
"-"               { return '-'; }
"*"               { return '*'; }
"/"               { return '/'; }
","               { return ','; }
"("               { return '('; }
")"               { return ')'; }
"\n"              { return '\n'; }
[ \t]             { ; }
.                 { printf("Erreur lexicale: %s\n", yytext); }
%%

int yywrap(){ return 1; }
