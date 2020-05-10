let ExtractConceptsDefaults =
      { join = [] : Optional { base : Text, type : Text }
      , overwrite = [] : Optional (List { mapKey : Text, mapVal : Text })
      , include_keys = [ True ] : Optional Bool
      }

in  ExtractConceptsDefaults
