open Interpreter

let rec loop env =
  print_string ">> ";
  let line = read_line () in
  let result = interpret env line in
  print_endline result;
  loop env

let () =
  let initial_env = Env.empty in
  (* loop initial_env *)
  match Array.length Sys.argv with
  | 1 ->  (* No command-line arguments, enter interactive mode *)
    print_endline "Interactive mode:";
    loop initial_env
  | 2 ->  (* Input expression provided as a command-line argument *)
    let input_expr = Sys.argv.(1) in
    let result = interpret initial_env input_expr in
    print_endline result
  | 3 ->  (* Input file provided as a command-line argument *)
    let input_file = Sys.argv.(2) in
    let result = interpret_file initial_env input_file in
    print_endline result
  | _ ->
    print_endline "Usage:";
    print_endline "  - Interactive mode: interpreter";
    print_endline "  - Provide an input expression: interpreter \"let x = 10 in x + 2\"";
    print_endline "  - Provide an input file: interpreter -f input.stlg";