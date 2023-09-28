
(* The type of tokens. *)

type token = 
  | STRING of (string)
  | RBRACKET
  | PRODUCT
  | PLUS
  | OR
  | LBRACKET
  | INT of (int)
  | FLOAT of (float)
  | EOF
  | DIVIDE
  | BOOL of (bool)
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.expr)
