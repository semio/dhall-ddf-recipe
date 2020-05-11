let P = ../types/Procedure.dhall

let f = P.trend_bridge

let shared = ./commonInput.dhall

let trend_bridge =
        λ(input : shared ⩓ { options : ../types/trend_bridge_options.dhall })
      → f ({ procedure = "trend_bridge" } ⫽ input)

in  { run = trend_bridge }
