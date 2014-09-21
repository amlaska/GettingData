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

