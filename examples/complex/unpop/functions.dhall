let P = ../../../render/procedure.dhall

let thousands-to-number =
      λ(ingredient : Text) →
        P.run_op.run
          { ingredients = [ ingredient ]
          , options.op = [ P.run_op.Op "population" "population * 1000" ]
          , result = "${ingredient}-numbers"
          }

let align-gm-geo =
      λ(ingredient : Text) →
      λ(column : Text) →
        P.translate_column.run
          { ingredients = [ ingredient ]
          , options =
            { column
            , dictionary =
                P.translate_column.dictionary.from_ingrent
                  { ingredient = "unpop-countries-aligned"
                  , key = "country"
                  , value = "geo"
                  }
            }
          , result = "${ingredient}-aligned"
          }

in  { thousands-to-numbers, align-gm-geo }
