open Interpreter

let%expect_test "Test Case 1" =
let initial_env = Env.empty in
  let result =  interpret initial_env "let x = 10 in x + 2" in
  print_endline result;
  [%expect {| -:int = 12|}]

let%expect_test "Test Case 2" =
let initial_env = Env.empty in
  let result =  interpret initial_env "if 3>=10 then 2+5 else 20+30" in
  print_endline result;
  [%expect {| -:int = 50|}]