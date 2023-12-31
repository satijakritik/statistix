open Ast

module Env = Map.Make(String)

type value =
  | VInt of int
  | VBool of bool
  | VFloat of float
  | VUnit


let string_of_value (v : value) : string =
  match v with
  | VInt i -> string_of_int i
  | VBool b -> string_of_bool b
  | VFloat f -> string_of_float f
  | _ -> "Unknown" 
  


let rec eval (env: value Env.t) (e : expr) : value =
  match e with
  | Var x -> (
      match Env.find_opt x env with
      | Some v -> v
      | None -> failwith ("Variable not found: " ^ x)
    )
  | Int i -> VInt i
  | Float f -> VFloat f
  | Bool b -> VBool b
  | Unaryop (unaryop, e) -> step_unaryop unaryop (eval env e)
  | Binop (binop, e1, e2) -> step_binop binop (eval env e1) (eval env e2)
  | Sum expr_list -> eval_sum env expr_list
  | Avg expr_list -> eval_avg env expr_list
  | Let (x, e1, e2) ->
      let value = eval env e1 in
      let new_env = Env.add x value env in
      eval new_env e2
  | If (cond, e1, e2) ->
      if bool_of_value (eval env cond) then
        eval env e1
      else
        eval env e2
  | While (cond, body) ->
    let rec loop () =
      match eval env cond with
      | VBool true ->
          ignore (eval env body);
          loop ()
      | VBool false -> VUnit
      | _ -> failwith "Condition must evaluate to a boolean"
    in
    loop ()
and eval_sum env expr_list =
  let values = List.map (eval env) expr_list in
  let rec sum acc value_list =
    match value_list with
    | [] -> acc
    | hd :: tl -> (
        match hd with
        | VInt n -> sum (acc + n) tl
        | _ -> failwith "SUM requires a list of integers"
      )
  in
  match values with
  | [] -> failwith "SUM function called with an empty list"
  | _ -> VInt (sum 0 values)

and eval_avg env expr_list =
  let values = List.map (eval env) expr_list in
  let rec sum acc value_list =
    match value_list with
    | [] -> acc
    | hd :: tl -> (
        match hd with
        | VInt n -> sum (acc + n) tl
        | _ -> failwith "AVG requires a list of integers"
      )
  in
  match values with
  | [] -> failwith "AVG function called with an empty list"
  | _ -> VInt (sum 0 values / List.length values)

and bool_of_value v =
  match v with
  | VBool b -> b
  | _ -> failwith "Not a boolean value"

and step_unaryop unaryop v =
  match unaryop, v with
  | Neg, VInt a -> VInt (-a)
  | Neg, VFloat a -> VFloat (-.a)
  | Not, VBool a -> VBool (not a)
  | _ -> failwith "Invalid unary operation"

and step_binop binop v1 v2 =
  match binop, v1, v2 with
  | Add, VInt a, VInt b -> VInt (a + b)
  | Sub, VInt a, VInt b -> VInt (a - b)
  | Mul, VInt a, VInt b -> VInt (a * b)
  | Div, VInt a, VInt b -> VInt (a / b)
  | Mod, VInt a, VInt b -> VInt (a mod b)
  | Leq, VInt a, VInt b -> VBool (a <= b)
  | Geq, VInt a, VInt b -> VBool (a >= b)
  | Eq, VInt a, VInt b -> VBool (a = b)
  | Neq, VInt a, VInt b -> VBool (a <> b)
  | And, VBool a, VBool b -> VBool (a && b)
  | Or, VBool a, VBool b -> VBool (a || b)
  | _ -> failwith "Invalid binary operation"

let parse (s : string) : expr list =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast

let interpret (env: value Env.t) (s : string) : string =
  let expr_list = parse s in
  let results = List.map (fun expr -> string_of_value (eval env expr)) expr_list in
  String.concat "\n" results

let interpret_file (env: 'a Env.t) (filename : string) : string =
  let read_file_as_string filename =
    try
      let channel = open_in filename in
      let file_length = in_channel_length channel in
      let file_contents = really_input_string channel file_length in
      close_in channel;
      file_contents
    with
    | Sys_error err ->
      Printf.eprintf "Error: %s\n" err;
      ""
  in
  let file_str = read_file_as_string filename in
  interpret env file_str

