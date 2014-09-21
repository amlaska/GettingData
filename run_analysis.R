## Load libraries
library(reshape2)
library(data.table)

## Load all files into variables from train folder

## Load lookup tables and assign headers
activity_labels<-read.table("activity_labels.txt", header=FALSE)
colnames(activity_labels)<-c("activity_ID", "activity_Desc") 
features<-read.table("features.txt", header=FALSE)
colnames(features)<-c("feature_ID", "feature_Desc") 

## Load fact tables from test folder
x_test<-c(read.table("test/X_test.txt", header = FALSE))

## Convert list to data frame and transpose
test_x<-data.frame(sapply(x_test, c))

## Make column names the Feature Description
colnames(test_x)<-features$Feature_Desc

## Get ID for labels
test_y<-c(read.table("test/y_test.txt", header = FALSE))

## Get ID for subjects
subject_test<-c(read.table("test/subject_test.txt", header = FALSE))

## Combine subject, activity, and test data into one big Test data set
test_set<-cbind(test_y, subject_test, test_x)

## Apply column names
colnames(test_set)<-c("activity_id", "subject_id", colnames(test_x))

## Load fact tables from train folder
x_train<-c(read.table("train/X_train.txt", header = FALSE))

## Convert list to data frame and transpose
train_x<-data.frame(sapply(x_train, c))

## Make column names the Feature Description
colnames(train_x)<-features$Feature_Desc

## Get ID for labels
train_y<-c(read.table("train/y_train.txt", header = FALSE))

## Get ID for subjects
subject_train<-c(read.table("train/subject_train.txt", header = FALSE))

## Combine subject, activity, and test data into one big Train data set
train_set<-cbind(train_y, subject_train, train_x)

## Apply column names
colnames(train_set)<-c("activity_id", "subject_id", colnames(train_x))

## Combine data sets
big_set<-rbind(test_set, train_set)

## Convert to data table for easier manipulation
big_set<-as.data.table(big_set)
activity_lables<-as.data.table(activity_labels)

## Filter columns to only include mean and standard deviation calculations
