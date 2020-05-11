{-
Here is a dictionary for output indicators and its filtering parameters.

The result YAML file will look like this:

```
incidence:
- age: '27'
  cause: '429'
  id: breast_cancer_new_cases_per_100000_women
  sex: '2'
  indicator: incidence_rate
- age: '22'
  cause: '429'
  id: breast_cancer_number_of_new_female_cases
  sex: '2'
deaths:
- age: '27'
  cause: '429'
  id: breast_cancer_deaths_per_100000_women
  sex: '2'
  indicator: deaths_rate
- age: '22'
  cause: '429'
  id: breast_cancer_number_of_female_deaths
  sex: '2'
  indicator: deaths_number
```

-}

let C = λ(i : Text) → { cause = i }

let I = λ(i : Text) → { indicator = i }

let _A1 = { age : Text }

let _A2 = { age : List Text }

let AGE = < A1 : _A1 | A2 : _A2 >

let A1 = λ(i : Text) → AGE.A1 { age = i }

let A2 = λ(i : List Text) → AGE.A2 { age = i }

let S = λ(i : Text) → { sex = i }

let deathRate = I "deaths_rate"

let deathNum = I "deaths_number"

let newCase = I "incidence_number"

let newCaseRate = I "incidence_rate"

let breastCancer = C "429"

let cervicalCancer = C "432"

let colonandrectumCancer = C "441"

let fall = C "697"

let hiv = C "298"

let injury = C "687"

let liverCancer = C "417"

let lungCancer = C "426"

let malaria = C "345"

let motorcycle = C "692"

let murder = C "724"

let ncd = C "409"

let poisonings = C "700"

let prostateCancer = C "438"

let stomachCancer = C "414"

let suicide = C "718"

let traffic = C "688"

let measles = C "341"

let meningitis = C "332"

let burn = C "699"

let ageAll = A1 "22"

let ageAdj = A1 "27"

let under5 = A1 "1"

let age1529 = A2 [ "8", "9", "10" ]

let age3044 = A2 [ "11", "12", "13" ]

let age4559 = A2 [ "14", "15", "16" ]

let age6079 = A2 [ "17", "18", "19", "20" ]

let age80plus = A2 [ "30", "31", "32", "235" ]

let ageunder15 = A2 [ "1", "23" ]

let male = S "1"

let female = S "2"

let bothSex = S "3"

let Rec = ./Record.dhall

let Record = Rec.Record

let map =
        λ(id : Text)
      → λ(indicator : { indicator : Text })
      → λ(sex : { sex : Text })
      → λ(cause : { cause : Text })
      → λ(age : AGE)
      → let handlers =
              { A1 =
                    λ(age : _A1)
                  → Record.t1 ({ id } ⫽ indicator ⫽ sex ⫽ cause ⫽ age)
              , A2 =
                    λ(age : _A2)
                  → Record.t2 ({ id } ⫽ indicator ⫽ sex ⫽ cause ⫽ age)
              }

        in  merge handlers age

