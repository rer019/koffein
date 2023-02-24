library(dplyr)
library(ggplot2)
library(reshape2)
library(stringr)

load("C:/Users/rer019/Projects/Koffein/data/data.Rda")


#data %>%  mutate(across(c(values.IP12 , values.IP13), function(x) str_replace_all(x, ',', '.')))

for(columnname in names(data)) {       
  #data[ , i] <- data[ , i] + 10
  if(startsWith(columnname,"values.completed")){
    print(columnname)
  }
  else if(startsWith(columnname,"values")){
    print(columnname)
    data[columnname] = str_replace_all(data[columnname], ',', '.')
    data[columnname] = as.numeric(data[columnname])
  }
}