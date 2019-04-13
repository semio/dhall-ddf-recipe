{- in this file:

we will read the mapping file and generate procedures.

1. filter row/item from GBD deaths/incidence dataset
2. flatten dimensions to create datapoints by (location, year)

there are two types of inputs, one is that only one age group will be supplied,
the other is that multiple age groups will be supplied. For the one with
multiple age groups, we need to run additional groupby and aggregate before
flatten.

-}

let mappings = ./indicatorMappings.dhall

let Rec = ./Record.dhall

let Record = Rec.Record

let P = ../../render/procedure.dhall

let filterProc =
		λ(ingredient : Text)
	  → λ(rec : Record)
	  → merge
		{ t1 =
			  λ(r : Rec.t1)
			→ P.filter.run
			  { ingredients =
				  [ ingredient ]
			  , result =
				  "dps-" ++ r.id ++ "-filtered"
			  , options =
				  { item =
					  P.filter.item.simple [ r.indicator ]
				  , row =
					  P.filter.row.simple_dict
					  [ { mapKey = "age", mapValue = [ r.age ] }
					  , { mapKey = "cause", mapValue = [ r.cause ] }
					  , { mapKey = "sex", mapValue = [ r.sex ] }
					  ]
				  }
			  }
		, t2 =
			  λ(r : Rec.t2)
			→ P.filter.run
			  { ingredients =
				  [ ingredient ]
			  , result =
				  "dps-" ++ r.id ++ "-filtered"
			  , options =
				  { item =
					  P.filter.item.simple [ r.indicator ]
				  , row =
					  P.filter.row.simple_dict
					  [ { mapKey = "age", mapValue = r.age }
					  , { mapKey = "cause", mapValue = [ r.cause ] }
					  , { mapKey = "sex", mapValue = [ r.sex ] }
					  ]
				  }
			  }
		}
		rec

let flattenProc =
		λ(ingredient : Text)
	  → λ(k : Text)
	  → λ(v : Text)
	  → λ(dims : List Text)
	  → P.flatten.run
		{ ingredients =
			[ ingredient ]
		, result =
			ingredient ++ "-flattened"
		, options =
			{ dictionary =
				[ { mapKey = k, mapValue = v } ]
			, flatten_dimensions =
				dims
			, skip_totals_among_entities =
				[] : List Text
			}
		}

let groupbyProc =
		λ(ingredient : Text)
	  → λ(indicator : Text)
	  → P.groupby.run
		{ ingredients =
			[ ingredient ]
		, result =
			ingredient ++ "-aggregated"
		, options =
			{ groupby =
				[ "cause", "sex", "location", "year" ]
			, aggregate =
				[ { mapKey = indicator, mapValue = "sum" } ]
			}
		}

let buildProcs =
		λ(ingredient : Text)
	  → λ(rec : Record)
	  → merge
		{ t1 =
			  λ(r : Rec.t1)
			→ [ filterProc ingredient rec
			  , flattenProc
				("dps-" ++ r.id ++ "-filtered")
				r.indicator
				r.id
				[ "sex", "age", "cause" ]
			  ]
		, t2 =
			  λ(r : Rec.t2)
			→ [ filterProc ingredient rec
			  , groupbyProc ("dps-" ++ r.id ++ "-filtered") r.indicator
			  , flattenProc
				("dps-" ++ r.id ++ "-filtered" ++ "-aggregated")
				r.indicator
				r.id
				[ "sex", "cause" ]
			  ]
		}
		rec

let getResult =
		λ(rec : Record)
	  → merge
		{ t1 =
			λ(r : Rec.t1) → "dps-" ++ r.id ++ "-filtered-flattened"
		, t2 =
			λ(r : Rec.t2) → "dps-" ++ r.id ++ "-filtered-aggregated-flattened"
		}
		rec

let map = https://prelude.dhall-lang.org/List/map

let concat = https://prelude.dhall-lang.org/List/concat

let concatMap = https://prelude.dhall-lang.org/List/concatMap

let deaths_procs =
	  concatMap
	  Record
	  ../../types/Procedure.dhall
	  (buildProcs "gbd-datapoints")
	  mappings.deaths

let incidence_procs =
	  concatMap
	  Record
	  ../../types/Procedure.dhall
	  (buildProcs "gbd-datapoints")
	  mappings.incidence

let results_1 = map Record Text getResult mappings.deaths

let results_2 = map Record Text getResult mappings.incidence

let merge_result =
	  [ P._merge.run
		{ ingredients =
			results_1 # results_2
		, result =
			"gbd-datapoints-final-0"
		, options =
			P._merge.default_options
		}
	  ]

in  deaths_procs # incidence_procs # merge_result
