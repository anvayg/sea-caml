type t =
  | Identifier of string
  | Constant of int
  (* Keywords *)
  | KWInt
  | KWVoid
  | KWReturn
  (* Punctuation *)
  | OpenParen
  | CloseParen
  | OpenBrace
  | CloseBrace
  | Semicolon
  [@@deriving show, eq, ord]
