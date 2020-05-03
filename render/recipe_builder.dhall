let Procedure = ../types/Procedure.dhall

let Ingredient = ../types/Ingredient.dhall

let Cooking =
      { Type =
          { datapoints : List Procedure
          , entities : List Procedure
          , concepts : List Procedure
          }
      , default =
        { datapoints = [] : List Procedure
        , entities = [] : List Procedure
        , concepts = [] : List Procedure
        }
      }

let Recipe =
      { Type =
          { cooking : Cooking.Type
          , include : List Text
          , ingredients : List Ingredient
          }
      , default =
        { cooking = {=}
        , include = [] : List Text
        , ingredients = [] : List Ingredient
        }
      }

in  { Main = Recipe, Cooking }
