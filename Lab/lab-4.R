dataframe<-read.csv("D:/Codes/Data_Science/Datasets/data.csv",header=TRUE,sep=",")
dataframe
sd(dataframe$Loan)

library(dplyr)
dataframe %>% summarise_if(is.numeric,sd)

library(matrixStats)

dataframe$Score = rowSds(as.matrix(dataframe[,c(2,3)]))
dataframe

mydata <- edit(dataframe)
colSums((is.na(mydata)))

which(is.na(mydata$interest_rate))

remove<-na.omit(mydata)
remove


#### project -> apply data preparation sreps