in  { deaths =
      [ map
          "breast_cancer_deaths_per_100000_women"
          deathRate
          female
          breastCancer
          ageAdj
      , map
          "breast_cancer_number_of_female_deaths"
          deathNum
          female
          breastCancer
          ageAll
      , map "burns_deaths_per_100000_people" deathRate bothSex burn ageAdj
      , map
          "cervical_cancer_deaths_per_100000_women"
          deathRate
          female
          cervicalCancer
          ageAdj
      , map
          "cervical_cancer_number_of_female_deaths"
          deathNum
          female
          cervicalCancer
          ageAll
      , map
          "colonandrectum_cancer_deaths_per_100000_men"
          deathRate
          male
          colonandrectumCancer
          ageAdj
      , map
          "colonandrectum_cancer_deaths_per_100000_women"
          deathRate
          female
          colonandrectumCancer
          ageAdj
      , map
          "colonandrectum_cancer_number_of_female_deaths"
          deathNum
          female
          colonandrectumCancer
          ageAll
      , map
          "colonandrectum_cancer_number_of_male_deaths"
          deathNum
          male
          colonandrectumCancer
          ageAll
      , map "falls_deaths_per_100000_people" deathRate bothSex fall ageAdj
      , map
          "hiv_deaths_in_children_1_59_months_total_deaths"
          deathNum
          bothSex
          hiv
          under5
      , map
          "injury_deaths_in_children_1_59_months_total_deaths"
          deathNum
          bothSex
          injury
          under5
      , map
          "liver_cancer_deaths_per_100000_men"
          deathRate
          male
          liverCancer
          ageAdj
      , map
          "liver_cancer_deaths_per_100000_women"
          deathRate
          female
          liverCancer
          ageAdj
      , map
          "liver_cancer_number_of_female_deaths"
          deathNum
          female
          liverCancer
          ageAll
      , map
          "liver_cancer_number_of_male_deaths"
          deathNum
          male
          liverCancer
          ageAll
      , map "lung_cancer_deaths_per_100000_men" deathRate male lungCancer ageAdj
      , map
          "lung_cancer_deaths_per_100000_women"
          deathRate
          female
          lungCancer
          ageAdj
      , map
          "lung_cancer_number_of_female_deaths"
          deathNum
          female
          lungCancer
          ageAll
      , map "lung_cancer_number_of_male_deaths" deathNum male lungCancer ageAll
      , map
          "malaria_deaths_in_children_1_59_months_total_deaths"
          deathNum
          bothSex
          malaria
          under5
      , map
          "measles_deaths_in_children_1_59_months_total_deaths"
          deathNum
          bothSex
          measles
          under5
      , map
          "meningitis_deaths_in_children_1_59_months_total_deaths"
          deathNum
          bothSex
          meningitis
          under5
      , map
          "motorcycle_deaths_per_100000_people"
          deathRate
          bothSex
          motorcycle
          ageAdj
      , map
          "ncd_deaths_in_children_1_59_months_total_deaths"
          deathNum
          bothSex
          ncd
          under5
      , map
          "poisonings_deaths_per_100000_people"
          deathRate
          bothSex
          poisonings
          ageAdj
      , map
          "prostate_cancer_deaths_per_100000_men"
          deathRate
          male
          prostateCancer
          ageAdj
      , map
          "prostate_cancer_number_of_male_deaths"
          deathNum
          male
          prostateCancer
          ageAll
      , map
          "stomach_cancer_deaths_per_100000_men"
          deathRate
          male
          stomachCancer
          ageAdj
      , map
          "stomach_cancer_deaths_per_100000_women"
          deathRate
          female
          stomachCancer
          ageAdj
      , map
          "stomach_cancer_number_of_female_deaths"
          deathNum
          female
          stomachCancer
          ageAll
      , map
          "stomach_cancer_number_of_male_deaths"
          deathNum
          male
          stomachCancer
          ageAll
      ]
    , incidence =
      [ map
          "breast_cancer_new_cases_per_100000_women"
          newCaseRate
          female
          breastCancer
          ageAdj
      , map
          "breast_cancer_number_of_new_female_cases"
          newCase
          female
          breastCancer
          ageAll
      , map
          "cervical_cancer_new_cases_per_100000_women"
          newCaseRate
          female
          cervicalCancer
          ageAdj
      , map
          "cervical_cancer_number_of_new_female_cases"
          newCase
          female
          cervicalCancer
          ageAll
      , map
          "colonandrectum_cancer_new_cases_per_100000_men"
          newCaseRate
          male
          colonandrectumCancer
          ageAdj
      , map
          "colonandrectum_cancer_new_cases_per_100000_women"
          newCaseRate
          female
          colonandrectumCancer
          ageAdj
      , map
          "colonandrectum_cancer_number_of_new_female_cases"
          newCase
          female
          colonandrectumCancer
          ageAll
      , map
          "colonandrectum_cancer_number_of_new_male_cases"
          newCase
          male
          colonandrectumCancer
          ageAll
      , map
          "liver_cancer_new_cases_per_100000_men"
          newCaseRate
          male
          liverCancer
          ageAdj
      , map
          "liver_cancer_new_cases_per_100000_women"
          newCaseRate
          female
          liverCancer
          ageAdj
      , map
          "liver_cancer_number_of_new_female_cases"
          newCase
          female
          liverCancer
          ageAll
      , map
          "liver_cancer_number_of_new_male_cases"
          newCase
          male
          liverCancer
          ageAll
      , map
          "lung_cancer_new_cases_per_100000_men"
          newCaseRate
          male
          lungCancer
          ageAdj
      , map
          "lung_cancer_new_cases_per_100000_women"
          newCaseRate
          female
          lungCancer
          ageAdj
      , map
          "lung_cancer_number_of_new_female_cases"
          newCase
          female
          lungCancer
          ageAll
      , map
          "lung_cancer_number_of_new_male_cases"
          newCase
          male
          lungCancer
          ageAll
      , map
          "prostate_cancer_new_cases_per_100000_men"
          newCaseRate
          male
          prostateCancer
          ageAdj
      , map
          "prostate_cancer_number_of_new_male_cases"
          newCase
          male
          prostateCancer
          ageAll
      , map
          "stomach_cancer_new_cases_per_100000_men"
          newCaseRate
          male
          stomachCancer
          ageAdj
      , map
          "stomach_cancer_new_cases_per_100000_women"
          newCaseRate
          female
          stomachCancer
          ageAdj
      , map
          "stomach_cancer_number_of_new_female_cases"
          newCase
          female
          stomachCancer
          ageAll
      , map
          "stomach_cancer_number_of_new_male_cases"
          newCase
          male
          stomachCancer
          ageAll
      ]
    }
