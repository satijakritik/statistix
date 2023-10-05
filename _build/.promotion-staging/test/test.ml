open Interpreter

let%expect_test "Test: add" =
let initial_env = Env.empty in
  let result =  interpret initial_env "25+15" in
  print_endline result;
  [%expect.unreachable]
[@@expect.uncaught_exn {|
  (* CR expect_test_collector: This test expectation appears to contain a backtrace.
     This is strongly discouraged as backtraces are fragile.
     Please change this test to not include a backtrace. *)

  (Interpreter__Parser.MenhirBasics.Error)
  Raised at Interpreter__Parser.MenhirBasics._eRR in file "src/parser.ml" (inlined), line 8, characters 6-17
  Called from Interpreter__Parser._menhir_run_23 in file "src/parser.ml", line 1681, characters 10-17
  Called from Interpreter.interpret in file "src/interpreter.ml", line 103, characters 18-25
  Called from Test.(fun) in file "test/test.ml", line 5, characters 16-45
  Called from Expect_test_collector.Make.Instance_io.exec in file "collector/expect_test_collector.ml", line 234, characters 12-19 |}]

let%expect_test "Test: subtract" =
let initial_env = Env.empty in
  let result =  interpret initial_env "25-15" in
  print_endline result;
  [%expect.unreachable]
[@@expect.uncaught_exn {|
  (* CR expect_test_collector: This test expectation appears to contain a backtrace.
     This is strongly discouraged as backtraces are fragile.
     Please change this test to not include a backtrace. *)

  (Interpreter__Parser.MenhirBasics.Error)
  Raised at Interpreter__Parser.MenhirBasics._eRR in file "src/parser.ml" (inlined), line 8, characters 6-17
  Called from Interpreter__Parser._menhir_run_31 in file "src/parser.ml", line 1589, characters 10-17
  Called from Interpreter.interpret in file "src/interpreter.ml", line 103, characters 18-25
  Called from Test.(fun) in file "test/test.ml", line 11, characters 16-45
  Called from Expect_test_collector.Make.Instance_io.exec in file "collector/expect_test_collector.ml", line 234, characters 12-19 |}]

let%expect_test "Test: multiply" =
let initial_env = Env.empty in
  let result =  interpret initial_env "25*10" in
  print_endline result;
  [%expect.unreachable]
[@@expect.uncaught_exn {|
  (* CR expect_test_collector: This test expectation appears to contain a backtrace.
     This is strongly discouraged as backtraces are fragile.
     Please change this test to not include a backtrace. *)

  (Interpreter__Parser.MenhirBasics.Error)
  Raised at Interpreter__Parser.MenhirBasics._eRR in file "src/parser.ml" (inlined), line 8, characters 6-17
  Called from Interpreter__Parser._menhir_run_17 in file "src/parser.ml", line 1712, characters 10-17
  Called from Interpreter.interpret in file "src/interpreter.ml", line 103, characters 18-25
  Called from Test.(fun) in file "test/test.ml", line 17, characters 16-45
  Called from Expect_test_collector.Make.Instance_io.exec in file "collector/expect_test_collector.ml", line 234, characters 12-19 |}]

let%expect_test "Test: divide" =
let initial_env = Env.empty in
  let result =  interpret initial_env "30/15" in
  print_endline result;
  [%expect.unreachable]
[@@expect.uncaught_exn {|
  (* CR expect_test_collector: This test expectation appears to contain a backtrace.
     This is strongly discouraged as backtraces are fragile.
     Please change this test to not include a backtrace. *)

  (Interpreter__Parser.MenhirBasics.Error)
  Raised at Interpreter__Parser.MenhirBasics._eRR in file "src/parser.ml" (inlined), line 8, characters 6-17
  Called from Interpreter__Parser._menhir_run_27 in file "src/parser.ml", line 1638, characters 10-17
  Called from Interpreter.interpret in file "src/interpreter.ml", line 103, characters 18-25
  Called from Test.(fun) in file "test/test.ml", line 23, characters 16-45
  Called from Expect_test_collector.Make.Instance_io.exec in file "collector/expect_test_collector.ml", line 234, characters 12-19 |}]

let%expect_test "Test: bool" =
let initial_env = Env.empty in
  let result =  interpret initial_env "true && false" in
  print_endline result;
  [%expect.unreachable]
[@@expect.uncaught_exn {|
  (* CR expect_test_collector: This test expectation appears to contain a backtrace.
     This is strongly discouraged as backtraces are fragile.
     Please change this test to not include a backtrace. *)

  (Interpreter__Parser.MenhirBasics.Error)
  Raised at Interpreter__Parser.MenhirBasics._eRR in file "src/parser.ml" (inlined), line 8, characters 6-17
  Called from Interpreter__Parser._menhir_run_55 in file "src/parser.ml", line 675, characters 10-17
  Called from Interpreter.interpret in file "src/interpreter.ml", line 103, characters 18-25
  Called from Test.(fun) in file "test/test.ml", line 29, characters 16-53
  Called from Expect_test_collector.Make.Instance_io.exec in file "collector/expect_test_collector.ml", line 234, characters 12-19 |}]

