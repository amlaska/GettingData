GettingData
===========
The goal of run_analysis.R is to perform the following tasks: <p>
1. Merge the training and the test sets to create one data set. <br>
2. Extract only the measurements on the mean and standard deviation for each measurement. <br>
3. Use descriptive activity names to name the activities in the data set. <br>
4. Appropriately label the data set with descriptive variable names. <br>
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. <p>
 
The data for the project can be downloaded from:<p>

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip <p>

A description of the data can be found here:<p>

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones<p>

For each of the data sets, there is a set of activity labels (found in the y_test.txt and y_train.txt files) that can be joined against the values in the activity_labels.txt file to get the meaningful names for each of the activities the subjects performed. The results of the study are stored in variables in the x_test.txt and x_train.txt files.<p>



The following logic was used to create the tidy data set: <p>

1. Load libraries<br>
2. Load lookup tables and assign headers<br>
3. Load x_test file from test folder<br>
4. Convert list to data frame and transpose usign sapply function<br>
5. Use the Feature Description as the column names for the test_x data frame<br>
6. Get the IDs for activities from the y_test file<br>
7. Get ID for subjects from the subject test file<br>
8. Combine subject, activity, and test data into one big Test data set<br>
9. Apply column names<br>
10. Repeat steps 3-9 for the files in the Train folder<br>
11. Combine the data from Test and Train using rbind<br>
12. Convert data frame to a data table<br>
13. Create an index list to contain the ID fields and just those fields that are calculations of mean and standard deviation using the *mean()* and *std()* as the text filter on the column name array<br>
14. Filter columns to only include mean and standard deviation calculations <br>
15. Calculate the mean for each variable by activity and subject <br>
16. Join the mean_set to the activity name in the activity_labels table <br>
17. Write the final_set data table to the final_set.csv file<p>

<h2>Code Book</h2>
Factors<p>
activity_id: The integer identifier for activities performed during the study<br>
activity_Desc: Character description of each activity<br>
subject_id: The integer identifier for each subject in the study<p>

Variables: Numberic data calculated as the mean for each activity and subject<p>
tBodyAcc-mean()-X.mean<br>
tBodyAcc-mean()-Y.mean<br>
tBodyAcc-mean()-Z.mean<br>
tGravityAcc-mean()-X.mean<br>
tGravityAcc-mean()-Y.mean<br>
tGravityAcc-mean()-Z.mean<br>
tBodyAccJerk-mean()-X.mean<br>
tBodyAccJerk-mean()-Y.mean<br>
tBodyAccJerk-mean()-Z.mean<br>
tBodyGyro-mean()-X.mean<br>
tBodyGyro-mean()-Y.mean<br>
tBodyGyro-mean()-Z.mean<br>
tBodyGyroJerk-mean()-X.mean<br>
tBodyGyroJerk-mean()-Y.mean<br>
tBodyGyroJerk-mean()-Z.mean<br>
tBodyAccMag-mean().mean<br>
tGravityAccMag-mean().mean<br>
tBodyAccJerkMag-mean().mean<br>
tBodyGyroMag-mean().mean<br>
tBodyGyroJerkMag-mean().mean<br>
fBodyAcc-mean()-X.mean<br>
fBodyAcc-mean()-Y.mean<br>
fBodyAcc-mean()-Z.mean<br>
fBodyAcc-meanFreq()-X.mean<br>
fBodyAcc-meanFreq()-Y.mean<br>
fBodyAcc-meanFreq()-Z.mean<br>
fBodyAccJerk-mean()-X.mean<br>
fBodyAccJerk-mean()-Y.mean<br>
fBodyAccJerk-mean()-Z.mean<br>
fBodyAccJerk-meanFreq()-X.mean<br>
fBodyAccJerk-meanFreq()-Y.mean<br>
fBodyAccJerk-meanFreq()-Z.mean<br>
fBodyGyro-mean()-X.mean<br>
fBodyGyro-mean()-Y.mean<br>
fBodyGyro-mean()-Z.mean<br>
fBodyGyro-meanFreq()-X.mean<br>
fBodyGyro-meanFreq()-Y.mean<br>
fBodyGyro-meanFreq()-Z.mean<br>
fBodyAccMag-mean().mean<br>
fBodyAccMag-meanFreq().mean<br>
fBodyBodyAccJerkMag-mean().mean<br>
fBodyBodyAccJerkMag-meanFreq().mean<br>
fBodyBodyGyroMag-mean().mean<br>
fBodyBodyGyroMag-meanFreq().mean<br>
fBodyBodyGyroJerkMag-mean().mean<br>
fBodyBodyGyroJerkMag-meanFreq().mean<br>
tBodyAcc-std()-X.mean<br>
tBodyAcc-std()-Y.mean<br>
tBodyAcc-std()-Z.mean<br>
tGravityAcc-std()-X.mean<br>
tGravityAcc-std()-Y.mean<br>
tGravityAcc-std()-Z.mean<br>
tBodyAccJerk-std()-X.mean<br>
tBodyAccJerk-std()-Y.mean<br>
tBodyAccJerk-std()-Z.mean<br>
tBodyGyro-std()-X.mean<br>
tBodyGyro-std()-Y.mean<br>
tBodyGyro-std()-Z.mean<br>
tBodyGyroJerk-std()-X.mean<br>
tBodyGyroJerk-std()-Y.mean<br>
tBodyGyroJerk-std()-Z.mean<br>
tBodyAccMag-std().mean<br>
tGravityAccMag-std().mean<br>
tBodyAccJerkMag-std().mean<br>
tBodyGyroMag-std().mean<br>
tBodyGyroJerkMag-std().mean<br>
fBodyAcc-std()-X.mean<br>
fBodyAcc-std()-Y.mean<br>
fBodyAcc-std()-Z.mean<br>
fBodyAccJerk-std()-X.mean<br>
fBodyAccJerk-std()-Y.mean<br>
fBodyAccJerk-std()-Z.mean<br>
fBodyGyro-std()-X.mean<br>
fBodyGyro-std()-Y.mean<br>
fBodyGyro-std()-Z.mean<br>
fBodyAccMag-std().mean<br>
fBodyBodyAccJerkMag-std().mean<br>
fBodyBodyGyroMag-std().mean<br>
fBodyBodyGyroJerkMag-std().mean<br>
