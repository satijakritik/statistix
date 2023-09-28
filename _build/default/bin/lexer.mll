{
    open Parser
}

(* let int = '-'? ['0'-'9']+ *)
let int = ['0'-'9']+
let whitespace = [' ''\t']+
let bool = "true" | "false"
let float = ['0'-'9']+ '.' ['0'-'9']+
let string = ['a'-'z''A'-'Z']+
let char = ['a'-'z''A'-'Z']

rule read =
    parse
    | whitespace { read lexbuf }
    | "(" { LPAREN }
    | ")" { RPAREN }
    | "+" { PLUS }
    | "*" { PRODUCT }
    | "/" { DIVIDE }
    | "%" { MOD }
    | "&&" { AND }
    | "||" { OR }
    | "-" { MINUS }
    | int { INT ( int_of_string (Lexing.lexeme lexbuf)) }
    | float { FLOAT ( float_of_string (Lexing.lexeme lexbuf)) }
    | bool { BOOL ( bool_of_string (Lexing.lexeme lexbuf)) }
    | char { CHAR ((Lexing.lexeme lexbuf).[0])}
    | string { STRING (Lexing.lexeme lexbuf) }
    | eof { EOF }