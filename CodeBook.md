---
title: "CodeBook"
author: "Ramesh Ramasubramanian"
date: "July 26, 2015"
output: html_document
---
## Summary
This code book details the variables, data and outlines the procedures for gettign to a tiday dataset. The main components of the messay data are files for training and test data, a file with feature names and description and a file detailing the actvities whcih are part of the data.

While the dataset carries all the relevant information, it is not nearly as neatly presented as it should be. In this exercise, I have attempted to outline how I got the messay data to a clean data. I shall describe the variables presented in the final format and its specs.

## Variables

A total of 81 variables are present in the final dataset

"Subject ID"                    1..2            "Id of the Subject"      
"Activity"                      6..18           "ActivityTypes - 6 kinds"
                                               "WALKING"
                                               "WALKING_UPSTAIRS"
                                               "WALKING_DOWNSTAIRS"
                                               "SITTING"
                                               "STANDING"
                                               "LAYING"

** Note: All the remainign fields below are of length 12. Their data description is below in another section

tBodyAccmeanX               
tBodyAccstdY                 
tBodyAccstdZ                 
tGravityAccmeanX            
tGravityAccmeanY             
tGravityAccmeanZ             
tGravityAccstdX             
tGravityAccstdY              
tGravityAccstdZ              
tBodyAccJerkmeanX           
tBodyAccJerkmeanY            
tBodyAccJerkmeanZ            
tBodyAccJerkstdX            
tBodyAccJerkstdY             
tBodyAccJerkstdZ             
tBodyGyromeanX              
tBodyGyromeanY               
tBodyGyromeanZ               
tBodyGyrostdX               
tBodyGyrostdY                
tBodyGyrostdZ                
tBodyGyroJerkmeanX          
tBodyGyroJerkmeanY           
tBodyGyroJerkmeanZ           
tBodyGyroJerkstdX           
tBodyGyroJerkstdY            
tBodyGyroJerkstdZ            
tBodyAccMagmean             
tBodyAccMagstd               
tGravityAccMagmean           
tGravityAccMagstd           
tBodyAccJerkMagmean          
tBodyAccJerkMagstd           
tBodyGyroMagmean            
tBodyGyroMagstd              
tBodyGyroJerkMagmean         
tBodyGyroJerkMagstd         
fBodyAccmeanX                
fBodyAccmeanY                
fBodyAccmeanZ               
fBodyAccstdX                
fBodyAccstdY                 
fBodyAccstdZ                
fBodyAccmeanFreqX            
fBodyAccmeanFreqY            
fBodyAccmeanFreqZ           
fBodyAccJerkmeanX            
fBodyAccJerkmeanY            
fBodyAccJerkmeanZ           
fBodyAccJerkstdX             
fBodyAccJerkstdY             
fBodyAccJerkstdZ            
fBodyAccJerkmeanFreqX        
fBodyAccJerkmeanFreqY        
fBodyAccJerkmeanFreqZ       
fBodyGyromeanX               
fBodyGyromeanY               
fBodyGyromeanZ              
fBodyGyrostdX                
fBodyGyrostdY                
fBodyGyrostdZ               
fBodyGyromeanFreqX           
fBodyGyromeanFreqY           
fBodyGyromeanFreqZ          
fBodyAccMagmean              
fBodyAccMagstd               
fBodyAccMagmeanFreq         
fBodyBodyAccJerkMagmean      
fBodyBodyAccJerkMagstd       
fBodyBodyAccJerkMagmeanFreq 
fBodyBodyGyroMagmean         
fBodyBodyGyroMagstd          
fBodyBodyGyroMagmeanFreq    
fBodyBodyGyroJerkMagmean     
fBodyBodyGyroJerkMagstd      
fBodyBodyGyroJerkMagmeanFreq

## Data Description

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

## Data Transformation and feature selection

The Initial dataset provided contained a total of 561 features. We transformed both the training and test data set as follows:

1. Removed duplicates in columns
2. Extracetd only the columns that have computed mean and std values
3. Removed columns that have transformations by angle()

This create a new data frame that has 79 features

Furtherwhen the training and test data sets were merged, we also added the subject and activity columns by merging the subject_train and subject_test along with the y_train and the y_test datasets.

Finally, we mapped the activity numeric representations in the datasets to labels provided in teh activity_lables.txt file. This transformation helps the file more readable.

### This final merged dataset has 10299 observations and 81 features






