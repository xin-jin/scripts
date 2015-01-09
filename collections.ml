(* How to get terminal output *)

let foo = Unix.open_process_in "ls" in
try
  while true do
    let l = input_line foo in
    Printf.printf "%s\n" l
  done
with End_of_file -> ()
