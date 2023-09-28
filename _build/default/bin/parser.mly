%{
    open Ast
%}

%token <int> INT
%token <float> FLOAT
%token <bool> BOOL
%token <string> STRING
%token <char> CHAR
%token LPAREN
%token RPAREN
%token PLUS
%token MINUS
%token PRODUCT
%token DIVIDE
%token MOD
%token AND
%token OR
%token EOF

%left MINUS
%left PLUS
%left PRODUCT
%left MOD
%left DIVIDE
%left AND
%left OR

%start prog
%type <Ast.expr> prog

%%

prog:
    | e = expr; EOF { e }
    ;

expr:
    | i = INT { Int i }
    | i = BOOL { Bool i }
    | i = STRING { String i }
    | i = FLOAT { Float i }
    | i = CHAR { Char i }
    | e1 = expr; PLUS; e2 = expr { Binop (Add, e1, e2) }
    | e1 = expr; MINUS; e2 = expr { Binop (Sub, e1, e2) }
    | e1 = expr; PRODUCT; e2 = expr { Binop (Mul, e1, e2) }
    | e1 = expr; DIVIDE; e2 = expr { Binop (Div, e1, e2) }
    | e1 = expr; MOD; e2 = expr { Binop (Mod, e1, e2) }
    | e1 = expr; AND; e2 = expr { Binop (And, e1, e2) }
    | e1 = expr; OR; e2 = expr { Binop (Or, e1, e2) }
    | LPAREN; e = expr; RPAREN { e }
    ;

