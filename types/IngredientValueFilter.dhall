let ValueFilter =
	  < TextFilter :
		  Text
	  | DictFilter :
		  List { mapKey : Text, mapValue : List Text }
	  | ListFilter :
		  List Text
	  >

in  ValueFilter
