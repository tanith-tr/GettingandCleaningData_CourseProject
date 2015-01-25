# Getting and Cleaning Data - Course Project


The goal of this project is to prepare tidy data that can be used for later analysis.

The data used in this exercise represent data collected from the accelerometers from 
the Samsung Galaxy S smartphone. A full description is available at the site where the
data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


Data used in this project can be downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


In order to run the code unzip files to "UCIHAR" folder under your working directory. 
`run_analysis.R` should 
also be placed in your working directory.

The R script called run_analysis.R does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of
each variable for each activity and each subject.


You can find additional information about the variables, data and transformations in `CodeBook.md` 
file.