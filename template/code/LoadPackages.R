LoadPackages <- function(){
  
  library(rmsfuns)
  
  corepacks <- c("tidyverse","tidyselect", "RcppRoll", "ggplot2", "lubridate", "tidyr", "stats", "magrittr", "dplyr",
                 "ggthemes", "purrr", "tbl2xts", "xts", "MTS", "devtools", "rugarch","robustbase","tseries", "forecast", "PerformanceAnalytics", "xtable","readxl","ggthemes","ggsci","gridExtra")
  
  load_pkg(corepacks)
  
}

