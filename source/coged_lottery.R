load("C:/Users/rer019/Projects/Koffein/data/data.Rda")
data$values.winAmountTotal = str_replace_all(data$values.winAmountTotal, ',', '.')

data$values.winAmountTotal = as.numeric(data$values.winAmountTotal)
# for each script.subjectid, calculate average values.winAmountTotal

dfwin=aggregate (values.winAmountTotal ~ script.subjectid, data, sum)
colnames(dfwin) <- c('subject','win')

dfwin$win = as.integer(dfwin$win)

dfwin$cumsum=cumsum(dfwin$win)
set.seed(666) 
winningTicket = as.integer(runif(1, 1, max(dfwin$cumsum)))

print(winningTicket)