let%expect_test "Test: let-1" =
let initial_env = Env.empty in
  let result =  interpret initial_env "let x = 10 in x + 2" in
  print_endline result;
  [%expect.unreachable]
[@@expect.uncaught_exn {|
  (* CR expect_test_collector: This test expectation appears to contain a backtrace.
     This is strongly discouraged as backtraces are fragile.
     Please change this test to not include a backtrace. *)

  (Interpreter__Parser.MenhirBasics.Error)
  Raised at Interpreter__Parser.MenhirBasics._eRR in file "src/parser.ml" (inlined), line 8, characters 6-17
  Called from Interpreter__Parser._menhir_run_23 in file "src/parser.ml", line 1681, characters 10-17
  Called from Interpreter.interpret in file "src/interpreter.ml", line 103, characters 18-25
  Called from Test.(fun) in file "test/test.ml", line 35, characters 16-59
  Called from Expect_test_collector.Make.Instance_io.exec in file "collector/expect_test_collector.ml", line 234, characters 12-19 |}]

let%expect_test "Test: let-2" =
let initial_env = Env.empty in
  let result =  interpret initial_env "let x = 5+2-8 in x + 10" in
  print_endline result;
  [%expect.unreachable]
[@@expect.uncaught_exn {|
  (* CR expect_test_collector: This test expectation appears to contain a backtrace.
     This is strongly discouraged as backtraces are fragile.
     Please change this test to not include a backtrace. *)

  (Interpreter__Parser.MenhirBasics.Error)
  Raised at Interpreter__Parser.MenhirBasics._eRR in file "src/parser.ml" (inlined), line 8, characters 6-17
  Called from Interpreter__Parser._menhir_run_23 in file "src/parser.ml", line 1681, characters 10-17
  Called from Interpreter.interpret in file "src/interpreter.ml", line 103, characters 18-25
  Called from Test.(fun) in file "test/test.ml", line 41, characters 16-63
  Called from Expect_test_collector.Make.Instance_io.exec in file "collector/expect_test_collector.ml", line 234, characters 12-19 |}]

(* let%expect_test "Test: let-3" =
let initial_env = Env.empty in
  let result =  interpret initial_env "let x = 10 in (let y = 20 in x + y)" in
  print_endline result;
  [%expect {| -:int = 30|}] *)

let%expect_test "Test: if-then-else" =
let initial_env = Env.empty in
  let result =  interpret initial_env "if 3>=10 then 2+5 else 20+30" in
  print_endline result;
  [%expect.unreachable]
[@@expect.uncaught_exn {|
  (* CR expect_test_collector: This test expectation appears to contain a backtrace.
     This is strongly discouraged as backtraces are fragile.
     Please change this test to not include a backtrace. *)

  (Interpreter__Parser.MenhirBasics.Error)
  Raised at Interpreter__Parser.MenhirBasics._eRR in file "src/parser.ml" (inlined), line 8, characters 6-17
  Called from Interpreter__Parser._menhir_run_23 in file "src/parser.ml", line 1681, characters 10-17
  Called from Interpreter.interpret in file "src/interpreter.ml", line 103, characters 18-25
  Called from Test.(fun) in file "test/test.ml", line 53, characters 16-68
  Called from Expect_test_collector.Make.Instance_io.exec in file "collector/expect_test_collector.ml", line 234, characters 12-19 |}]

let%expect_test "Test: while-1" =
let initial_env = Env.empty in
  let result =  interpret initial_env "while 1 <= 0 do 1+1" in
  print_endline result;
  [%expect.unreachable]
[@@expect.uncaught_exn {|
  (* CR expect_test_collector: This test expectation appears to contain a backtrace.
     This is strongly discouraged as backtraces are fragile.
     Please change this test to not include a backtrace. *)

  (Interpreter__Parser.MenhirBasics.Error)
  Raised at Interpreter__Parser.MenhirBasics._eRR in file "src/parser.ml" (inlined), line 8, characters 6-17
  Called from Interpreter__Parser._menhir_run_23 in file "src/parser.ml", line 1681, characters 10-17
  Called from Interpreter.interpret in file "src/interpreter.ml", line 103, characters 18-25
  Called from Test.(fun) in file "test/test.ml", line 59, characters 16-59
  Called from Expect_test_collector.Make.Instance_io.exec in file "collector/expect_test_collector.ml", line 234, characters 12-19 |}]

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