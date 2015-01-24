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
* 1. Merges the training and the test sets to create one data set.
* 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
* 3. Uses descriptive activity names to name the activities in the data set
* 4. Appropriately labels the data set with descriptive variable names. 
* 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Results

Results are saved in file tidy_data.txt. That file contain 180 rows and 88 columns. Each record contains mean values of corresponding variables for each activity of each person participated in the original experiment. There are 30 persons (subjects) and 6 types of activities. 

Results are represnted in text format, all values are tab-separeted. First line of the file contain corresponding column names.
The file could be read in R environment with the following command:
```R
mydata = read.table("tidy_data.txt", header=T)
```
#### Data types and content
- subject - "integer", integer number coding a participant id
- activity - "string", activity name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
- all other colums - "float", floating-point numbers, these values were originally normalized into (-1,1) range and are unitless.

##### Table of used variables 

 num|variable label|type|description
 ---|--------------|----|-----------
1|subject|integer|unique participant ID
2|activity|string|activity type
3|timeBodyAccMeanX|float| time domain: Mean Body AccelerationX
4|timeBodyAccMeanY|float| time domain: Mean Body AccelerationY
5|timeBodyAccMeanZ|float| time domain: Mean Body AccelerationZ
6|timeBodyAccStdDevX|float| time domain: Standard Deviation of Body Acceleration X
7|timeBodyAccStdDevY|float| time domain: Standard Deviation of Body Acceleration Y
8|timeBodyAccStdDevZ|float| time domain: Standard Deviation of Body Acceleration Z
9|timeGravityAccMeanX|float| time domain: Mean Gravity Acceleration X
10|timeGravityAccMeanY|float| time domain: Mean Gravity Acceleration Y
11|timeGravityAccMeanZ|float| time domain: Mean Gravity Acceleration Z
12|timeGravityAccStdDevX|float| time domain: Standard Deviation of Gravity Acceleration X
13|timeGravityAccStdDevY|float| time domain: Standard Deviation of Gravity Acceleration Y
14|timeGravityAccStdDevZ|float| time domain: Standard Deviation of Gravity Acceleration Z
15|timeBodyAccJerkMeanX|float| time domain: Mean Body Acceleration Jerk signal X
16|timeBodyAccJerkMeanY|float| time domain: Mean Body Acceleration Jerk signal Y
17|timeBodyAccJerkMeanZ|float| time domain: Mean Body Acceleration Jerk signal Z
18|timeBodyAccJerkStdDevX|float| time domain:Standard Deviation of Body Acceleration JErk signal X
19|timeBodyAccJerkStdDevY|float| time domain:Standard Deviation of Body Acceleration JErk signal Y
20|timeBodyAccJerkStdDevZ|float| time domain:Standard Deviation of Body Acceleration JErk signal Z
21|timeBodyGyroMeanX|float| time domain: Mean Body Gyroscope X
22|timeBodyGyroMeanY|float| time domain: Mean Body Gyroscope Y
23|timeBodyGyroMeanZ|float| time domain: Mean Body Gyroscope Z
24|timeBodyGyroStdDevX|float| time domain: Standard Deviation of Body Gyroscope X
25|timeBodyGyroStdDevY|float| time domain: Standard Deviation of Body Gyroscope Y
26|timeBodyGyroStdDevZ|float| time domain: Standard Deviation of Body Gyroscope Z
27|timeBodyGyroJerkMeanX|float| time domain: Mean Body Gyroscope Jerk signal X
28|timeBodyGyroJerkMeanY|float| time domain: Mean Body Gyroscope Jerk signal Y
29|timeBodyGyroJerkMeanZ|float| time domain: Mean Body Gyroscope Jerk signal Z
30|timeBodyGyroJerkStdDevX|float| time domain:Standard Deviation of Body Gyroscope Jerk signal X
31|timeBodyGyroJerkStdDevY|float| time domain:Standard Deviation of Body Gyroscope Jerk signal Y
32|timeBodyGyroJerkStdDevZ|float| time domain:Standard Deviation of Body Gyroscope Jerk signal Z
33|timeBodyAccMagnitudeMean|float| time domain: Mean Body Acceleration Magnitude 
34|timeBodyAccMagnitudeStdDev|float| time domain: Standard Deviation of Body Acceleration Magnitude 
35|timeGravityAccMagnitudeMean|float| time domain: Mean Gravity Acceleration Magnitude 
36|timeGravityAccMagnitudeStdDev|float| time domain: Standard Deviation of Gravity Acceleration Magnitude 
37|timeBodyAccJerkMagnitudeMean|float| time domain: Mean Body Acceleration Jerk signal Magnitude 
38|timeBodyAccJerkMagnitudeStdDev|float| time domain: Standard Deviation of Body Acceleration Jerk signal Magnitude 
39|timeBodyGyroMagnitudeMean|float| time domain: Mean Body Gyroscope Magnitude 
40|timeBodyGyroMagnitudeStdDev|float| time domain: Standard Deviation of Body Gyroscope Magnitude 
41|timeBodyGyroJerkMagnitudeMean|float| time domain: Mean Body Gyroscope Jerk signal Magnitude
42|timeBody Gyroscope Jerk signal Magnitude StdDev|float| time domain: Standard Deviation of Body Gyroscope Jerk signal Magnitude
43|freqBodyAccMeanX|float| frequency domain: Mean Body Acceleration X
44|freqBodyAccMeanY|float| frequency domain: Mean Body Acceleration Y
45|freqBodyAccMeanZ|float| frequency domain: Mean Body Acceleration Z
46|freqBodyAccStdDevX|float| frequency domain: Standard Deviation of Body Acceleration X
47|freqBodyAccStdDevY|float| frequency domain: Standard Deviation of Body Acceleration Y
48|freqBodyAccStdDevZ|float| frequency domain: Standard Deviation of Body Acceleration Z
49|freqBodyAccMeanFreqX|float| frequency domain: Body Acceleration Mean Frequency  X
50|freqBodyAccMeanFreqY|float| frequency domain: Body Acceleration Mean Frequency Y
51|freqBodyAccMeanFreqZ|float| frequency domain: Body Acceleration Mean Frequency Z
52|freqBodyAccJerkMeanX|float| frequency domain: Mean Body Acceleration Jerk signal X
53|freqBodyAccJerkMeanY|float| frequency domain: Mean Body Acceleration Jerk signal Y
54|freqBodyAccJerkMeanZ|float| frequency domain: Mean Body Acceleration Jerk signal Z
55|freqBodyAccJerkStdDevX|float| frequency domain:Standard Deviation of Body Acceleration Jerk signal X
56|freqBodyAccJerkStdDevY|float| frequency domain:Standard Deviation of Body Acceleration Jerk signal Y
57|freqBodyAccJerkStdDevZ|float| frequency domain:Standard Deviation of Body Acceleration Jerk signal Z
58|freqBodyAccJerkMeanFreqX|float| frequency domain: Mean Body Acceleration Jerk signal FreqX
59|freqBodyAccJerkMeanFreqY|float| frequency domain: Mean Body Acceleration Jerk signal FreqY
60|freqBodyAccJerkMeanFreqZ|float| frequency domain: Mean Body Acceleration Jerk signal FreqZ
61|freqBodyGyroMeanX|float| frequency domain: Mean Body Gyroscope X
62|freqBodyGyroMeanY|float| frequency domain: Mean Body Gyroscope Y
63|freqBodyGyroMeanZ|float| frequency domain: Mean Body Gyro Z
64|freqBodyGyroStdDevX|float| frequency domain: Standard Deviation of Body Gyro X
65|freqBodyGyroStdDevY|float| frequency domain: Standard Deviation of Body Gyro Y
66|freqBodyGyroStdDevZ|float| frequency domain: Standard Deviation of Body Gyro Z
67|freqBodyGyroMeanFreqX|float| frequency domain: Body Gyroscope Mean Frequency X
68|freqBodyGyroMeanFreqY|float| frequency domain: Body Gyroscope Mean Frequency Y
69|freqBodyGyroMeanFreqZ|float| frequency domain: Body Gyroscope Mean Frequency Z
70|freqBodyAccMagnitudeMean|float| frequency domain: Mean Body Acceleration Magnitude
71|freqBodyAccMagnitudeStdDev|float| frequency domain: Standard Deviation of Body Acceleration Magnitude 
72|freqBodyAccMagnitudeMeanFreq|float| frequency domain: Body Acceleration Magnitude Mean Frequency
73|freqBodyAccJerkMagnitudeMean|float| frequency domain: Mean Body Acceleration Jerk signal Magnitude
74|freqBodyAccJerkMagnitudeStdDev|float| frequency domain: Standard Deviation of Body Acceleration Jerk signal Magnitude 
75|freqBodyAccJerkMagnitudeMeanFreq|float| frequency domain: Body Acceleration Jerk signal Magnitude Mean Frequency
76|freqBodyGyroMagnitudeMean|float| frequency domain: Mean Body Gyroscope Magnitude 
77|freqBodyGyroMagnitudeStdDev|float| frequency domain: Standard Deviation of Body Gyroscope Magnitude 
78|freqBodyGyroMagnitudeMeanFreq|float| frequency domain: Body Gyroscope Magnitude Mean Frequency
79|freqBodyGyroJerkMagnitudeMean|float| frequency domain: Mean Body Gyroscope Jerk signal Magnitude
80|freqBodyGyroscopeJerkMagnitudeStdDev|float| frequency domain: Standard Deviation of Body Gyroscope Jerk signal Magnitude 
81|freqBodyGyroscopeJerkMagnitudeMeanFreq|float| frequency domain: Body Gyroscope Jerk signal Magnitude Mean Frequency
82|angle_tBodyAccMean_Gravity|float|angle_tBodyAccMean_Gravity
83|angle_tBodyAccJerkMean_GravityMean|float|angle between tBodyAccJerkMean and GravityMean
84|angle_tBodyGyroMean_GravityMean|float|angle between tBodyGyroMean and GravityMean
85|angle_tBodyGyroJerkMean_GravityMean|float|angle between tBodyGyroJerkMean and GravityMean
86|angle_X_GravityMean|float|angle between X and GravityMean
87|angle_Y_GravityMean|float|angle between Y and GravityMean
88|angle_Z_GravityMean|float|angle between Z and GravityMean


### Section 1. Merge the training and the test sets to create one data set.

After setting the source directory for the files, read into tables the data located in following files:
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

I extracted all columns which contained keywords "mean" and "std", ignoring the case. Along with measurments which were clearly indicated as mean and standard deviation values I also extracted columns with "MeanFreq" values and angle variables which were abtained from some mean values. From the task asignment I was not sure if these columns should be included in the results but I decided that it is always better to have some useless data than to miss something important. 

## Section 3. Use descriptive activity names to name the activities in the data set

Activity column was factorized with proper lableling of activity types.

## Section 4. Appropriately label the data set with descriptive activity names.

With help of gsub I modified original column names to remove potentially dangerous characters "()-," and also expand some abbreviations to make meaning of labels more clear (e.g. "Mag" -> "Magnitude" ). I decided to use CamelCase notation. I think in case when label consists of more than 3 words this method makes labels more readable in comparison to translating everything to lower case and separating words with uderscore.

## Section 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

Using "ddply" function I produced a data set with the average of measured values for each activity and participant.
