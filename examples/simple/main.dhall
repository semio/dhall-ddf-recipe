{-

Demo recipe: calculate co2 emission per capita

-}
let Recipe = ../../render/recipe_builder.dhall

in    { info.id = "ddf--test--co2_emission_per_capita" }
    ∧ Recipe.Main::{
      , ingredients = ./ingredients.dhall
      , cooking = Recipe.Cooking::{ datapoints = ./datapoints.dhall }
      }
