(lang dune 3.15)

(name sea_caml)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Author Name")

(maintainers "Maintainer Name")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name sea_caml)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends 
  ocaml
  batteries
  cmdliner 
  dune)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
