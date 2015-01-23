## Mikhail Pachkov
## 2015

## This script procesa data avaliable here https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## in the following steps:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the avera#ge of each variable for each activity and each subject.

## Usage: Rscript run_analysis.R [data_dir]
## data_dir is location of UCI HAR dataset, for example '~/foo/UCI HAR Dataset'
## if no data_dir parameter is given it is assumed that the dataset dir is
## in the current directory

library(plyr)

# read command ine arguments
args <- commandArgs(TRUE)
data_dir <- 'UCI HAR Dataset'
if (length(args) > 0) {
    data_dir <- args[1]
}
if (!file.exists(data_dir)) {
    stop(paste(data_dir, "does not exist!", sep=" "))
}
# get features names
features <- read.table(paste(data_dir, "features.txt", sep="/"),
                       colClasses=c("integer", "character"))[, 2]

# get test_data
data_test <- read.table(paste(data_dir,"test/X_test.txt", sep="/"))
colnames(data_test) <- features
data_test$subject <- read.table(paste(data_dir,"test/subject_test.txt", sep="/"))[,1]
data_test$activity <- read.table(paste(data_dir,"test/y_test.txt", sep="/"))[,1]

# get train_data
data_train <- read.table(paste(data_dir,"train/X_train.txt", sep="/"))
colnames(data_train) <- features
data_train$subject <- read.table(paste(data_dir,"train/subject_train.txt", sep="/"))[,1]
data_train$activity <- read.table(paste(data_dir,"train/y_train.txt", sep="/"))[,1]

# put train and test datasets together
data <- rbind(data_test, data_train)

# extract all columns which contain mean or std keyword + subjects and activities

new_data <- data[,c(grep("mean|std", colnames(data_test), ignore.case=T), 562, 563)]
new_colnames <- colnames(new_data)

## fix column names
new_colnames = gsub("\\(|\\)", "", new_colnames)
new_colnames = gsub("-std-?", "StdDev", new_colnames)
new_colnames = gsub("-mean-?", "Mean", new_colnames)
new_colnames = gsub("^(t)", "time", new_colnames)
new_colnames = gsub("^(f)", "freq", new_colnames)
new_colnames = gsub("([Gg]ravity)", "Gravity", new_colnames)
new_colnames = gsub("([Bb]ody[Bb]ody|[Bb]ody)", "Body", new_colnames)
new_colnames = gsub("[Gg]yro", "Gyro", new_colnames)
new_colnames = gsub("AccMag", "AccMagnitude", new_colnames)
new_colnames = gsub("([Bb]odyaccjerkmag)", "BodyAccJerkMagnitude", new_colnames)
new_colnames = gsub("JerkMag", "JerkMagnitude", new_colnames)
new_colnames = gsub("GyroMag", "GyroMagnitude", new_colnames)
new_colnames = gsub("-", "", new_colnames)
new_colnames = gsub("^angle", "angle_", new_colnames)
new_colnames = gsub(",", "_", new_colnames)

## Rename columns in the table
colnames(new_data) <- new_colnames

# add activity labels
new_data$activity <- factor(new_data$activity, labels=c("WALKING","WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

mean_data <- ddply(new_data, .(subject,activity), numcolwise(mean))

##  save data to a file
write.table(mean_data, './tidy_data.txt',row.names=TRUE,sep='\t');
