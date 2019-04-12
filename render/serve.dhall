let P = ../types/Procedure.dhall

let s = P.serve

let opt = ../types/serve_options.dhall

let serve =
		λ(input : { ingredients : List Text, options : opt })
	  → s ({ procedure = "serve" } ⫽ input)

let serveDefaultOptions = [] : List { mapKey : Text, mapValue : Text }

in  { run = serve, default_options = serveDefaultOptions }
