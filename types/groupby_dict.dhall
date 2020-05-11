let GroupbyDict =
      < path : Text
      | list : List Text
      | l1dict : ./Dict.dhall Text Text
      | l2dict : ./Dict.dhall Text (./Dict.dhall Text Text)
      >

in  GroupbyDict
