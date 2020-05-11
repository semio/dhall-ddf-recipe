let dict = ./Dict.dhall

let AggregateDict = dict Text < simple : Text | funcDict : dict Text Text >

in  { window :
        { column : Text
        , size : < int : Natural | expand : Text >
        , min_periods : Natural
        , center : Bool
        , aggregate : AggregateDict
        }
    }
