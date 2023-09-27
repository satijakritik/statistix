open Ast

let parse (s : string) : expr =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast

let is_value (e : expr) : bool =
  match e with 
  | Int _ -> true
  | Binop _ -> false

let string_of_val (e : expr) : string = 
  match e with 
  | Int i -> string_of_int i
  | Binop _ -> failwith "Not a val"

let rec step (e : expr) : expr =
  match e with 
  | Int _ -> failwith "Cannot take a step"
  | Binop (binop, e1, e2) when is_value e1 && is_value e2 -> step_binop binop e1 e2
  | Binop (binop, e1, e2) when is_value e1 -> Binop (binop, e1, step e2)
  | Binop (binop, e1, e2) -> Binop (binop, step e1, e2)

and step_binop binop v1 v2 =
  match binop, v1, v2 with
  | Add, Int a, Int b -> Int (a + b)
  | _ -> failwith "Precondition violated"

let rec eval (e : expr) : expr = if is_value e then e else e |> step |> eval
let interpret (s : string) : string = s |> parse |> eval |> string_of_val

let () =
  while true do
    print_string ">> ";
    let line = read_line () in
    let result = interpret line in
    print_string result;
    print_newline ()
  done
