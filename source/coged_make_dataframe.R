library(tibble)
library(stringr)

#gets list of data files
listoffiles=list.files(path="C:\\Users\\rer019\\Desktop\\pilot_reliability", pattern="singletasknbackntlx_2022_EG_summary", all.files=FALSE,full.names=TRUE)

#loads first data file into data frame
filename= listoffiles[[1]][1]
data=read.table(filename,header=TRUE)

#loops through and loads in files 
for (filename in listoffiles)
{
  tempdata=read.table(filename,header=TRUE)
  data=rbind(data, tempdata)
}

#deletes duplicate first row
data = data[-1,]


#clean up mistakes in data 
data[3, 4]="T3"
data[8,4]="T2"

save(data,file="C:\\Users\\rer019\\Projects\\Koffein\\data\\data.Rda")