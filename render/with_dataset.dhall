let map = https://prelude.dhall-lang.org/List/map

let Ingredient = ../types/Ingredient.dhall

let ParamType =
      { id : Text, key : Text, value : ../types/IngredientValueFilter.dhall }

let mkdataset =
        λ(dataset : Text)
      → λ(params : ParamType)
      → let all_params = { dataset } ∧ params in Ingredient.DataSet all_params

in    λ(dataset : Text)
    → λ(list_params : List ParamType)
    → let func = mkdataset dataset in map ParamType Ingredient func list_params
