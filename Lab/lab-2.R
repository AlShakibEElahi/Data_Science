#vector c(val1, ...)
#indexing start with '1', not '0'
a<-c(4,3,2,1)
a
length(a)

ch<-c('ss','r')
nchar(ch)

sum(a)
b=a+2
sum(b)
a+b
c=b*3;
sum(c)
sum(a,b,c)

min(c)
max(c)
sort(c)
c[1]

mymat <- matrix(1:16,nrow = 4, ncol = 4, byrow = TRUE)
mymat
mymat[2,]
mymat[,2]

#array declaration c(row, column, dimension)
myarr <- array(1:24,c(2,3,2))
myarr

#data-frame 
pID <- c(101,102,103)
name <- c("Elahi","Shakib","Rion")
diab<- c(5.5,.6,10.5)
mydata <- data.frame(pID, name, diab)
mydata

mean(mydata$pID)


