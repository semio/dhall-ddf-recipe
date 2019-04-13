let Ing = ../../render/ingredient.dhall

in  [ Ing.DataSet
	  { id =
		  "co2_mission-datapoints"
	  , dataset =
		  "ddf--cdiac--co2"
	  , key =
		  "country, year"
	  , value =
		  Ing.value_filter.list [ "co2_emission" ]
	  }
	, Ing.DataSet
	  { id =
		  "population-datapoints"
	  , dataset =
		  "ddf--unpop--population"
	  , key =
		  "country, year"
	  , value =
		  Ing.value_filter.list [ "total_population" ]
	  }
	]
