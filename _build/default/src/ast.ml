type unaryop = 
   | Neg | Not 
type binop = 
   | Add | Sub | Mul | Div | Mod | Leq | Geq | Eq | Neq | And | Or

type expr =
   | Var of string
   | Int of int
   | Float of float
   | Bool of bool
   | Unaryop of unaryop * expr
   | Binop of binop * expr * expr
   | Let of string * expr * expr
   | If of expr * expr * expr
   | While of expr * expr
  
