let P = ../../render/procedure.dhall

in  [ P.merge.run
        { ingredients = [ "co2_emission-datapoints", "population-datapoints" ]
        , result = "datapoints-merged"
        , options = P.merge.default_options
        }
    , P.run_op.run
        { ingredients = [ "datapoints-merged" ]
        , result = "datapoints-final"
        , options.op =
          [ P.run_op.Op
              "co2_emission_per_capita"
              "co2_emission / total_population"
          ]
        }
    ]
