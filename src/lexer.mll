{
    open Parser
}

(* let int = '-'? ['0'-'9']+ *)
let int = ['0'-'9']+
let whitespace = [' ''\t''\r''\n']+
let bool = "true" | "false"
let float = ['0'-'9']+ '.' ['0'-'9']+
let string = ['a'-'z''A'-'Z']+
let char = ['a'-'z''A'-'Z']
let var = ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9']*

rule read =
    parse
    | int { INT ( int_of_string (Lexing.lexeme lexbuf)) }
    | float { FLOAT ( float_of_string (Lexing.lexeme lexbuf)) }
    | bool { BOOL ( bool_of_string (Lexing.lexeme lexbuf)) }
    | whitespace { read lexbuf }

    | "succ" { SUCC } | "pred" { PRED }
    | "(" { LPAREN } | ")" { RPAREN }
    | "+" { PLUS } | "*" { PRODUCT } | "/" { DIVIDE } | "%" { MOD } | "-" { MINUS }
    | "&&" { AND } | "||" { OR } | "~" { NOT }
    
    | "<=" { LEQUALS } | ">=" { GEQUALS } | "==" { EQUALS } | "!=" { NEQUALS }

    | "if" { IF } | "then" { THEN } | "else" { ELSE }
    | "let" { LET } | "in" { IN } | "=" { ASSIGN }
    | "while" { WHILE } | "do" { DO }
    | "[" { LBRACKET }| "]" { RBRACKET }
    (* | ";" { SEMICOLON } *)
    | "," { COMMA }
    | var { VAR (Lexing.lexeme lexbuf) }
    
    | eof { EOF }