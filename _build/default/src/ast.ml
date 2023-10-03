type unaryop = Neg | Not | Succ | Pred
type binop = Add | Mul | Div | Mod | Sub | Leq | Geq | Eq | Neq | And | Or

type expr =
  | Var of string
  | Int of int
  | Float of float
  | Bool of bool
  (* | String of string
     | Char of char *)
  | Binop of binop * expr * expr
  | Unaryop of unaryop * expr
  | Let of string * expr * expr
  | If of expr * expr * expr
  | While of expr * expr
  | List of expr list
