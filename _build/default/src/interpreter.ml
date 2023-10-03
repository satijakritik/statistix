open Ast
module Env = Map.Make (String)

let parse (s : string) : expr =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast

let is_value (e : expr) : bool =
  match e with
  | Var _ -> false
  | Int _ | Float _ | Bool _ -> true
  | Unaryop _ -> false
  | Binop _ -> false
  | Let (_, _, _) -> false
  | If (_, _, _) -> false
  | While(_, _) -> false
  | List _ -> true
(* | _ -> failwith "Not a match" *)

let string_of_expr expr = 
  match expr with
  | Int i -> "int = " ^ string_of_int i
  | Float i -> "float = " ^ string_of_float i
  | Bool i -> "bool = " ^ string_of_bool i
  | Unaryop _ -> failwith "Not a val"
  | Binop _ -> failwith "Not a val"
  | Let (_, _, _) -> failwith "Not a val"
  | If (_, _, _) -> failwith "Not a val"
  | While (_, _) -> failwith "Not a val"
  | Var _ -> failwith "can't infer type"
  | List _ -> failwith "can't infer type"
let rec list_to_string lst =
  match lst with
  | [] -> ""
  | [x] -> string_of_expr x
  | h :: t -> list_to_string t ^ "; " ^ string_of_expr h

let string_of_val (env : 'a Env.t) (e : expr) : string =
  match e with
  | Var x -> (
      match Env.find_opt x env with
      | Some _ ->
          "-:val = "
      | None -> failwith ("Variable not found: " ^ x))
  | Int i -> "-:int = " ^ string_of_int i
  | Float i -> "-:float = " ^ string_of_float i
  | Bool i -> "-:bool = " ^ string_of_bool i
  | Unaryop _ -> failwith "Not a val"
  | Binop _ -> failwith "Not a val"
  | Let (_, _, _) -> failwith "Not a val"
  | If (_, _, _) -> failwith "Not a val"
  | While (_, _) -> failwith "Not a val"
  | List lst -> list_to_string lst

let rec step (env : 'a Env.t) (e : expr) : expr =
  match e with
  | Int _ -> e
  | Float _ -> e
  | Bool _ -> e
  | List _ -> e
  | Unaryop (unaryop, e) when is_value e -> step_unaryop unaryop e
  | Unaryop (unaryop, e) -> Unaryop (unaryop, step env e)
  | Binop (binop, e1, e2) when is_value e1 && is_value e2 ->
      step_binop binop e1 e2
  | Binop (binop, e1, e2) when is_value e1 -> Binop (binop, e1, step env e2)
  | Binop (binop, e1, e2) -> Binop (binop, step env e1, e2)
  | Var x -> (
      match Env.find_opt x env with
      | Some v -> v 
      | None -> failwith ("Variable not found 1: " ^ x))
  | Let (x, e1, e2) when is_value e1 ->
      let new_env = Env.add x e1 env in
      step new_env e2 
  (* | Let (x, e1, e2) -> Let (x, step env e1, e2) *)
      (* let e1' = step env e1 in  (* Evaluate the bound expression before adding it to the environment *)
      let new_env = Env.add x e1' env in
      step new_env e2 *)

  | Let (x, e1, e2) ->
    let e1_value = step env e1 in
    let new_env = Env.add x e1_value env in
    step new_env e2
  | If (x, e1, e2) when is_value x -> 
    (
      match x with
      | Bool n -> if n = true then step env e1 else step env e2
      | _ -> failwith "Cannot go here"
    )
  | If (x, e1, e2) -> If (step env x, e1, e2)

  | While (condition, body) when is_value condition ->
    (
      match condition with
      | Bool true -> step env body
      | Bool false -> Bool false  (* Loop terminated *)
      | _ -> failwith "Condition in while loop must be a boolean"
    )
  | While (condition, body) -> While (step env condition, body)
  (* | List [] -> failwith "Empty list cannot be folded"
  | List (h :: t) ->
    (match h with
    | Int init ->
      let result = List.fold_left (fun acc x -> acc + x) init (List.map (fun e -> step env e) t) in
      Int result
    | _ -> failwith "Invalid initial value for fold_left"
    ) *)

and step_unaryop unaryop v =
  match (unaryop, v) with
  | Neg, Int a -> Int (-a)
  | Neg, Float a -> Float (-.a)
  | Not, Bool a -> Bool (not a)
  | Succ, Int a -> Int (a + 1)
  | Pred, Int a -> Int (a - 1)
  | _ -> failwith "Not a match"

and step_binop binop v1 v2 =
  match (binop, v1, v2) with
  | Add, Int a, Int b -> Int (a + b)
  | Sub, Int a, Int b -> Int (a - b)
  | Mul, Int a, Int b -> Int (a * b)
  | Div, Int a, Int b -> Int (a / b)
  | Mod, Int a, Int b -> Int (a mod b)
  | Leq, Int a, Int b -> Bool (a <= b)
  | Geq, Int a, Int b -> Bool (a >= b)
  | Eq, Int a, Int b -> Bool (a = b)
  | Neq, Int a, Int b -> Bool (a <> b)
  | Add, Float a, Float b -> Float (a +. b)
  | Sub, Float a, Float b -> Float (a -. b)
  | Mul, Float a, Float b -> Float (a *. b)
  | Div, Float a, Float b -> Float (a /. b)
  | And, Bool a, Bool b -> Bool (a && b)
  | Or, Bool a, Bool b -> Bool (a || b)
  | _ -> failwith "Unimplemented 1"

let rec eval (env : 'a Env.t) (e : expr) : expr =
  if is_value e then e else e |> step env |> eval env

let interpret (env : 'a Env.t) (s : string) : string =
  s |> parse |> eval env |> string_of_val env
