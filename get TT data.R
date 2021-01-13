# get this weeks Tidy Tuesday

# load packages
library(tidyverse)
library(tidytuesdayR)
library(here)


tt <- tt_load(2021, week = 3)

# look at the README

tt

# glimpse the data available

tt %>% 
  map(glimpse)


# extract dataframes

artists <- tt[[1]] %>%
  clean_names()

works <- tt[[2]] %>%
  clean_names()

# save as csv

artists %>%
  write_csv(here("data", "w3_artist.csv"))



works %>%
  write_csv(here("data", "w3_works.csv"))