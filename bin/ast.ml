type binop = 
  | Add
  | Mul
  | Div
  | Mod
  | Sub
  | And
  | Or

type expr = 
  | Int of int 
  | Float of float
  | Bool of bool
  | String of string
  | Char of char
  | Binop of binop * expr * expr
