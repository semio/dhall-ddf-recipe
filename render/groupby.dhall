let P = ../types/Procedure.dhall

let Dict = ../types/groupby_dict.dhall

let gb = P.groupby

let shared = ./commonInput.dhall

let groupby =
		λ(input : shared ⩓ { options : ../types/groupby_options.dhall })
	  → gb ({ procedure = "groupby" } ⫽ input)

in  { run = groupby }
