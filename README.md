# Biostats_Project
R scripts and other files used for the project

This github folder will hold any files that we can share with each other
The linked csv is filtered and cleaned up from the original data 
I filtered the data to only include MMR vaccinations and all vaccine exemptions

IMPORTANT: DO NOT use drop_na() because it will drop all rows with NA and many of the rows SHOULD have NA. Use filter(!is.na("insert col name here")) instead to drop NA values within columns before doing calculations 