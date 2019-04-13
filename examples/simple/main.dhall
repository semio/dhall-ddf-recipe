{-

Demo recipe: calculate co2 emission per capita

-}
let defaults = ../../render/emptyRecipe.dhall

in    { info =
		  { id = "ddf--test--co2_emission_per_capita" }
	  , ingredients =
		  ./ingredients.dhall
	  , cookings =
		  { datapoints = ./datapoints.dhall }
	  }
	∧ defaults
