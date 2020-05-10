let P = ../types/Procedure.dhall

let m = P.merge

let default = { deep = False }

let shared = ./commonInput.dhall

let _merge =
        λ(input : shared ⩓ { options : ../types/merge_options.dhall })
      → m ({ procedure = "merge" } ⫽ input)

in  { run = _merge, default_options = default }
