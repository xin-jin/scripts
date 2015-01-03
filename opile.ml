open Core.Std
open Batteries

let print_status = function
  | Unix.WEXITED n -> printf "Compilation ended with exit code %d.\n" n
  | Unix.WSIGNALED n -> printf "Compilation was killed with signal number %d.\n" n
  | Unix.WSTOPPED n -> printf "Compilation was stopped with signal number %d.\n" n

let do_compile file () =
  let file_noetn = file |> Str.replace_first (Str.regexp "\\.ml$") "" in
  Unix.system @@ "ocamlfind ocamlopt -linkpkg -thread -package core,batteries -o "^file_noetn^".native "^file |> print_status

let command =
  Command.basic
    ~summary:"Compile with customized flags."
    ~readme:(fun () -> "Nothing fancy.")
    Command.Spec.(empty +> anon ("filename" %: string))
    do_compile

let () = Command.run ~version:"0.1" command
