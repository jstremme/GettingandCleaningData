# GettingandCleaningData

## Repository Contents

1. README.md
2. run_analysis.R
2. CodeBook.md

## Introduction
  This repository contains my submission for the Getting and Cleaning Data Coursera course project.  In this project I cleaned the data found here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
according to the course instructions. The project dealt with data from testing the accelerometers and gyroscopes of the Samsung Galaxy S smartphone.
## run_analysis.R

  This script does the data cleaning for the project.  It reads in test and training data, combines test and training data, organizes the data into a table, extracting the means and standard deviations of the measurements taken, then outputs two tables into the working directory of the user.  The first output table is a tidied table of means and standard deviations  for the measurements taken, as well as the corresponding subject ID for the testing participant and activity performed by the participant with the smartphone for each observation. The second output table breaks down the means of all the entries in the first output table by each subject and activity.
## Codebook.md

  The codebook provides further details about the run_analysis.R script as well as descriptions for the variables in the output tables of the script.
