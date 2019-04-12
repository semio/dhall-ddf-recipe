let ValueFilter = ./IngredientValueFilter.dhall

let dataset = { id : Text, dataset : Text, key : Text, value : ValueFilter }

let file = { id : Text, data : Text, key : Text, value : ValueFilter }

in  < DataSet : dataset | DataFile : file >
