
(* The type of tokens. *)

type token = 
  | WHILE
  | VAR of (string)
  | THEN
  | SUCC
  | RPAREN
  | RBRACKET
  | PRODUCT
  | PRED
  | PLUS
  | OR
  | NOT
  | NEQUALS
  | MOD
  | MINUS
  | LPAREN
  | LET
  | LEQUALS
  | LBRACKET
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
  | COMMA
  | BOOL of (bool)
  | ASSIGN
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.expr)
