## Load libraries
library(reshape2)
library(data.table)
library(plyr)
## Load lookup tables and assign headers
activity_labels<-read.table("activity_labels.txt", header=FALSE)
colnames(activity_labels)<-c("activity_id", "activity_Desc") 
features<-read.table("features.txt", header=FALSE)
colnames(features)<-c("feature_ID", "feature_desc") 

## Load x_test file from test folder
x_test<-c(read.table("test/X_test.txt", header = FALSE))

## Convert list to data frame and transpose
test_x<-data.frame(sapply(x_test, c))

## Make column names the Feature Description
colnames(test_x)<-features$feature_desc

## Get ID for labels
test_y<-c(read.table("test/y_test.txt", header = FALSE))

## Get ID for subjects
subject_test<-c(read.table("test/subject_test.txt", header = FALSE))

## Combine subject, activity, and test data into one big Test data set
test_set<-cbind(subject_test, test_y, test_x)

## Apply column names
colnames(test_set)<-c("subject_id", "activity_id", colnames(test_x))

## Load fact tables from train folder
x_train<-c(read.table("train/X_train.txt", header = FALSE))

## Convert list to data frame and transpose
train_x<-data.frame(sapply(x_train, c))

## Make column names the Feature Description
colnames(train_x)<-features$feature_desc

## Get ID for labels
train_y<-c(read.table("train/y_train.txt", header = FALSE))

## Get ID for subjects
subject_train<-c(read.table("train/subject_train.txt", header = FALSE))

## Combine subject, activity, and test data into one big Train data set
train_set<-cbind(subject_train, train_y, train_x)

## Apply column names
colnames(train_set)<-c("subject_id", "activity_id", colnames(train_x))

## Combine data sets
big_set<-rbind(test_set, train_set)
colnames(big_set)<-c(colnames(train_set))

## Convert to data table for easier manipulation
big_set<-as.data.table(big_set)
activity_labels<-as.data.table(activity_labels)

## Create an index list to contain the ID fields and just those fields that are calculations of mean 
## and standard deviation
filtered_columns<-c(grep("*_id*", colnames(big_set)), grep("*mean()*", colnames(big_set)), grep("*std()*", colnames(big_set)))
col_for_mean<-c(grep("*mean()*", colnames(big_set)), grep("*std()*", colnames(big_set)))
## Filter columns to only include mean and standard deviation calculations
filtered_set<-big_set[, c(filtered_columns), with=FALSE]
filtered_cols<-colnames(filtered_set)
## Calculate the mean for each variable by activity and subject
mean_set<-filtered_set[, sapply(.SD, function(x) list(mean=mean(x))), by=list(activity_id, subject_id)]

## Join the mean_set to the activity name in the activity_labels table
final_set<-join(activity_labels, mean_set, type="inner")


## Write file out to text file
write.csv(final_set, file="final.csv")