
daily_rtn <- clean_data %>% 
  mutate(Return = BDH_Value/lag(BDH_Value) - 1) %>% 
mutate(Return = coalesce(Return,0)) %>% ungroup()

# Calculation of returns
#Year_Month <- function(x) format(as.Date(x), "%Y_%B")
#Cols_to_Gather <- dat %>% select_if(is.numeric) %>% names

Weekly_Return <- clean_data %>% arrange(date)  %>% group_by(Name) %>% 
  mutate(WeeklyReturn = BDH_Value/lag(BDH_Value) - 1) %>% 
  mutate(WeeklyReturn = coalesce(WeeklyReturn,0)) %>%  ungroup()
  





