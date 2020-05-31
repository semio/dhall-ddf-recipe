let opt1 = { base : Text, type : Text }

let opt2 = List { mapKey : Text, mapVal : Text }

let ExtractConceptsDefaults =
      { join = None opt1 : Optional opt1
      , overwrite = None opt2 : Optional opt2
      , include_keys = Some True : Optional Bool
      }

in  ExtractConceptsDefaults
