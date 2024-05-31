open Cmdliner
open Sea_caml

let validate_extension file =
  let ext = Filename.extension file in
  if ext = ".h" || ext = ".c" then ()
  else failwith "Expected C source file with .c or .h extension"

let replace_extension file new_extension =
  let base_name = Filename.chop_extension file in
  base_name ^ new_extension

let run_command cmd =
  if Sys.command cmd <> 0 then failwith ("Command failed: " ^ cmd)

(* driver *)
let preprocess src = 
  let _ = validate_extension src in
  let file = replace_extension src ".i" in
  let preprocess_cmd = Printf.sprintf "gcc -E -P %s -o %s" src file in
  let _ = run_command preprocess_cmd in
  file
  
(* Command-line options *)
(* let stage =
  let lex =
    let doc = "Run the lexer" in
    (Settings.Lex, Arg.info [ "lex" ] ~doc)
  in
  let parse =
    let doc = "Run the lexer and parser" in
    (Settings.Parse, Arg.info [ "parse" ] ~doc)
  in *)


let src_file = 
  Arg.(required & pos 0 (some non_dir_file) None & info [] ~docv:"files")

(* let cmd = ___

let main () = exit (Cmd.eval cmd)
let () = main () *)

let () = print_endline "Hello, world!"
