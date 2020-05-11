let Dict = ./Dict.dhall

in  let Filters =
          < noFilter : {}
          | simple : List Text
          | memberTest : Dict Text (List Text)
          >

    in  Filters
