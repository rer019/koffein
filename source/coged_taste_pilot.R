library(tibble)
filename = "C:\\Users\\rer019\\Downloads\\ED_2022_TROMS??_FALL_T1_February+10,+2023_14.31.csv"

data=read.csv(filename, header=TRUE)

data_caf = data["Q1_1.1"]
data_sugar = data["Q1_2.1"]
data_ID = data["Q1"]

data_belief <- data.frame(data_ID, data_caf, data_sugar)
data_belief = data_belief[-(1:2),]
data_belief = data_belief[!apply(data_belief,1, function(x) any(x=="")),]
names(data_belief)= c("ID", "Caffeine", "Sugar")