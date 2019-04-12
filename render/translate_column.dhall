let P = ../types/Procedure.dhall

let dict = ../types/translate_column_dict.dhall

let options = ../types/translate_column_options.dhall

let shared = ./commonInput.dhall

let func = P.translate_column

let translate_column =
		λ(translate_column : shared ⩓ { options : options })
	  → func ({ procedure = "translate_column" } ⫽ translate_column)

in  { run =
		translate_column
	, dictionary =
		{ path =
			dict.path
		, from_ingredient =
			dict.df_builder
		, simple =
			dict.simple
		}
	}
