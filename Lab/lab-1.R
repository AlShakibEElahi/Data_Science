#this is first class

1+1
sqrt(9)
a<-9+3i
class(a) #returns data type

x<-9
y<-7
x+y
cat(a,x,y)
m<-5.59
floor(m)
ceiling(m)
xy<-c(3,5,6,7);
sd(xy) #returns standard deviation
range(xy) #returns upper and the lower case

name1 <- "Shakib"
class(name)
nchar(name)
length(x) #used for vector only
name2 <- "Elahi"
paste(name1,name2) #merge two strings with a space

#***** Where 'if' ends start 'else', don't go to next line
if(x>y){
  print("x is greater")
}else{
  print("x is lesser")
}

#while loop
i<-1
while(i<6){
  print(i)
  i<-i+1
}

#for loop
for (x in 1:10) {
  print(x)
}

#function with parameter
sum <-function(n1,n2){
  paste(n1,n2)
}

#user input
fn<-readline(prompt = "Enter first name: ")
sum(fn,name2)
