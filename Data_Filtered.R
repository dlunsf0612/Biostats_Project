# Final Project data table preparation

library(tidyverse)

# Clean and organize raw data to be used for the project 
# This code was written as a group

og.df = read_csv("Vaccination_Coverage_and_Exemptions_among_Kindergartners_20261028.csv")

# rename columns and change mutate est into a numeric vector column
all.df = og.df |>
  rename(est = `Estimate (%)`,
         dose = Dose,
         geo = Geography,
         year = `School Year`, 
         vacc.exemp = `Vaccine/Exemption`,
         geo.type = `Geography Type`,
         pop = `Population Size`,
         s.pcent = `Percent Surveyed`,
         exemp = `Number of Exemptions`, 
         s.type = `Survey Type`) |>
  mutate(estimate = as.numeric(est))

# remove the est column (character vector)
#filter MMR and MMR (PAC) to non-NA values
# filter to only state surveys
# filter to exclude cities 

# The new filtered and concatenated data frame contains exemptions and MMR vaccine coverage 
# for all years and only including the 50 states
# Columns were renamed and estimate was broken up according to
# either the vaccination coverage % or the exemption %

concat.df = all.df |>
  dplyr::select(-est) |>
  filter(str_detect(vacc.exemp, "MMR|MMR (PAC)|Exemption"),
         !is.na(estimate) == TRUE,
         estimate != "NReq",
         geo.type == "States", 
         str_detect(geo, "NY-Rest of state|NY-City of New York|TX-City of Houston|District of Columbia", negate = TRUE))|>
  pivot_wider(names_from = vacc.exemp, values_from = estimate) |>
  rename(exemp.perc = Exemption, 
         mmr.perc = MMR, 
         mmr.pac.perc = `MMR (PAC)`)

# write the cleaned and filtered into a csv
write.csv(concat.df, "MMR_data.csv")
