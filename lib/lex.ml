open Batteries
open Tokens

let id_regexp = Str.regexp {|[a-zA-Z_]\w*\b|}
let const_regexp = Str.regexp {|[0-9]+\b|}

let id_to_token = function
  | "int" -> KWInt
  | "void" -> KWVoid
  | "return" -> KWReturn
  | i -> Identifier i

let rec lex_helper chars : Tokens.t list = 
  match chars with
  | [] -> []
  | '(' :: rem -> OpenParen :: lex_helper rem
  | ')' :: rem -> CloseParen :: lex_helper rem
  | '{' :: rem -> OpenBrace :: lex_helper rem
  | '}' :: rem -> CloseBrace :: lex_helper rem
  | ';' :: rem -> Semicolon :: lex_helper rem
  | c :: _ when Char.is_digit c -> lex_constant chars
  | _ -> lex_identifier chars

and lex_constant chars = 
  let input = String.implode chars in
  if Str.string_match const_regexp input 0 then
    let match_str = Str.matched_string input in
    let const_token = Constant (int_of_string match_str) in
    let remaining_str = Str.string_after input (Str.match_end ()) in
    const_token :: lex_helper (String.explode remaining_str)
  else
    failwith ("Lexer failure: input doesn't match constant regexp: " ^ input)

and lex_identifier chars = 
  let input = String.implode chars in
  (* find longest match *)
  if Str.string_match id_regexp input 0 then
    let match_str = Str.matched_string input in
    let token = id_to_token match_str in
    let remaining_str = Str.string_after input (Str.match_end ()) in
    token :: lex_helper (String.explode remaining_str)
  else
    failwith ("Lexer failure: input doesn't match identifier regexp: " ^ input)

let lex (input : string) = 
  let input = String.trim input in
  lex_helper (String.explode input)