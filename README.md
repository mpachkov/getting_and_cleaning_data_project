## Getting and Cleaning Data Project

This repository contains files for the course project of the Johns Hopkins Getting and Cleaning Data course.

### Overview
This project serves to demonstrate the collection and cleaning of a tidy data set that can be used for subsequent
analysis. A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Project Summary
The following is a summary description of the project instructions

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Usage

You have to download and unzip dataset yourself. Download link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
You will get directory "UCI HAR Dataset". 

You have to download the analysis script. For that you can use the following command:
git clone https://github.com/mpachkov/getting_and_cleaning_data_project.git
The script is located in directory getting_and_cleaning_data_project in your current working directory.

Data is processed with script "run_analysis.R". This script accept as argument path to "UCI HAR Dataset" directory. If no argument given then it is assumed that "UCI HAR Dataset" directory is in current working directory.

#### Examples

Let's say you downloaded and unziped dataset in directory /home/user/tmp. Your "UCI HAR Dataset" dir is in /home/user/tmp. In this case you can change to /home/user/tmp and just run script as following:

Rscript run_analysis.R

Resulting file "tidy_data.txt" will be saved in /home/user/tmp.

Let's say you want to run and save results in different directory /home/user/tmp2. In this case run as following:

cd /home/user/tmp2
Rscript run_analysis.R '/home/user/tmp/UCI HAR Dataset'

Resulting file "tidy_data.txt" will be saved in /home/user/tmp2.

### Additional Information
You can find additional information about the variables, data and transformations in the CodeBook.md file.
