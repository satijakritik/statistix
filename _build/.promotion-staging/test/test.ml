
let%expect_test "Test Case 1" =
  let result =  "let x = 10 in x + 2" in
  Printf.printf "Result: %s\n" result;
  [%expect {| Result: let x = 10 in x + 2|}]