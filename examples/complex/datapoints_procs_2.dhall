{-

align datapoints to open-numbers geo domain

-}

let P = ../../render/procedure.dhall

in  [ P.translate_column.run
	  { ingredients =
		  [ "gbd-datapoints-final-0" ]
	  , result =
		  "ihme-death_cause-datapoints-final-0"
	  , options =
		  { column =
			  "location"
		  , target_column =
			  "location"
		  , dictionary =
			  P.translate_column.dictionary.from_ingredient
			  { base =
				  "gbd-country-aligned"
			  , key =
				  [ "location" ]
			  , value =
				  "location_new"
			  }
		  }
	  }
	, P.translate_header.run
	  { ingredients =
		  [ "ihme-death_cause-datapoints-final-0" ]
	  , result =
		  "ihme-death_cause-datapoints-final"
	  , options =
			{ dictionary =
				P.translate_header.dictionary.inline
				[ { mapKey = "location", mapValue = "geo" }
				, { mapKey = "year", mapValue = "time" }
				]
			}
		  ⫽ P.translate_header.default_options
	  }
	]
