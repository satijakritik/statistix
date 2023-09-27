open Ast

let parse (s : string) : expr =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast

let is_value (e : expr) : bool = match e with Int _ -> true
let string_of_val (e : expr) : string = match e with Int i -> string_of_int i

let step (e : expr) : expr =
  match e with Int _ -> failwith "Cannot take a step"

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
