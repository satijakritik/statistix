open Interpreter

let%expect_test "Test: add" =
let initial_env = Env.empty in
  let result =  interpret initial_env "25+15" in
  print_endline result;
  [%expect {| -:int = 40|}]

let%expect_test "Test: subtract" =
let initial_env = Env.empty in
  let result =  interpret initial_env "25-15" in
  print_endline result;
  [%expect {| -:int = 10|}]

let%expect_test "Test: multiply" =
let initial_env = Env.empty in
  let result =  interpret initial_env "25*10" in
  print_endline result;
  [%expect {| -:int = 250|}]

let%expect_test "Test: divide" =
let initial_env = Env.empty in
  let result =  interpret initial_env "30/15" in
  print_endline result;
  [%expect {| -:int = 2|}]

let%expect_test "Test: bool" =
let initial_env = Env.empty in
  let result =  interpret initial_env "true && false" in
  print_endline result;
  [%expect {| -:bool = false|}]

let%expect_test "Test: let" =
let initial_env = Env.empty in
  let result =  interpret initial_env "let x = 10 in x + 2" in
  print_endline result;
  [%expect {| -:int = 12|}]

let%expect_test "Test: if-then-else" =
let initial_env = Env.empty in
  let result =  interpret initial_env "if 3>=10 then 2+5 else 20+30" in
  print_endline result;
  [%expect {| -:int = 50|}]