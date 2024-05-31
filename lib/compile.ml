open Batteries

let compile stage src_file =
  let source = File.with_file_in src_file IO.read_all in
  (* Lex source *)
  let tokens = Lex.lex source in
  if stage = Settings.Lex then ()
  else ()