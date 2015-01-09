open Batteries

let () =
  let foo = Unix.open_process_in "synclient -l | grep Touchpad" in
  let l = input_line foo in
  let len = String.length l in
  let t = (Char.code @@ l.[len-1])-48 in
  let command = "synclient Touchpadoff="^(String.of_int (1-t)) in
  let tmp = Unix.system @@ command in
  ()
