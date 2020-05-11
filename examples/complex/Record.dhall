{- We need 2 types of filters, one filter an age group, the other filter a list of age groups -}

let Record1 =
      { id : Text, indicator : Text, sex : Text, cause : Text, age : Text }

let Record2 =
      { id : Text, indicator : Text, sex : Text, cause : Text, age : List Text }

let Record = < t1 : Record1 | t2 : Record2 >

in  { Record, t1 = Record1, t2 = Record2 }
