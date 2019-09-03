%option noyywrap
%{
    #include "new6.tab.h"

%}

%%
("1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"|"0") {yylval = atoi(yytext); return DIGIT;}
("+") {return PLUS;}
("-") {return MINUS;}
("*") {return MUL;}
\n {return EOL;}
%%