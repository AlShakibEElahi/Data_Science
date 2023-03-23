library(readxl)
#k-NN formula is applied in the excel sheet 
#this is for understanding how k-NN works
dataframe<-read_excel("D:/Codes/Data_Science/Datasets/k-NN.xlsx")
dataframe

mydata<-dataframe[order(dataframe$Dist),]
data1 <- mydata[1:3,]
ans1<-names(which.max(table(mydata$Class)))
ans1

