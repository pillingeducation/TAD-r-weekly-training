library(nycflights13)
library(tidyverse)

install.packages("nycflights13")


flights_edit <-flights %>% mutate( long_haul = if_else(air_time > (60*7),1,0))


flights_edit %>% group_by(long_haul) %>%  summarise(count = n()) 



popular_dests <- flights %>% 
  group_by(dest) %>% 
  filter(n() > 365)


 jfk_most_flights <- flights %>% 
  group_by(origin,carrier) %>% 
  summarise(count_flights = n()) %>%
  filter(origin == "JFK")


 flights %>%  pivot_longer()