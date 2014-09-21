GettingData
===========
The following logic was used to create the tidy data set: <p>

1. Load libraries<p>
2. Load lookup tables and assign headers<p>
3. Load x_test file from test folder<p>
4. Convert list to data frame and transpose usign sapply function<p>
5. Use the Feature Description as the column names for the test_x data frame<p>
6. Get the IDs for activities from the y_test file<p>
7. Get ID for subjects from the subject test file<p>
8. Combine subject, activity, and test data into one big Test data set<p>
9. Apply column names<p>
10. Repeat steps 3-9 for the files in the Train folder<p>
11. Combine the data from Test and Train using rbind<p>
12. Convert data frame to a data table<p>

