open Batteries

let p_from = Sys.argv.(1) |> Int.of_string
let p_to = Sys.argv.(2) |> Int.of_string
let url = "http://projecteuler.net/problem="

let f l = let tmp = Unix.system @@ "wget -k -p -e robots=off "^url^(String.of_int l) in ()

let () =
  List.iter f @@ List.range p_from `To p_to;
  Sys.rename "projecteuler.net" ("Problems"^Sys.argv.(1)^"-"^Sys.argv.(2))
