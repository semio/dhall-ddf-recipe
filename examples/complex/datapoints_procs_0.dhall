{- In this file:

1. align GBD locations to the Gapminder entity geo domain
2. note that the "533" location in GBD should be removed because it is
the state Georgia of US, which conflicts with country Georgia.

-}

let P = ../../render/procedure.dhall

in  [ P.translate_column.run
        { ingredients = [ "gbd-country" ]
        , result = "gbd-country-aligned-0"
        , options =
          { column = "name"
          , target_column = "location_new"
          , dictionary =
              P.translate_column.dictionary.from_ingredient
                { base = "geo-synonyms", value = "geo", key = "synonym" }
          }
        }
    , P.filter.run
        { ingredients = [ "gbd-country-aligned-0" ]
        , result = "gbd-country-aligned"
        , options =
          { row =
              P.filter.row.member_test
                [ { mapKey = "location"
                  , mapValue = [ { mapKey = "\$nin", mapValue = [ "533" ] } ]
                  }
                ]
          , item = P.filter.item.no_filter {=}
          }
        }
    ]
