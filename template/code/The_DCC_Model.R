
#-------------------------------The DCC MODEL------------------

#The first step in this analysis is to save the residuals.

stdresd <- DCCpre$sresi


#we can now use these residuals to calculate the DCC model.
# Firstly we detach the following 

library(tidyverse)
library(rmsfuns)
library(tbl2xts)
library(MTS)
library(rmsfuns)
library(dplyr)


detach("package:tidyverse", unload=TRUE)
detach("package:rmsfuns", unload=TRUE)
detach("package:tbl2xts", unload=TRUE)


# Estimates of DCC
DCC <- dccFit(stdresd, type = "standard")


#From the dcc estimates we can create a the bivariate time-varying correlations plot with South A frica from our DCC model:
Rhot <- DCC$rho.t

ReturnSeries = xts_daily_rtn
DCC.TV.Cor = Rhot


#We can create a function called renaming

renamingdcc <- function(ReturnSeries, DCC.TV.Cor) {
  
  ncolrtn <- ncol(ReturnSeries)
  namesrtn <- colnames(ReturnSeries)
  paste(namesrtn, collapse = "_")
  
  nam <- c()
  xx <- mapply(rep, times = ncolrtn:1, x = namesrtn)

  # testing stage
 #  library(timetk)
 #  # get tickers of interest
 #  interets_tickers <- names(Vol.dat)[-1] # remove date
 #  
 #  dcc_dat <-ReturnSeries %>% 
 #            tk_tbl(rename_index = "time") %>%
 #            select(interets_tickers,time) %>% 
 #            pivot_longer(starts_with("M"),names_to = "ticker", values_to = "rho") %>% 
 #            group_by(ticker) 
 # g1<- ggplot(dcc_dat, aes(time, return, color = ticker))+
 #      geom_line() +
 #      theme_hc() +
 #      ggtitle("Dynamic Conditional Correlations: MXZA0RL")
 #  
  #We thereforedesigning a nested for loop to save the names corresponding to the columns of interest

nam <- c()
for (j in 1:(ncolrtn)) {
  for (i in 1:(ncolrtn)) {
    nam[(i + (j-1)*(ncolrtn))] <- paste(xx[[j]][1], xx[[i]][1], sep="_")
  }
}
colnames(DCC.TV.Cor) <- nam


#the we append the date coloumn
# date1 <- ReturnSeries %>% tk_tbl(rename_index = "time")
# date1 <- select(date1,"time")

DCC.TV.Cor <- 
  data.frame( cbind( date = index(ReturnSeries), DCC.TV.Cor)) %>% # Add date column which dropped away...
  mutate(date = as.Date(date))%>%
  tbl_df() 

#DCC.TV.Cor <- DCC.TV.Cor %>% gather(Pairs, Rho, -date)
Pairs <- DCC.TV.Cor %>% pivot_longer(starts_with("M"),names_to = "ticker", values_to = "rho")

Pairs

}

Rhot <- 
  renamingdcc(ReturnSeries = xts_daily_rtn, DCC.TV.Cor = Rhot)


head(Rhot %>% arrange(date))

###Lets now create a plot for South AFrican Reits relative to the other stocks.
g1 <- 
  ggplot(Rhot %>% filter(str_detect(ticker, "MXZA0RL_") == TRUE) ) +
  geom_line(aes(x = date, y = rho, colour = ticker)) +
  theme_hc() +
  ggtitle("Dynamic Conditional Correlations: MXZA0RL")

print(g1)


