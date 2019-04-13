{- all ingredients -}

let gbd_dataset = "open-numbers/ddf--ihme--death_cause_compact"

let gw_dataset = "open-numbers/ddf--gapminder--gapminder_world"

let open_numbers = "open-numbers/ddf--open_numbers"

let Ing = ../render/ingredient.dhall

let indicatorList = ./SGIndicatorList.dhall

let filter = ../types/IngredientValueFilter.dhall

in  [ Ing.DataSet
	  { id =
		  "gbd-datapoints"
	  , dataset =
		  gbd_dataset
	  , key =
		  "sex, cause, age, location, year"
	  , value =
		  filter.ListFilter
		  [ "deaths_rate"
		  , "deaths_number"
		  , "incidence_number"
		  , "incidence_rate"
		  ]
	  }
	, Ing.DataSet
	  { id =
		  "gbd-country"
	  , dataset =
		  gbd_dataset
	  , key =
		  "location"
	  , value =
		  Ing.default_value_filter
	  }
	, Ing.DataSet
	  { id =
		  "gw-cancer-datapoints"
	  , dataset =
		  gw_dataset
	  , key =
		  "geo,time"
	  , value =
		  filter.ListFilter indicatorList
	  }
	, Ing.DataSet
	  { id =
		  "geo-synonyms"
	  , dataset =
		  open_numbers
	  , key =
		  "synonym"
	  , value =
		  Ing.default_value_filter
	  }
	]