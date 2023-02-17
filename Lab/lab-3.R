#to level up categorical data
a<-factor(c("A","A+","B","B+"))

#list
g<-"My 1st list"
h<-c(2,2,3,4,5)
j<-matrix(1:20,nrow=5)
k<-c("one","two","three")
mlist<-list(title=g,ages=h,j,k)
mlist

itm<-append(mlist,"Orange", after=1)

#to delete, assign new veriable and give - in the dedicated index
newitm<-itm[-2]
newitm

#edit-> direct data entry
mydata<-data.frame(age=numeric(0),gender=character(0),weight=numeric(0))
mydata<-edit(mydata)
mydata

#data-frame import syntax <- read.csv("file location", header=TRUE, sep="delimiter")
dataframe<-read.csv("D:/data.csv",header=TRUE,sep=",")
dataframe
names(dataframe)

newdata<-edit(dataframe)

#concerting new rows data into Factor
newdata$gender<-factor(newdata$gender,levels = c(1,2), labels = c("male","female"))

