library(tidyverse)
library(nycsquirrels18)

#load squirrel data from package
squirrels <- squirrels %>%
  rename(id = unique_squirrel_id)

names(squirrels)

# make separte dfs for each beh type
move <- squirrels %>%
  select(long:foraging)

noise <- squirrels %>%
  select(long:specific_location, kuks:moans)

tails <- squirrels %>%
  select(long:specific_location, tail_flags:tail_twitches)

human <- squirrels %>%
  select(long:specific_location, approaches:runs_from)

# squirrel interactions with humans
names(human)

