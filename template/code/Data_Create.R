
  clean_data <- dat
  
  clean_data$Ticker <- NULL #remove Name column
  clean_data$Group <- NULL #remove Group column
  clean_data$LONG_COMP_NAME <- NULL #remove LONG_COMP_NAME column
  clean_data$Currency <- NULL #remove currency column
  write.csv(clean_data,"data/clean_data.csv")


