CleaningData
============

Coursera course Project for Getting and Cleaning Data
###########################################
This file gives instructions how to run
programme and explains what it does
Author : TL
Date : 25/07/2014
The script runs on Windows machines 
###########################################
The script is in a file called run_analysis.r
to call this script set r working directory to where
you have saved the script.
Now use the following command to get it to your r workspace
         
		 
		 source("run_analysis.r")
		 
call function using the command below no parameters are required.
But you should have permission to create directories in your computer
and have access to the internet

         myscript()
		 
		
#############################################
Alternatively you can copy the content within {}
of the function and paste it to your r workspace

##############################################
Script
downloads necessary data from URL "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if there is no directory called data creates  one and stores the downloaded file there
unzip the file
reads test and trainig data sets
mergs data and fullset has 561 columns and 10299 rows
read Y_test.txt data - this file to get activities
combines these data sets 
reads who the subject was in these experiments
combines that data in to the full set
###################################################################################
	# Please NOTE:
	# I am doing steps 3 and 4 ahead of 2 so that I have complete tidy dataset easily
####################################################################################
we match values of the column with  activity in the dataset with descriptive activity names
by reading activity_labels.txt
appropriately labels the data set with descriptive variable names read from features.txt
but these feature names are modified so that they are self explanatory - see codebook for full details	
Extracts only the measurements on the mean and standard deviation for each measurement.
	# There are these measurements tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, 
	# tBodyGyroJerk-XYZ, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag,
	# fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag
	# for each of these mean and std needs to be extracted - that is there will be 66 columns to be extracted
	# features.txt file show the column numbers and what each column contains
	# since we are looking for mean and standard deviation I selected all names that ends with mean() and std()
TidySet contains the mean and std data for the measurements
along with subject, activitylabel and activity name
66 columns of mean and std data plus 3 colums 	
