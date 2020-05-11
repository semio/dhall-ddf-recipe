let P = ./../types/Procedure.dhall

let shared = ./commonInput.dhall

let options = ../types/filter_options.dhall

let row = ../types/filter_dict_row.dhall

let item = ../types/filter_dict_item.dhall

let filter =
        λ(input : shared ⩓ { options : options })
      → P.filter ({ procedure = "filter" } ⫽ input)

in  { run = filter
    , row =
      { simple = row.simple
      , no_filter = row.noFilter
      , member_test = row.memberTest
      , simple_dict = row.simpleDict
      , text_value_test = row.textValueTest
      , number_value_test = row.numberValueTest
      }
    , item =
      { no_filter = item.noFilter
      , simple = item.simple
      , member_test = item.memberTest
      }
    }
