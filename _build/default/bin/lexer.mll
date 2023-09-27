{
    open Parser
}

let int = '-'? ['0'-'9']+

rule read =
    parse
    | "+" { PLUS }
    | int { INT ( int_of_string (Lexing.lexeme lexbuf)) }
    | eof { EOF }