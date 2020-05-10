let recipe =
      { info = {=}
      , config =
        { ddf_dir = "./"
        , procedures_dir = "./"
        , dictionary_dir = "./"
        , recipes_dir = "./"
        }
      , cooking = {=}
      , include = [] : List Text
      , ingredients = [] : List ../types/Ingredient.dhall
      }

in  recipe
