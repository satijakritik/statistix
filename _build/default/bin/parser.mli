
(* The type of tokens. *)

type token = 
  | WHILE
  | VAR of (string)
  | THEN
  | RPAREN
  | PRODUCT
  | PLUS
  | OR
  | NOT
  | NEQUALS
  | MOD
  | MINUS
  | LPAREN
  | LET
  | LEQUALS
  | INT of (int)
  | IN
  | IF
  | GEQUALS
  | FLOAT of (float)
  | EQUALS
  | EOF
  | ELSE
  | DO
  | DIVIDE
  | BOOL of (bool)
  | ASSIGN
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.expr)
