let Procedure
	: Type
	= < translate_column :
		  ./translate_column.dhall
	  | translate_header :
		  ./translate_header.dhall
	  | extract_concepts :
		  ./extract_concepts.dhall
	  | filter :
		  ./filter.dhall
	  | flatten :
		  ./flatten.dhall
	  | groupby :
		  ./groupby.dhall
	  | `merge` :
		  ./merge.dhall
	  | run_op :
		  ./run_op.dhall
	  | trend_bridge :
		  ./trend_bridge.dhall
	  | window :
		  ./window.dhall
	  | serve :
		  ./serve.dhall
	  >

in  Procedure
