GettingData
===========
The following logic was used to create the tidy data set:
1. Load libraries
2. Load lookup tables and assign headers
3. Load x_test file from test folder
4. Convert list to data frame and transpose usign sapply function
5. Use the Feature Description as the column names for the test_x data frame
6. Get the IDs for activities from the y_test file
7. Get ID for subjects from the subject test file
8. Combine subject, activity, and test data into one big Test data set
9. Apply column names
10. Repeat steps 3-9 for the files in the Train folder
11. Combine the data from Test and Train using rbind
12. Convert data frame to a data table

