{-  A list of indicators generated from indicator mappings. -}

let map = https://prelude.dhall-lang.org/List/map

let mappings = ./indicatorMappings.dhall

let _Rec = ./Record.dhall

let Record = _Rec.Record

let getIndicatorList =
        λ(rec : Record)
      → merge { t1 = λ(r : _Rec.t1) → r.id, t2 = λ(r : _Rec.t2) → r.id } rec

let indicatorList =
        map Record Text getIndicatorList mappings.deaths
      # map Record Text getIndicatorList mappings.incidence

in  indicatorList
