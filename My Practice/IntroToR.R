library(dslabs)

data("murders") #loads available data sets

class(murders) #class returns the data time of the parameter

str(murders) #str returns the structure of the object

head(murders) #head returns the 1st 6th records

pop <- murders$population #accessor '$' is used instead of (.)
length(pop)

class(murders$region) #factors -> to represent categorical data

names(murders)

#------------------------------Sorting-------------------------------#
sort(murders$total) #sort default ascending order

index<-order(murders$total) #order returns the index position according to ascending or descending order
rank(murders$total) #same like order... actually order returns the ranks

murders$abb[index] #order by index

#------------------------Arithmetic operation------------------------#
murder_rate <- (murders$total/murders$population)*100000
murders$state[order(murder_rate, decreasing = TRUE)]

#logical indexing
index<-murder_rate<=0.71
index
murders$state[index]

#---------------------------Data Wrangling---------------------------#
library("dplyr")

#mutate -> change data table by adding a column or changing a existing one
#mutate (data-frame, name in value)
murders <- mutate(murders, rate = total/population *100000)
names(murders)

#filter(data-frame, conditional arg)
filter(murders, rate<=0.7)

#select(data-frame, ver1, ver2...)
new_table <- select(murders, state, region, rate)
filter(new_table, rate<=0.7)

#pipe operands -> %>%
#data-frame %>% select(ver1, ver2, ...) %>% filter(condition)
murders %>% select(state, region, rate) %>% filter(rate<=0.7)

#----------------------------Basic Plots----------------------------#
#plot(x,y)
#hist(x)
#boxplot(x~y, data = data-frame)
boxplot(rate~region, data = murders)
