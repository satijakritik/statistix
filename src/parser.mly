%{
    open Ast
%}

%token <int> INT
%token <float> FLOAT
%token <bool> BOOL
%token <string> VAR

%token LPAREN RPAREN
%token PLUS MINUS PRODUCT DIVIDE MOD
%token LEQUALS GEQUALS EQUALS NEQUALS
%token LET ASSIGN IN
%token IF THEN ELSE
%token WHILE DO
%token AND OR NOT

%token EOF

%left LEQUALS GEQUALS EQUALS NEQUALS
%left MINUS PLUS PRODUCT MOD DIVIDE
%left AND OR NOT
%nonassoc UMINUS

%start prog
%type <Ast.expr> prog

%%

prog:
    | expr EOF { $1 }
    ;

expr:
    | n = INT { Int n }
    | n = BOOL { Bool n }
    | n = VAR { Var n }
    | n = FLOAT { Float n }
    | MINUS expr %prec UMINUS { Unaryop (Neg, $2) }

    | expr PLUS expr { Binop (Add, $1, $3) }
    | expr MINUS expr { Binop (Sub, $1, $3) }
    | expr PRODUCT expr { Binop (Mul, $1, $3) }
    | expr DIVIDE expr { Binop (Div, $1, $3) }
    | expr MOD expr { Binop (Mod, $1, $3) }

    | expr LEQUALS expr { Binop (Leq, $1, $3) }
    | expr GEQUALS expr { Binop (Geq, $1, $3) }
    | expr EQUALS expr { Binop (Eq, $1, $3) }
    | expr NEQUALS expr { Binop (Neq, $1, $3) }
    
    | expr AND expr { Binop (And, $1, $3) }
    | expr OR expr { Binop (Or, $1, $3) }
    | NOT expr { Unaryop (Not, $2) }

    | LPAREN expr RPAREN { $2 }
    | LET VAR ASSIGN expr IN expr { Let ($2, $4, $6) } 
    | IF expr THEN expr ELSE expr { If ($2, $4, $6) }
    | WHILE expr DO expr { While ($2, $4) }
    
    ;