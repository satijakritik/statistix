type binop = 
  | Add
  | Mul
  | Div
  (* | Sub *)
  | And
  | Or

type expr = 
  | Int of int 
  | Float of float
  | Bool of bool
  | String of string
  | Binop of binop * expr * expr
