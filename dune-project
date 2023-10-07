(lang dune 3.10)
(using menhir 2.1)

(name statistix)

(generate_opam_files true)

(source
 (github satijakritik/statistix))

(authors "Kritik Satija")

(maintainers "Kritik Satija")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name statistix)
 (synopsis "Statistical programming language")
 (description "A longer description")
 (depends ocaml dune fmt ppx_jane)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
