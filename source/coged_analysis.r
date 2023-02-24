library(dplyr)
library(ggplot2)
library(reshape2)
library(stringr)

load("C:/Users/rer019/Projects/Koffein/data/data.Rda")

data$values.IP12 = str_replace_all(data$values.IP12, ',', '.')
data$values.IP12 = as.numeric(data$values.IP12)

data$values.IP13 = str_replace_all(data$values.IP13, ',', '.')
data$values.IP13 = as.numeric(data$values.IP13)

data$values.IP14 = str_replace_all(data$values.IP14, ',', '.')
data$values.IP14 = as.numeric(data$values.IP14)

data_mod <- melt(data, id.vars=c('script.subjectid', 'script.groupid'),
                  measure.vars=c('values.IP12', 'values.IP13', 'values.IP14'))

boxplot(data$values.IP14,
        main = "Indifference point",
        xlab = "Choice",
        ylab = "IP",
        col = "blue",
        border = "grey",
        horizontal = TRUE,
        notch = TRUE
)

p <- ggplot(data_mod) +
  geom_boxplot(aes(x=variable, y=value, color=variable))

# printing the plot
print(p)
