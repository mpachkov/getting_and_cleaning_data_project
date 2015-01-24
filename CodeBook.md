## Getting and Cleaning Data Project

### Original Data

**Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.**

Location: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Download link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
A full description of the data used in this project can be found at location given above.

### Processing of the  original data

The original data were processed in the following steps:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Results

Results are saved in file tidy_data.txt. That file contain 180 rows and 88 columns. Each record contains mean values of corresponding variables for each activity of each person participated in the original experiment. There are 30 persons (subjects) and 6 types of activities. 

Results are represnted in text format, all values are tab-separeted. First line of the file contain corresponding column names.
The file could be read in R environment with the following command:
```R
mydata = read.table("tidy_data.txt", header=T)
```
#### Data types and content
subject - "integer", integer number coding a participant id
activity - "string", aactivity name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
all other colums - "float", floating-point numbers, these values were originally normalized into (-1,1) range and are unitless.

The names of other columns in the tidy dataset derived from original dataset (see Readme.md for details).
timeBodyAcc
timeGravityAcc
timeBodyAccJerk
timeBodyGyro
timeBodyGyroJerk
timeBodyAccMagnitude
timeGravityAccMagnitude
timeBodyAccJerk
timeBodyGyro
timeBodyGyroJerkMagnitude
freqBodyAcc
freqBodyAccJerk
freqBodyGyro
freqBodyAccMagnitude
freqBodyAccJerkMagnitude
freqBodyGyroMagnitude
freqBodyGyroJerkMagnitude

These are different variables from originalfeature vector. They could have suffixes indicating what king of data it was:
Mean - mean value
StdDev - standard deviation
MeanFreq - weighted average of the frequency components
These variables might end with XYZ idicating corresponding axis direction if applicable.

Finaly there are "angle" prefixed variables:
angle_tBodyAccMean_Gravity
angle_tBodyAccJerkMean_GravityMean
angle_tBodyGyroMean_GravityMean
angle_tBodyGyroJerkMean_GravityMean
angle_X_GravityMean
angle_Y_GravityMean
angle_Z_GravityMean
These are angles between vectors.


Following signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

### Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Section 1. Merge the training and the test sets to create one data set.
After setting the source directory for the files, read into tables the data located in
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

Assign column names and merge to create one data set.

## Section 2. Extract only the measurements on the mean and standard deviation for each measurement. 
Create a logcal vector that contains TRUE values for the ID, mean and stdev columns and FALSE values for the others.
Subset this data to keep only the necessary columns.

## Section 3. Use descriptive activity names to name the activities in the data set
Merge data subset with the activityType table to cinlude the descriptive activity names

## Section 4. Appropriately label the data set with descriptive activity names.
Use gsub function for pattern replacement to clean up the data labels.

## Section 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
Per the project instructions, we need to produce only a data set with the average of each veriable for each activity and subject
