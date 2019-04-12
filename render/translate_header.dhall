let P = ../types/Procedure.dhall

let Dict = ../types/translate_header_dict.dhall

let th = P.translate_header

let shared = ./commonInput.dhall

let translate_header =
		λ ( input
		  : shared ⩓ { options : ../types/translate_header_options.dhall }
		  )
	  → th ({ procedure = "translate_header" } ⫽ input)

let defaultOptions = { duplicated = "error" }

in  { run =
		translate_header
	, default_options =
		defaultOptions
	, dictionary =
		{ inline = Dict.dict, path = Dict.path }
	}
