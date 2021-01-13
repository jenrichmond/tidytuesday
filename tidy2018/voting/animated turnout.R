library(tidyverse)
library(maps)
library(RCurl)
library(gganimate)

president_years <- seq(1980, 2012, 4)

voterdata <- read.csv(text=getURL("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018-10-09/voter_turnout.csv"), header = T)


voter_turnout <- voterdata %>%
  mutate(turnout = votes/eligible_voters) %>%
  select(-X, -icpsr_state_code, -alphanumeric_state_code)


pres_turnout <- voter_turnout %>%
  filter(year %in% president_years) %>%
  select(-votes, -eligible_voters) %>%
  spread(year, turnout)

usa_df <- map_data("state") %>%
  mutate(state = str_to_title(region)) %>% #add capital letter to region and call it state
  select(-region) %>% #drop region column
  left_join(pres_turnout, by = "state") %>%
  gather(year, turnout, as.character(president_years))

##make static plot first

staticplot <- ggplot(usa_df, mapping = aes(x=long, y=lat, group = group, fill = turnout)) +
  geom_polygon(color= "black") +
  theme(panel.background = element_blank(), axis.text = element_blank()) +
  labs(title = "voter turnout", height = 400, width = 600)

print(staticplot)

#then animate it

animate(ggplot(usa_df, mapping = aes(x=long, y=lat, group = group, fill = turnout)) +
          geom_polygon(color= "black") +
          theme(panel.background = element_blank(), axis.text = element_blank())) +
          transition_states(year, transition_length = 10, state_length = 1000) +
          labs(title = "voter turnout", height = 400, width = 600)
          
          