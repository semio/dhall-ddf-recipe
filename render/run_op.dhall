let P = ../types/Procedure.dhall

let r = P.run_op

let shared = ./commonInput.dhall

let run_op =
        λ(input : shared ⩓ { options : ../types/run_op_options.dhall })
      → r ({ procedure = "run_op" } ⫽ input)

let Op = λ(k : Text) → λ(v : Text) → { mapKey = k, mapValue = v }

in  { run = run_op, Op = Op }
