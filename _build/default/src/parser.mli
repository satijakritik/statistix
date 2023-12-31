
(* The type of tokens. *)

type token = 
  | WHILE
  | VAR of (string)
  | THEN
  | SUM
  | SEMICOLON
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
  | DONE
  | DO
  | DIVIDE
  | COMMA
  | BOOL of (bool)
  | AVG
  | ASSIGN
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.expr list)
