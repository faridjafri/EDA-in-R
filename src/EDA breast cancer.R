#  Course          : CS 513 Knowledge Discovery and Data Mining
#  First Name      : Farid
#  Last Name       : Jafri
#  CWID            : 10453907
#  Purpose         : HW02_EDA

rm(list=ls())

#Loading breast-cancer-wisconsin.data.csv
breast_cancer_data=read.csv(file.choose())
View(breast_cancer_data)

#Summarizing each column except Sample number
summary(breast_cancer_data[,-1])

#Replacing missing values ? with NA and listing down the row numbers for each column
breast_cancer_data[breast_cancer_data == "?"] <- NA
apply(is.na(breast_cancer_data[,-1]),2,which)

#Replacing missing values in each column with mean of that column except Sample and Class
str(breast_cancer_data)
for(i in 2:ncol(breast_cancer_data)-1){
  breast_cancer_data[is.na(breast_cancer_data[,i]), i] <- as.integer(mean(as.numeric(breast_cancer_data[,i]), na.rm = TRUE))
}
#breast_cancer_data[is.na(breast_cancer_data[,7]),7] <- as.integer(mean(as.numeric(breast_cancer_data[,7]),na.rm=TRUE))

#Frequency table of Class vs F6
table(breast_cancer_data$Class, breast_cancer_data$F6)

#Displaying scatter plot of F1 to F6
pairs(breast_cancer_data[2:7])

#Displaying histogram box plot for columns F7 to F9
?hist
hist(breast_cancer_data$F7)
hist(breast_cancer_data$F8)
hist(breast_cancer_data$F9)

#Deleting all objects from R-environment, reloading data and removing all rows with missing values
rm(list=ls())
breast_cancer_data=read.csv(file.choose())
breast_cancer_data[breast_cancer_data == "?"] <- NA
breast_cancer_data<-na.omit(breast_cancer_data)
View(breast_cancer_data)