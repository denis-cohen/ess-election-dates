library(tidyverse)
library(foreign)

ESS9 <- read.spss("../../Dropbox (FAMSIZEMATTERS)/FamilySizeDataProject/SexComposition/Analysis/data/ESS9e03_1.sav", to.data.frame = T, use.value.labels = F)
load("ess_election_dates.RData")

# Add missing data -------------------------------------------------------------
ess_election_dates$recent_election[ess_election_dates$cntry == "BG" & ess_election_dates$essround == 9] <- "2017-03-26"
ess_election_dates$recent_election[ess_election_dates$cntry == "EE" & ess_election_dates$essround == 5] <- "2015-03-01"
ess_election_dates$recent_election[ess_election_dates$cntry == "RS" & ess_election_dates$essround == 9] <- "2016-04-24"

dates_added <- data.frame(
  cntry = c("AT", "AT", "DK", "ES", "HR", "IS", "LT", "LV", "PT", "SE", "SK"),
  essround = c(4, 5, 9, 9, 9, 9, 9, 9, 9, 9, 9),
  # manual imputation
  recent_election = as.Date(c("2008-09-28", "2008-09-28", "2015-06-18", "2019-11-10", "2016-09-11", "2017-10-28", "2016-10-09", "2018-10-06", "2015-10-04", "2018-09-09", "2016-03-05")),
  split_wave = rep(NA, 11),
  recent_election_split1 = as.Date(rep(NA, 11)),
  max_days_since_election_split1 = rep(NA, 11)
)

field_date <- ESS9 %>% 
  mutate(field_start = paste(inwyys, inwmms, inwdds, sep = "-"),
         field_end = paste(inwyye, inwmme, inwdde, sep = "-")) %>% 
  group_by(cntry) %>%
  summarise(field_start = min(field_start, na.rm = T),
            field_end = max(field_end, na.rm = T)) %>% 
  mutate(field_start = as.Date(field_start),
         field_end = as.Date(field_end),
         essround = 9)
    
dates_added <- dates_added %>% 
  left_join(field_date, by = c("cntry", "essround")) %>% 
  mutate(max_days_since_election = round(difftime(field_end, recent_election, units = "days")))

ess_election_dates_added <- ess_election_dates %>% 
  bind_rows(dates_added) %>% 
  arrange(cntry, essround)
save(ess_election_dates_added, file = "ess_election_dates_added.RData")
write.csv(ess_election_dates_added, "ess_election_dates_added.csv")
