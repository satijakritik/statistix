
(* The type of tokens. *)

type token = 
  | STRING of (string)
  | RPAREN
  | PRODUCT
  | PLUS
  | OR
  | MOD
  | MINUS
  | LPAREN
  | INT of (int)
  | FLOAT of (float)
  | EOF
  | DIVIDE
  | CHAR of (char)
  | BOOL of (bool)
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.expr)
