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

let Config =
      { Type =
          { ddf_dir : Text
          , procedure_dir : Text
          , dictionary_dir : Text
          , recipes_dir : Text
          , external_csv_dir : Text
          }
      , default =
        { ddf_dir = "./"
        , procedure_dir = "./"
        , dictionary_dir = "./"
        , recipes_dir = "./"
        , external_csv_dir = "./"
        }
      }

let Recipe =
      { Type =
          { include : List Text
          , config : Config.Type
          , ingredients : List Ingredient
          , cooking : Cooking.Type
          }
      , default =
        { include = [] : List Text
        , config = Config.default
        , ingredients = [] : List Ingredient
        , cooking = {=}
        }
      }

in  { Main = Recipe, Cooking, Config }
