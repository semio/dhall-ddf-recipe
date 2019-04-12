{- TODO: maybe we should fix the definition of groupby procedure... -}

let groupby = ./CommonInputs.dhall ⩓ { options : ./groupby_options.dhall }

in  groupby
