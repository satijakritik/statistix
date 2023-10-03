let rec loop env =
  print_string ">> ";
  let line = read_line () in
  let result = Interpreter.interpret env line in
  print_endline result;
  loop env

let () =
  let open Interpreter in
  let initial_env = Env.empty in
  loop initial_env
