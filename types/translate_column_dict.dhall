    let TranslateColumnDict =
          < simple :
              List { mapKey : Text, mapValue : Text }
          | df_builder :
              { base : Text, key : List Text, value : Text }
          | path : Text
          >

in TranslateColumnDict
