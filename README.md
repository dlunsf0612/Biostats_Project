# Biostats_Project
R scripts and other files used for the project

Link to the source of the data:
https://data.cdc.gov/Vaccinations/Vaccination-Coverage-and-Exemptions-among-Kinderga/ijqb-a7ye/about_data

This GitHub folder will hold any files that we can share with each other
The linked csv is filtered and cleaned up from the original data 
I filtered the data to only include MMR vaccinations and all vaccine exemptions

IMPORTANT: DO NOT use drop_na() because it will drop all rows with NA and many of the rows SHOULD have NA. Use filter(!is.na("insert col name here")) instead to drop NA values within columns before doing calculations 

When importing the CSV it will give you an addtion column labeled "...1" use dplyr::select(-`...1`) to get rid of it 

List of column names

dose: The dose of vaccines (otherwise NA)

geo.type: Nation or State 

geo: The name of the nation or state

year: The school year in which the data was collected

pop: The population of people in the survey

s.pcent: Percent of kindergarteners surveyed in a given year

Footnotes: A notes section (reference the metadata)

exemp: number of exemptions 

s.type: survey type 

mmr.perc: Vaccination coverage (%) for MMR 

exemp.perc: Percentage of exemptions within the population

mmr.pac.perc: Vaccination coverage for MMR (PAC) vaccinations after exposure (postexposure prophylaxis)
