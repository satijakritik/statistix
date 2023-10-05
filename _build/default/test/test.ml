open Interpreter

let%expect_test "Test: add" =
let initial_env = Env.empty in
  let result =  interpret initial_env "25+15;" in
  print_endline result;
  [%expect {|40|}]

let%expect_test "Test: subtract" =
let initial_env = Env.empty in
  let result =  interpret initial_env "25-15;" in
  print_endline result;
  [%expect {|10|}]

let%expect_test "Test: multiply" =
let initial_env = Env.empty in
  let result =  interpret initial_env "25*10;" in
  print_endline result;
  [%expect {|250|}]

let%expect_test "Test: divide" =
let initial_env = Env.empty in
  let result =  interpret initial_env "30/15;" in
  print_endline result;
  [%expect {|2|}]

let%expect_test "Test: bool" =
let initial_env = Env.empty in
  let result =  interpret initial_env "true && false;" in
  print_endline result;
  [%expect {|false|}]

let%expect_test "Test: let-1" =
let initial_env = Env.empty in
  let result =  interpret initial_env "let x = 10 in x + 2;" in
  print_endline result;
  [%expect {|12|}]

let%expect_test "Test: let-2" =
let initial_env = Env.empty in
  let result =  interpret initial_env "let x = 5+2-8 in x + 10;" in
  print_endline result;
  [%expect {|9|}]

let%expect_test "Test: let-3" =
let initial_env = Env.empty in
  let result =  interpret initial_env "let x = 10 in (let y = 20 in x + y);" in
  print_endline result;
  [%expect {|30|}]

let%expect_test "Test: if-then-else-1" =
let initial_env = Env.empty in
  let result =  interpret initial_env "if 3>=10 then 2+5 else 20+30;" in
  print_endline result;
  [%expect {|50|}]

let%expect_test "Test: if-then-else-2" =
let initial_env = Env.empty in
  let result =  interpret initial_env "let x = 10 in (if x >= 5 then 2+5 else 20+30);" in
  print_endline result;
  [%expect {|7|}]

(* let%expect_test "Test: while-1" =
let initial_env = Env.empty in
  let result =  interpret initial_env "while 1 <= 0 do 1+1" in
  print_endline result;
  [%expect {|false|}] *)

(* let%expect_test "Test: while-2" =
let initial_env = Env.empty in
  let result =  interpret initial_env "let x = 5 in (while x >= 0 do (pred x))" in
  print_endline result;
  [%expect {| -:int = 50|}] *)

(* let%expect_test "Test: lists-1" =
let initial_env = Env.empty in
  let result =  interpret initial_env "[1, 3, 5]" in
  print_endline result;
  [%expect {| int = 1; int = 3; int = 5|}]

let%expect_test "Test: lists-2" =
let initial_env = Env.empty in
  let result =  interpret initial_env "[false, true, true]" in
  print_endline result;
  [%expect {| bool = false; bool = true; bool = true|}] *)