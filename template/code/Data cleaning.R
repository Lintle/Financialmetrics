#Project - Financial data Analysis
#Author: Lintle Balone

#DATA CLEANING AND FORMATTING SECTION

#Load data from the file (ensure that the data file is in the data file is in the current working directory)
dat <- readRDS("Reits.rds")
# View the first 6 rows of the data (Raw data)
head(dat)
# View a condensed summary of the data (Raw data)
str(dat)
dim(dat)

#clean data
clean_data <- dat

clean_data$Name <- NULL #remove Name column
clean_data$Group <- NULL #remove Group column
clean_data$LONG_COMP_NAME <- NULL #remove LONG_COMP_NAME column
clean_data$Currency <- NULL #remove currency column
write.csv(clean_data,'Reits.csv')
#view the first 6 rows of data (clean data)
head(clean_data)
# View a condensed summary of the data (clean data)
str(clean_data)
dim(clean_data)
