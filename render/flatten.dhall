let P = ../types/Procedure.dhall

let f = P.flatten

let shared = ./commonInput.dhall

let flatten =
		λ(input : shared ⩓ { options : ./../types/flatten_options.dhall })
	  → f ({ procedure = "flatten" } ⫽ input)

let defaultOptions = { skip_totals_among_entities = [] : List Text }

in  { run = flatten, default_options = defaultOptions }
