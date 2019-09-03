%option noyywrap
%{
#include "new5.tab.h"
%}

%%
" " {}
\n {}
"double" {return DOUBLE; }
("_"|"m"|"a"|"i"|"n")("_"|"m"|"a"|"i"|"n"|"0"|"1")* { return ID; }
"(" { return LB;}
")" { return RB;}
"{" { return LP;}
"int" { return INT;}
"=" { return ASSIGN;}
("0"|"1"|"2"|"3"|"4"|"5"|"5"|"6"|"7"|"8"|"9")+ { return NUM;}
";" { return SEMI;}
"if" { return IF;}
"==" { return EQUAL;}
"}" { return RP;}
%%

// int main()
// {
//     yylex();    

//     return 0;

// //     "double" {printf("DOUBLE\n"); return DOUBLE; }
// // ("_"|"m"|"a"|"i"|"n")("_"|"m"|"a"|"i"|"n"|"0"|"1")* {printf("ID\n"); return ID; }
// // "(" { printf("LB\n"); return LB;}
// // ")" { printf("RB\n"); return RB;}
// // "{" {printf("LP\n"); return LP;}
// // "int" {printf("INT\n"); return INT;}
// // "=" {printf("ASSIGN\n"); return ASSIGN;}
// // ("0"|"1"|"2"|"3"|"4"|"5"|"5"|"6"|"7"|"8"|"9")+ {printf("DIGIT\n"); return DIGIT;}
// // ";" {printf("SEMI\n"); return SEMI;}
// // "if" {printf("IF\n"); return IF;}
// // "==" {printf("EQUAL\n"); return EQUAL;}
// // "}" {printf("RP\n"); return RP;}

// }