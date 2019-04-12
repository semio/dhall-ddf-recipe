let Dict = ./Dict.dhall

let Filters =
	  < noFilter :
		  {}
	  | simple :
		  List Text
	  | simpleDict :
		  Dict Text (List Text)
	  | memberTest :
		  Dict Text (Dict Text (List Text))
	  | textValueTest :
		  Dict Text (Dict Text Text)
	  | numberValueTest :
		  Dict Text (Dict Text Integer)
	  >

in  Filters
