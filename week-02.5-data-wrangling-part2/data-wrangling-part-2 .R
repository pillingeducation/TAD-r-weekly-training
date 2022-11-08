library(nycflights13)
library(tidyverse)


flights_edit <-flights %>% mutate( long_haul = if_else(air_time > (60*7),1,0))


flights_edit %>% group_by(long_haul) %>%  summarise(count = n()) 



popular_dests <- flights %>% 
  group_by(dest) %>% 
  filter(n() > 365)


 jfk_most_flights <- flights %>% 
  group_by(origin,carrier) %>% 
  summarise(count_flights = n()) %>%
  filter(origin == "JFK")

 
 flight_delay <- flights %>% mutate(total_delay = dep_delay + arr_delay)
 
 flight_delay %>% mutate(refund = if_else(total_delay < -30, 1, 0))
 
 flight_delay %>% mutate(refund_groups = case_when (total_delay < -60 ~ 1,
                                                    total_delay < -30 ~ 2,
                                                    total_delay < 0 ~ 3,
                                                    TRUE ~ 0 ,)) %>% count(refund_groups)

 
 flights %>% group_by(dest) %>%  summarise(delayed_flights = sum(if_else(dep_delay < 0,1,0), na.rm = T))
 
 
 
 flights %>%
   left_join(airports %>% select(faa,name), by = c("dest" = "faa")) %>%
   rename(dest_airport = name)
a <- flights %>%
  left_join(airports %>% select(faa,name), by = c("dest" = "faa")) %>%
  rename(dest_airport = name) 
