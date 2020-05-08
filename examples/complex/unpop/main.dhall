
let P = ../../../render/procedure.dhall

let Recipe = ../../../render/recipe_builder.dhall

in  Recipe.Main::{
    , include = [ "include.yaml" ]
    , cooking = Recipe.Cooking::{
      , datapoints =
        [ P.run_op.run
            { ingredients = [ "testing_ingredient" ]
            , result = "testing_ingredient_result"
            , options.op = [ P.run_op.Op "test" "a + b" ]
            }
        ]
      }
    }
