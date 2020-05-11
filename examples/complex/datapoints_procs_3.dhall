{-
  bridge GBD and GW
-}


let P = ../../render/procedure.dhall

let indicatorList = ./SGIndicatorList.dhall

let BridgeDesc = { ingredient : Text, column : List Text }

in  [ P.trend_bridge.run
        { ingredients = [] : List Text
        , options =
          { bridge_start =
            { ingredient = "gw-cancer-datapoints", column = indicatorList }
          , bridge_end =
            { ingredient = "ihme-death_cause-datapoints-final"
            , column = indicatorList
            }
          , bridge_on = "time"
          , bridge_length = 20
          , target_column = indicatorList
          }
        , result = "gbd-gw-bridged-final"
        }
    ]
