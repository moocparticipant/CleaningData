#run_analysis.R
myscript <- function(){
	#download data from URL
	dataFileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	#I am using Windows so https is removed and replaced with http curl does not work in my machine
	if (!file.exists(".\\data")){dir.create(".\\data")}#if there is no directory called data create one
	#now store downloaded file in data directory
	download.file(dataFileURL, destfile = ".\\data\\data.zip", mode ="wb")#mode set to "wb" because this is binary data
	unzip (".\\data\\data.zip")
	fileList = list.files()
	if  (!"UCI HAR Dataset" %in% fileList)
	  return
	#if we come here that means the folder exists that means unzip has worked :)

	#now read test data set
	test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
	#now read the training data set
	train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
	# now both trainging and test data sets are read
	#-----------------------------------------------------------------
	# next we have to merge them into one BIG dataset
	# 1. Merges the training and the test sets to create one data set.
	#-----------------------------------------------------------------
	fullset <- rbind(test, train) #first put test set next train set
	#now two data sets are merged and fullset has 561 columns and 10299 rows
	
	# This dataset lacks details of who took part in the activity and what the activity was
	# So we need to read some more files and combine the data
	# read Y_test.txt data - this file contains activities for which the data is recorded in X_test.txt dataset
	testY <- read.table(".\\UCI HAR Dataset\\test\\Y_test.txt")
	# read Y_train.txt data - this file contains activities for which the data is recorded in X_train.txt dataset
	trainY <- read.table(".\\UCI HAR Dataset\\train\\Y_train.txt")
	# Now we need to combine these data sets just like we did for the full set
	activity <- rbind( testY,trainY) # first put test set next train ** remember we combined data this order previously ;) 
	
	# read who the subject was in these experiments
	# read subject_test.txt data
	subjectTest <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
	# read subject_train.txt data 
	subjectTrain <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
	subject <- rbind(subjectTest, subjectTrain) # first put test set next train ** remember we combined data this order previously ;) 
	colnames(subject) <- c("subject")# rename subject column
	colnames(activity) <- c("activitylabel") # rename activitylabel column
	
	# Now we need to add the columns subject and activity into the fullset
	# fullset first next subject and then activity
	FullDataSet <- cbind( fullset, subject, activity)
	###################################################################################
	# Please NOTE:
	# I am doing steps 3 and 4 ahead of 2 so that I have complete tidy dataset easily
	####################################################################################
	#---------------------------------------------------------
	# 3. Uses descriptive activity names to name the activities in the data set
	#---------------------------------------------------------
	# Now we need to match values of the column with  activity in the dataset with descriptive activity names
	# The descriptive activity names are in the activity_labels.txt
	activityLabels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")
	# now match activityLabels' V1 with FullDataSet's activitylabel
	m <- match (FullDataSet$activitylabel, activityLabels$V1)
	#now insert meaningful activity names in to the data frame creating a new column "activitynames"
	FullDataSet$activitynames <- activityLabels[m,2]
	
	#
	# At this point my FullDataSet contains all 561 columns plus 
	# activitylabel, activitynames and subject columns
    #	
	
	#---------------------------------------------------
	# 4. Appropriately labels the data set with descriptive variable names.
	#---------------------------------------------------
	# for this first we read features.txt file
	featureNames <- read.table(".\\UCI HAR Dataset\\features.txt")
	#extract the names as strings
	Names <- as.character(featureNames$V2)
	# Now add last rows to say subject, activitylabel, activityname
	Names <- c( Names, c("subject", "activitylabel", "activityname") )
	# Now Names contain all 564 labels for columns in the dataset
	# Now these need to be tidied up for this I create a datatable duplicating the column
	# Once processing is done I can then copy this table as the code book :)
	nameTable <- data.frame(code = Names, name = Names)
	# starting t is for timevaired replace with more meaningful name
	nameTable$name <- sub("^t","timevaried", nameTable$name)
	# starting with f is for frequency measurement repalce with more meaningful name
	nameTable$name <- sub("^f","frequencyvaried", nameTable$name)
	# remove commas
	nameTable$name <- sub(",","", nameTable$name)
	#Freq replace with frequency
	nameTable$name <- sub("Freq","frequency", nameTable$name)
	# remove min() with minimum
	nameTable$name <- sub("min()","minimum", nameTable$name)
	# remove max () with maximum
	nameTable$name <- sub("max()","maximum", nameTable$name)
	# remove std () with standarddeviation
	nameTable$name <- sub("std()","standarddeviation", nameTable$name)
	#remove spaces
	nameTable$name <- sub(" ","", nameTable$name)
	#remove ()
	nameTable$name <- sub("\\(\\)","", nameTable$name)
	nameTable$name <- sub("\\(*\\)","", nameTable$name)
	nameTable$name <- sub("\\)","", nameTable$name)
	nameTable$name <- sub("\\(","", nameTable$name)
	# replace Acc with acceleration
	nameTable$name <- sub("Acc","acceleration", nameTable$name)
	
	# now lets name the data set 
	names(FullDataSet) <- nameTable$name
	#-----------------------------------------------------------------
	# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
	# There are these measurements tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, 
	# tBodyGyroJerk-XYZ, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag,
	# fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag
	# for each of these mean and std needs to be extracted - that is there will be 66 columns to be extracted
	# features.txt file show the column numbers and what each column contains
	# since we are looking for mean and standard deviation I selected all names that ends with mean() and std()
	#------------------------------------------------------------------
	# columns 1-6 are tBodyAccXYZ mean and std need to extract them
	# so put these column numbers in a vector 
	vec <- c (1:6)
	#similarly for all other columns that end with mean() or std() in name get their column id
	# columns 41-46 are tGravityAccXYZ mean and std need to extract them
	vec <- c(vec, c(41:46))
	# columns 81-86 are tBodyAccJerk-XYZ mean and std need to extract them
	vec <- c(vec, c(81:86))
	# columns 121-126 tBodyGyro-XYZ need to extract mean and std
	vec <- c(vec, c(121:126))
	# columns 161-166 are tBodyGyroJerkXYZ get mean and std
	vec <- c(vec, c(161:166))
	# columns 201-202 are tBodyAccMag
	vec <- c(vec, c(201:202))
	# columns 214:215 are tGravityAccMag
	vec <- c(vec, c(214:215))
	# columns 227:228 are tBodyAccJerkMag
	vec <- c(vec, c(227:228))
	# columns 240:241 tBodyGyroMag
	vec <- c(vec, c(240:241))
	# columns 253:254 tBodyGyroJerkMag
	vec <- c(vec, c(253:254))
	# columns 266:271 fBodyAcc
	vec <- c(vec, c(266:271))
	# columns 345:350 fBodyAccJerk
	vec <- c(vec, c(345:350))
	# columns 424:429 fBodyGyro
	vec <- c(vec, c(424:429))
	# column 503:504 fBodyAccMag
	vec <- c(vec, c(503:504))
	# column 516:517 fBodyBodyAccJerkMag
	vec <- c(vec, c(516:517))
	# column 529:530 fBodyBodyGyroMag
	vec <- c(vec, c(529:530))
	# column 542:543 fBodyBodyGyroJerkMag
	vec <- c(vec, c(542:543))
	# column 562, 563, 564 contains subject, activitylabel and activityname
	vec <- c(vec, c(562:564))
	#vec now contains all the colums that we need to get out of the dataset
	# Now extract these columns from the FullDataSet of data
	TidySet <- FullDataSet[ , vec]
	# TidySet contains the mean and std data for the measurements
	# along with subject, activitylabel and activity name
	# 66 columns of mean and std data plus 3 colums 	
	
	#--------------------------------------------
	# 5. now use this tidy data to calculate the summary
	#---------------------------------------------
	FinalSetToSubmit <- aggregate(TidySet[ ,c(1:66)], by = TidySet [c(67,69)], FUN = mean)
	#column 67 is subject and 69 is activity 
	write.table(FinalSetToSubmit, file ="tidy_data_to_submit.txt")			
}
