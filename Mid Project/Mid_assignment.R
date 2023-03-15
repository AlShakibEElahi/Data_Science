library(dplyr)
library(readxl)
dataframe<-read_excel("D:/Codes/Data_Science/Datasets/Dataset_midterm.xlsx")
summary(dataframe)
#----------------------------------------------------------------------------#
#--------------------------------Age Section---------------------------------#
#----------------------------------------------------------------------------#
which(is.na(dataframe$Age))

mn_age<-mean(dataframe$Age, na.rm = TRUE)
mdian_age<-median(dataframe$Age, na.rm = TRUE)
md_tage <- table(dataframe$Age)
md_age<-names(which.max(md_tage))

print(paste("Mean: ",mn_age))
print(paste("Median: ",mdian_age))
print(paste("Mode: ",md_age))

dataframe<-dataframe %>%
  group_by(Delivery_number) %>%
  mutate(Age = ifelse(is.na(Age), floor(median(Age, na.rm = TRUE)) , Age)) %>% 
  ungroup()

summary(dataframe$Age)

sds_age<-sd(dataframe$Age, na.rm = TRUE)
sds_age
dataframe$zScore <- ((dataframe$Age-mn_age)/sds_age)

minZ<-min(dataframe$zScore)
maxZ<-max(dataframe$zScore)
print(paste("Minimum Z-Score: ",minZ))
print(paste("Maximum Z-Score: ",maxZ))

df <- subset(dataframe, dataframe$zScore<=abs(minZ))
hist(df$Age)
summary(df$Age)

df$zScore<-NULL

#----------------------------------------------------------------------------#
#-------------------------------Weight Section-------------------------------#
#----------------------------------------------------------------------------#
which(is.na(df$`weight(kg)`))

mnw<-mean(df$`weight(kg)`, na.rm = TRUE)
mdianw<-median(df$`weight(kg)`, na.rm = TRUE)
md_tw <- table(df$`weight(kg)`)
mdw<-names(which.max(md_tw))

mnw;mdianw;mdw

df<-df %>%
  mutate(`weight(kg)` = ifelse(is.na(`weight(kg)`), median(`weight(kg)`, na.rm = TRUE) , `weight(kg)`))

summary(df$`weight(kg)`)

which(is.na(dataframe$`weight(kg)`))

df<-df %>%
  mutate(`weight(kg)` = ifelse(is.na(`weight(kg)`), floor(median(`weight(kg)`, na.rm = TRUE)) , `weight(kg)`))

summary(df$`weight(kg)`)

sdsw<-sd(df$`weight(kg)`, na.rm = TRUE)
sdsw
df$zScore <- ((df$`weight(kg)`-mnw)/sdsw)

minZW<-min(df$zScore)
maxZW<-max(df$zScore)
print(paste("Minimum Z-Score: ",minZW))
print(paste("Maximum Z-Score: ",maxZW))

hist(df$`weight(kg)`)
df$zScore<-NULL

#----------------------------------------------------------------------------#
#--------------------------Delivery_Number Section---------------------------#
#----------------------------------------------------------------------------#

which(is.na(df$Delivery_number))

mndn<-mean(df$Delivery_number, na.rm = TRUE)
mdiandn<-median(df$Delivery_number, na.rm = TRUE)
md_tdn <- table(df$Delivery_number)
mddn<-names(which.max(md_tdn))

mndn;mdiandn;mddn

df<-df %>% 
  mutate(Delivery_number = ifelse(is.na(Delivery_number), as.integer(mddn) , Delivery_number))

summary(df$Delivery_number)
hist(df$Delivery_number, breaks = c(0,1,2,3,4))

#----------------------------------------------------------------------------#
#---------------------------Delivery time Section----------------------------#
#----------------------------------------------------------------------------#

which(is.na(df$Delivery_time))

mnt<-mean(df$Delivery_time, na.rm = TRUE)
mdiant<-median(df$Delivery_time, na.rm = TRUE)
md_tt <- table(df$Delivery_time)
mdt<-names(which.max(md_tt))

mnt; mdiant;mdt
df<-df %>% 
  mutate(Delivery_time = ifelse(is.na(Delivery_time), as.integer(mdt), Delivery_time))

summary(df$Delivery_time)
hist(df$Delivery_time)

#----------------------------------------------------------------------------#
#-------------------------------Blood Section--------------------------------#
#----------------------------------------------------------------------------#

which(is.na(df$Blood))

md_tb <- table(df$Blood)
mdb<-names(which.max(md_tb))

mdb

df<-df %>% 
  mutate(Blood = ifelse(is.na(Blood), mdb , Blood))

df$Blood<-as.numeric(factor(df$Blood,levels = c("low","normal","high"), labels = c(0,1,2)))

summary(df$Blood)
hist(df$Blood)

#----------------------------------------------------------------------------#
#-----------------------------Ceasarian Section------------------------------#
#----------------------------------------------------------------------------#

#as this is totally dependent on medial history
mydata<-na.omit(df)
summary(mydata)
hist(mydata$Caesarian, breaks = c(-1,0,1))

