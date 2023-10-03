type unaryop = Neg
type binop = Add | Mul | Div | Mod | Sub | Leq | Geq | Eq | Neq | And | Or

type expr =
  | Var of string
  | Int of int
  | Float of float
  | Bool of bool
  (* | Id of string *)
  (* | String of string
     | Char of char *)
  | Binop of binop * expr * expr
  | Unaryop of unaryop * expr
  (* | Let of string * expr * expr *)
  | Let of string * expr * expr
