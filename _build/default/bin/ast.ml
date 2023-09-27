type binop = Add
type expr = Int of int | Binop of binop * expr * expr
