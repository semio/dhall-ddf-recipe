let make = ../types/Ingredient.dhall

let value_filter = ../types/IngredientValueFilter.dhall

in  { DataSet =
		make.DataSet
	, DataFile =
		make.DataFile
	, default_value_filter =
		value_filter.TextFilter "*"
	, value_filter =
		{ text =
			value_filter.TextFilter
		, dict =
			value_filter.DictFilter
		, list =
			value_filter.ListFilter
		}
	}
