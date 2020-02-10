
summary <- psych::describeBy(clean_data$BDH_Value, clean_data$Name, mat = TRUE)

top_n_limit <- 10

hp <- summary %>% 
  mutate(rank = mean %>% 
           desc() %>% 
           min_rank()) %>%
  filter(rank <= top_n_limit) %>%
  arrange(rank)
hp <- hp$group1


lower_n_limit <- 40

lp <- summary %>% 
  mutate(rank = mean %>% 
           desc() %>% 
           min_rank()) %>%
  filter(rank >= lower_n_limit) %>%
  arrange(rank)
lp <- lp$group1

hp_stocks <- daily_rtn[daily_rtn$Name %in% hp,]
lp_stocks <- daily_rtn[daily_rtn$Name %in% lp,]
za_stocks <- daily_rtn %>% filter(Name == "MXZA0RL")
Reits_Stocks <- rbind(hp_stocks, lp_stocks, za_stocks)
