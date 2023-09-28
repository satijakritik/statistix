{
    open Parser
}

let int = '-'? ['0'-'9']+
let whitespace = [' ''\t']+
let bool = "true" | "false"
let float = '-'? ['0'-'9']+ '.' ['0'-'9']+
let string = ['a'-'z''A'-'Z']+

rule read =
    parse
    | whitespace { read lexbuf }
    | "(" { LBRACKET }
    | ")" { RBRACKET }
    | "+" { PLUS }
    | "*" { PRODUCT }
    | "/" { DIVIDE }
    | "&&" { AND }
    | "||" { OR }
    (* | "-" { MINUS } *)
    | int { INT ( int_of_string (Lexing.lexeme lexbuf)) }
    | float { FLOAT ( float_of_string (Lexing.lexeme lexbuf)) }
    | bool { BOOL ( bool_of_string (Lexing.lexeme lexbuf)) }
    | string { STRING (Lexing.lexeme lexbuf) }
    | eof { EOF }