#######  Multivariate Modelling

########### Calculating log returns

library(dplyr)
library(magrittr)

dlog <- Reits_Stocks %>% mutate(dlogret = log(BDH_Value) - log(lag(BDH_Value))) %>%
  mutate(scaledret = (dlogret - mean(dlogret, na.rm = T))) %>% filter(date > first(date)) %>% ungroup()

#Heteroskedasticity_tests
xts_daily_rtn <- dlog %>% tbl_xts(., cols_to_xts = "dlogret", spread_by = "Name")
xts_daily_rtn <- na.omit(xts_daily_rtn)

#####################Cleaning our daily returns using boudt###########################
xts_daily_rtn <- Return.clean(xts_daily_rtn, method = c("none", "boudt", "geltner")[2], alpha = 0.01)

#### DCCPRE###########
invisible(capture.output(DCCpre <- dccPre(xts_daily_rtn, include.mean = T, p = 0)))

Vol.dat <- DCCpre$marVol
colnames(Vol.dat) <- colnames(xts_daily_rtn)

############# Volatility modelling ####################

Vol.dat <- data.frame(
            cbind( date = as.Date(index(xts_daily_rtn)), Vol.dat)) %>% # Adding date column which dropped...
           mutate(date = as.Date(date)) %>% tbl_df()













