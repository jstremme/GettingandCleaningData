
# Code Book
## Introduction to run_analysis.R
  The run_analysis.R script merges the training and test data from the UCI HAR Dataset containing data about testing the accelerometers and gyroscopes of the Samsung Galaxy S smartphone.  It then picks out only the measurements on the mean and standard deviation for each measurement and saves the results to a table with descriptive variable names for each column.  It then replaces the activty ID numbers in the table with descriptive variable names, detailing for each observation in the table, what activity each subject performed to test the accelerometers and gyroscopes of the Samsung Galaxy S smartphones. Finally, the script outputs two tables into the working directory of the user. The first output table is a tidied table of means and standard deviations for the measurements taken, as well as the corresponding subject ID and activity performed with the smartphone for each observation. The second output table breaks down the means of all the entries in the first output table by each subject and activity.
## Variables
  The variables in the output tables include 

