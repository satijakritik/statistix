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

let%expect_test "Test: let-1" =
let initial_env = Env.empty in
  let result =  interpret initial_env "let x = 10 in x + 2" in
  print_endline result;
  [%expect {| -:int = 12|}]

let%expect_test "Test: let-2" =
let initial_env = Env.empty in
  let result =  interpret initial_env "let x = 5+2-8 in x + 10" in
  print_endline result;
  [%expect {| -:int = 9|}]

let%expect_test "Test: let-3" =
let initial_env = Env.empty in
  let result =  interpret initial_env "let x = 10 in (let y = 20 in x + y)" in
  print_endline result;
  [%expect.unreachable]
[@@expect.uncaught_exn {|
  (* CR expect_test_collector: This test expectation appears to contain a backtrace.
     This is strongly discouraged as backtraces are fragile.
     Please change this test to not include a backtrace. *)

  (Failure "Variable not found 1: y")
  Raised at Stdlib.failwith in file "stdlib.ml", line 29, characters 17-33
  Called from Interpreter.step in file "src/interpreter.ml", line 66, characters 64-75
  Called from Interpreter.eval in file "src/interpreter.ml", line 138, characters 28-41
  Called from Interpreter.interpret in file "src/interpreter.ml", line 141, characters 2-24
  Called from Test.(fun) in file "test/test.ml", line 47, characters 16-75
  Called from Expect_test_collector.Make.Instance_io.exec in file "collector/expect_test_collector.ml", line 234, characters 12-19 |}]

let%expect_test "Test: if-then-else" =
let initial_env = Env.empty in
  let result =  interpret initial_env "if 3>=10 then 2+5 else 20+30" in
  print_endline result;
  [%expect {| -:int = 50|}]

let%expect_test "Test: while-1" =
let initial_env = Env.empty in
  let result =  interpret initial_env "while 1 <= 0 do 1+1" in
  print_endline result;
  [%expect {| -:bool = false|}]

(* let%expect_test "Test: while-2" =
let initial_env = Env.empty in
  let result =  interpret initial_env "let x = 5 in (while x >= 0 do (pred x))" in
  print_endline result;
  [%expect {| -:int = 50|}] *)

let%expect_test "Test: lists-1" =
let initial_env = Env.empty in
  let result =  interpret initial_env "[1, 3, 5]" in
  print_endline result;
  [%expect {| int = 1; int = 3; int = 5|}]