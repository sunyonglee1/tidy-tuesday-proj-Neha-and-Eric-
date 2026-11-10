# library(tidyverse)
# library(RODBC)

# # Source https://discovery.dundee.ac.uk/en/datasets/edible-plant-database/
# # does not allow automatic downloads, so the data was downloaded locally. Here
# # we assume the data is saved in your `tempdir()`.

# # download_dir <- tempdir()
# # data_path <- file.path(download_dir, "plant1.accdb")
# # raw_data <- odbcConnectAccess2007(data_path)
# # plants <- sqlFetch(raw_data, "Edible plants")
# plants <- read_csv("2026-02-03/edible_plants.csv")
# # print(names(plants)
# # )

# edible_plants <- plants |>
#   as_tibble() |>
#   select(
#     taxonomic_name = `Full taxonomic name`,
#     common_name = `Common name`,
#     cultivation = `Cultivation group (Rotational information)`,
#     # Requirements
#     sunlight = `Sunlight requirements`,
#     water = `Water Requirements`,
#     preferred_ph = `Preferred pH`,
#     nutrients = `Nutrient requirements`,
#     soil = Soil,
#     season = `Descriptive Growing Season`,
#     temperature_class = `Temperature class`,
#     temperature_germination = `Optimum Germination Temerature`,
#     temperature_growing = `Plant growing ideal temperature`,
#     days_germination = `Days to germination at optimum temperature`,
#     days_harvest = `Length of gorwing to harvest`,
#     # Info
#     nutritional_info = `Nutritional information`,
#     energy = `Energy Value per 100g raw Kcal`,
#     sensitivities = Sensitivities,
#     description = `General Description`,
#     requirements = `Plant Requirements`
#   ) |>
#   mutate(
#     across(where(is.character), ~ na_if(.x, "Currently no data available."))
#   ) |>
#   mutate(soil = str_trim(soil)) |>
#   mutate(
#     energy = if_else(
#       is.na(nutritional_info) & energy == 0,
#       NA,
#       energy
#     )
#   ) |>
#   separate(
#     preferred_ph,
#     into = c("preferred_ph_lower", "preferred_ph_upper"),
#     sep = "-|–",
#     fill = "right"
#   ) |>
#   mutate(
#     across(starts_with("preferred"), as.numeric)
#   ) |>
#   mutate(temperature_growing = str_remove_all(temperature_growing, " ")) |>
#   mutate(across(where(is.character), ~ str_squish(.x)))

# # odbcCloseAll()

# edible_plants |>
#   count(cultivation, water, sort = TRUE)


library(tidyverse)

edible_plants <- read_csv("2026-02-03/edible_plants.csv")

water_summary <- edible_plants |>
  count(cultivation, water, sort = TRUE)

water_summary

  edible_plants <- edible_plants |>
  mutate(water = str_to_title(water))


water_summary <- edible_plants |>
  count(cultivation, water) |>
  group_by(cultivation) |>
  mutate(percent = n / sum(n) * 100) |>
  ungroup()

water_summary

high_water <- water_summary |>
  filter(water == "High") |>
  arrange(desc(percent))

high_water


p <- ggplot(high_water, aes(x = reorder(cultivation, percent), y = percent)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Cultivation Classes with High Water Requirements",
    x = "Cultivation Class",
    y = "Percentage Requiring High Water"
  )

ggsave("2026-02-03/high_water.png", plot = p, width = 8, height = 5)