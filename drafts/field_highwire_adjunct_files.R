library(tidyverse)

fls <- tempfile(fileext = ".xls")
download.file("https://science.sciencemag.org/highwire/filestream/710905/field_highwire_adjunct_files/3/aaq0216_DataS2.xls", fls)

df <- readxl::read_excel(fls)

type_it <- function(df){
  df %>% 
    mutate(
      type = case_when(
        ...1 == 'Wheat & Rye (Bread)' ~ 'Vegan',
        ...1 == 'Maize (Meal)' ~ 'Vegan',
        ...1 == 'Barley (Beer)' ~ 'Vegan',
        ...1 == 'Oatmeal' ~ 'Vegan',
        ...1 == 'Rice' ~ 'Vegan',
        ...1 == 'Potatoes' ~ 'Vegan',
        ...1 == 'Cassava' ~ 'Vegan',
        ...1 == 'Cane Sugar' ~ 'Vegan',
        ...1 == 'Beet Sugar' ~ 'Vegan',
        ...1 == 'Other Pulses' ~ 'Vegan',
        ...1 == 'Peas' ~ 'Vegan',
        ...1 == 'Nuts' ~ 'Vegan',
        ...1 == 'Groundnuts' ~ 'Vegan',
        ...1 == 'Soymilk' ~ 'Vegan',
        ...1 == 'Tofu' ~ 'Vegan',
        ...1 == 'Soybean Oil' ~ 'Vegan',
        ...1 == 'Palm Oil' ~ 'Vegan',
        ...1 == 'Sunflower Oil' ~ 'Vegan',
        ...1 == 'Rapeseed Oil' ~ 'Vegan',
        ...1 == 'Olive Oil' ~ 'Vegan',
        ...1 == 'Tomatoes' ~ 'Vegan',
        ...1 == 'Onions & Leeks' ~ 'Vegan',
        ...1 == 'Root Vegetables' ~ 'Vegan',
        ...1 == 'Brassicas' ~ 'Vegan',
        ...1 == 'Other Vegetables' ~ 'Vegan',
        ...1 == 'Citrus Fruit' ~ 'Vegan',
        ...1 == 'Bananas' ~ 'Vegan',
        ...1 == 'Apples' ~ 'Vegan',
        ...1 == 'Berries & Grapes' ~ 'Vegan',
        ...1 == 'Wine' ~ 'Vegan',
        ...1 == 'Other Fruit' ~ 'Vegan',
        ...1 == 'Coffee' ~ 'Vegan',
        ...1 == 'Dark Chocolate' ~ 'Vegan',
        ...1 == 'Bovine Meat (beef herd)' ~ 'Carne',
        ...1 == 'Bovine Meat (dairy herd)' ~ 'Carne',
        ...1 == 'Lamb & Mutton' ~ 'Carne',
        ...1 == 'Pig Meat' ~ 'Carne',
        ...1 == 'Poultry Meat' ~ 'Carne',
        ...1 == 'Milk' ~ 'Vegetarian',
        ...1 == 'Cheese' ~ 'Vegetarian',
        ...1 == 'Eggs' ~ 'Vegetarian',
        ...1 == 'Fish (farmed)' ~ 'Carne',
        ...1 == 'Crustaceans (farmed)' ~ 'Carne', 
        TRUE ~ NA_character_
      )
    )
}

df <- type_it(df)

clean_it <- function(df, which){
  nms <- as.character(df[2, c(1, 56, which), drop = TRUE])
  nms[is.na(nms)] <- "type"
  df %>%
    slice(3:45) %>%
    select(1, type, {{which}}) %>%
    setNames(nms) %>%
    mutate_at(3:8, as.numeric)
}

land_use <- clean_it(df, 2:7)
ghg_emission_2013 <- clean_it(df, 8:13)
ghg_emission_2007 <- clean_it(df, 14:19)
acidifing_emissions <- clean_it(df, 20:25)
eutrophying_emissions <- clean_it(df, 26:31)
freshwater_withdrawals <- clean_it(df, 32:37)
eutrophying_emissions <- clean_it(df, 26:31)
stress_weigth_water <- clean_it(df, 38:43)


gg_do_median <- function(df){
  ggplot(df, aes(reorder(Product, Median), Median, fill = type)) + 
    geom_col() + 
    coord_flip() + 
    labs(
      x = "Product", 
      y = "Median"
    ) + 
    scale_fill_viridis_d() +
    theme_minimal()
}
gg_do_mean<- function(df){
  ggplot(df, aes(reorder(Product, Mean), Mean, fill = type)) + 
    geom_col() + 
    coord_flip() + 
    labs(
      x = "Product", 
      y = "Mean"
    ) + 
    scale_fill_viridis_d()+
    theme_minimal()
}

gg_do_median(land_use)
gg_do_mean(land_use)

df2 <- readxl::read_excel(fls, 2)
