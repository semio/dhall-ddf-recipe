{-
This is a recipe to filter and flatten the multi-dimensional dataset IHME GBD into the
following indicators, with (geo, time) dimension and the geo dimension is in open-numbers
geo domain, and finally bridge them with data from Gapminder World.

  - breast_cancer_deaths_per_100000_women
  - breast_cancer_number_of_female_deaths
  - burns_deaths_per_100000_people
  - cervical_cancer_deaths_per_100000_women
  - cervical_cancer_number_of_female_deaths
  - colonandrectum_cancer_deaths_per_100000_men
  - colonandrectum_cancer_deaths_per_100000_women
  - colonandrectum_cancer_number_of_female_deaths
  - colonandrectum_cancer_number_of_male_deaths
  - falls_deaths_per_100000_people
  - hiv_deaths_in_children_1_59_months_total_deaths
  - injury_deaths_in_children_1_59_months_total_deaths
  - liver_cancer_deaths_per_100000_men
  - liver_cancer_deaths_per_100000_women
  - liver_cancer_number_of_female_deaths
  - liver_cancer_number_of_male_deaths
  - lung_cancer_deaths_per_100000_men
  - lung_cancer_deaths_per_100000_women
  - lung_cancer_number_of_female_deaths
  - lung_cancer_number_of_male_deaths
  - malaria_deaths_in_children_1_59_months_total_deaths
  - measles_deaths_in_children_1_59_months_total_deaths
  - meningitis_deaths_in_children_1_59_months_total_deaths
  - motorcycle_deaths_per_100000_people
  - ncd_deaths_in_children_1_59_months_total_deaths
  - poisonings_deaths_per_100000_people
  - prostate_cancer_deaths_per_100000_men
  - prostate_cancer_number_of_male_deaths
  - stomach_cancer_deaths_per_100000_men
  - stomach_cancer_deaths_per_100000_women
  - stomach_cancer_number_of_female_deaths
  - stomach_cancer_number_of_male_deaths
  - breast_cancer_new_cases_per_100000_women
  - breast_cancer_number_of_new_female_cases
  - cervical_cancer_new_cases_per_100000_women
  - cervical_cancer_number_of_new_female_cases
  - colonandrectum_cancer_new_cases_per_100000_men
  - colonandrectum_cancer_new_cases_per_100000_women
  - colonandrectum_cancer_number_of_new_female_cases
  - colonandrectum_cancer_number_of_new_male_cases
  - liver_cancer_new_cases_per_100000_men
  - liver_cancer_new_cases_per_100000_women
  - liver_cancer_number_of_new_female_cases
  - liver_cancer_number_of_new_male_cases
  - lung_cancer_new_cases_per_100000_men
  - lung_cancer_new_cases_per_100000_women
  - lung_cancer_number_of_new_female_cases
  - lung_cancer_number_of_new_male_cases
  - prostate_cancer_new_cases_per_100000_men
  - prostate_cancer_number_of_new_male_cases
  - stomach_cancer_new_cases_per_100000_men
  - stomach_cancer_new_cases_per_100000_women
  - stomach_cancer_number_of_new_female_cases
  - stomach_cancer_number_of_new_male_cases

 -}

let Recipe = ../../render/recipe_builder.dhall

in    { info.id = "sg-ihme-dataset" }
    ∧ Recipe.Main::{
      , config = Recipe.Config::{
        , recipes_dir = "./"
        , dictionary_dir = "../translation_dictionaries"
        , external_csv_dir = "../external_csv"
        , procedure_dir = "./procedure"
        }
      , ingredients = ./ingredients.dhall
      , cooking = Recipe.Cooking::{
        , datapoints =
              ./datapoints_procs_0.dhall
            # ./datapoints_procs_1.dhall
            # ./datapoints_procs_2.dhall
            # ./datapoints_procs_3.dhall
        }
      }
