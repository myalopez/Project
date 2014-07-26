Getting and Cleaning Data Project
========================================================

Predicting Human Activity Using Samsung Dataset

Introduction:
Smartphones are equipped with various sensor technologies, two of which are the accelerometer and gyroscope.  "The accelerometer detects the 3-dimensional (3D) spatial orientation of the device and measures its acceleration relative to freefall in three different axes: X, Y, and Z. A gyroscope measures or maintains orientation, based on the principles of angular momentum. Combining a gyroscope with an accelerometer allows the [smartphones] to sense motion on six axes - left, right, up, down, forward and backward, as well as roll, pitch and yaw rotations - allowing for more accurate motion-sensing abilities [1].  

Data Source:

The data used in this data cleaning exercise is a subset of the "Human Activity Recognitions Using Smartphones Dataset" collected by Smartlab - Non Linear Complex Systems Laboratory, 
University of Genoa, Genoa, Italy. The data were from 30 participants with ages ranging from 19 to 48 years old. Six human activities, namely: walking, walking upstairs or downstairs, sitting, standing and laying down were recorded by Samsung Galaxy S II smartphones worn on the waist by each participants.. A detailed description of the experiment and the data set is available at the UCI Machine Learning Repository [2].  This dataset was downloaded from the course website: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  on July 22, 2014. The dataset files used in this exercise consists of:

1.  features.txt - list of all features
2.	activity_labels.txt - list of class labels with their activity name
3.	train/X_train.txt - Training set
4.	train/y_train.txt - Training labels
5.	test/X_test.txt - Test set
6.	test/y_test.txt - Test labels.
7.	train/subject_train.txt - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The raw datasets had a total of 10,299 observation records, each having 561-feature vectors with time and frequency domain variables.  The 561 variables were data from the accelerometer and gyroscope readings. The train and test datasets contributed 7,352 (70%) and 2947 (30%) observations, respectively.  In addition, respective data for the activity label and subject/participants were also provided.  

The 3D acceleration signals from the accelerometer were divided into the body and gravity acceleration and denoted as tBodyAcc-XYZ and tGravityAcc-XYZ (the prefix t is for time in seconds).  Measurements from the gyroscope 3-axial signals were designated as tGyro-XYZ. The jerk (Jerk) signals from the body linear acceleration and angular velocity were designated as tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ.  Some of the variables that were converted using Fast Fourier Transformation have prefix "f" for frequency with a low cutoff of 0.3 Hz.  Magnitudes of the three-dimensional signals were labeled with a suffix "Mag."  Additional variable suffix notations/differentiations include (but are not limited to) [2]:
mean(): Mean value
std(): Standard deviation
max(): Largest value in array
min(): Smallest value in array
energy(): Energy measure. Sum of the squares divided by the number of values. 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between two vectors.

Additional vectors were obtained by averaging the signals in a signal window sample. These are used on the angle() variable: gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean and tBodyGyroJerkMean [2] .

Study Design:

The data were combined to create the train and test set by merging the activity, subject and train or test sets.  Then the train and test data sets were merged and created the 10,299X564 "big data." The data that were designated as means and standard deviations were extracted from the "big data." Lastly, averages were computed.

Code Book:

These are the variables that satisfy the condition that only "measurements that were means or standard deviations" for each observations:
 
     1     tBodyAcc-mean()-X: average time of the body acceleration in the X direction, sec
     2     tBodyAcc-mean()-Y: average time of the body acceleration in the Y direction, sec
     3     tBodyAcc-mean()-Z: average time of the body acceleration in the Z direction, sec
     4     tBodyAcc-std()-X: standard deviation of the body acceleration in the X direction, sec 
     5     tBodyAcc-std()-Y: standard deviation of the body acceleration in the Y direction, sec 
     6     tBodyAcc-std()-Z: standard deviation of the body acceleration in the Z direction, sec
    41     tGravityAcc-mean()-X: average time of the gravity acceleration in the X direction, sec 
    42     tGravityAcc-mean()-Y: average time of the gravity acceleration in the Y direction, sec 
    43     tGravityAcc-mean()-Z: average time of the gravity acceleration in the Z direction, sec
    44     tGravityAcc-std()-X: standard deviation of the gravity acceleration in the X direction, sec 
    45     tGravityAcc-std()-Y: standard deviation of the gravity acceleration in the Y direction, sec
    46     tGravityAcc-std()-Z standard deviation of the gravity acceleration in the Z direction, sec 
    81     tBodyAccJerk-mean()-X: average time of the body acceleration Jerk signals in the X direction, sec 
    82     tBodyAccJerk-mean()-Y: average time of the body acceleration Jerk signals in the Y direction, sec 
    83     tBodyAccJerk-mean()-Z: average time of the body acceleration Jerk signals in the Z direction, sec
    84     tBodyAccJerk-std()-X: standard deviation of the body acceleration Jerk signals in the X direction, sec
    85     tBodyAccJerk-std()-Y: standard deviation of the body acceleration Jerk signals in the Y direction, sec 
    86     tBodyAccJerk-std()-Z: standard deviation of the body acceleration Jerk signals in the Z direction, sec
    121     tBodyGyro-mean()-X: average time of the gyroscope signals in the X direction, sec
    122     tBodyGyro-mean()-Y: average time of the gyroscope signals in the Y direction, sec
    123     tBodyGyro-mean()-Z: average time of the gyroscope signals in the Z direction, sec
    124     tBodyGyro-std()-X: standard deviation of the gyroscope signals in the X direction, sec 
    125     tBodyGyro-std()-Y: standard deviation of the gyroscope signals in the Y direction, sec 
    126     tBodyGyro-std()-Z: standard deviation of the gyroscope signals in the Z direction, sec 
    161     tBodyGyroJerk-mean()-X: average time of the angular velocity Jerk signals in the X direction, sec
    162     tBodyGyroJerk-mean()-Y: average time of the angular velocity Jerk signals in the Y direction, sec
    163     tBodyGyroJerk-mean()-Z: average time of the angular velocity Jerk signals in the Z direction, sec  
    164     tBodyGyroJerk-std()-X standard deviations of the angular velocity Jerk signals in the X direction, sec
    165     tBodyGyroJerk-std()-Y standard deviations of the angular velocity Jerk signals in the Y direction, sec
    166     tBodyGyroJerk-std()-Z: standard deviations of the angular velocity Jerk signals in the Z direction, sec
    201     tBodyAccMag-mean(): average time magnitude of the body acceleration, sec
    202     tBodyAccMag-std(): standard deviation of the magnitude of the body acceleration, sec
    214     tGravityAccMag-mean(): average time magnitude of the gravity acceleration, sec
    215     tGravityAccMag-std():standard deviation of the time magnitude of the gravity acceleration, sec
    227     tBodyAccJerkMag-mean(): average magnitude of the body acceleration Jerk signals, sec 
    228     tBodyAccJerkMag-std(): standard deviation of the magnitude of the body acceleration Jerk signals, sec 
    240     tBodyGyroMag-mean(): average magnitude of the gyroscope signals, sec
    241     tBodyGyroMag-std(): standard deviation of the magnitude of the gyroscope signals, sec
    253     tBodyGyroJerkMag-mean(): average magnitude of the angular velocity Jerk signals, sec
    254     tBodyGyroJerkMag-std(): standard deviation of the magnitude of the angular velocity Jerk signals, sec
    266     fBodyAcc-mean()-X: average frequency of the body acceleration in the X direction 
    267     fBodyAcc-mean()-Y: average frequency of the body acceleration in the Y direction
    268     fBodyAcc-mean()-Z: average frequency of the body acceleration in the Z direction
    269     fBodyAcc-std()-X: standard deviation of the  frequency of the body acceleration in the X direction
    270     fBodyAcc-std()-Y: standard deviation of the frequency of the body acceleration in the Y direction
    271     fBodyAcc-std()-Z: standard deviation of the frequency of the body acceleration in the Z direction
    345     fBodyAccJerk-mean()-X: average frequency of the body acceleration Jerk signals in the X direction
    346     fBodyAccJerk-mean()-Y: average frequency of the body acceleration Jerk signals in the y direction
    347     fBodyAccJerk-mean()-Z: average frequency of the body acceleration Jerk signals in the Z direction
    348     fBodyAccJerk-std()-X: standard deviation of the frequency of the body acceleration Jerk signals in the X direction   
    349     fBodyAccJerk-std()-Y: standard deviation of the frequency of the body acceleration Jerk signals in the Y direction 
    350     fBodyAccJerk-std()-Z: standard deviation of the frequency of the body acceleration Jerk signals in the Z direction
    424     fBodyGyro-mean()-X: average frequency of the gyroscope signals in the X direction
    425     fBodyGyro-mean()-Y: average frequency of the gyroscope signals in the Y direction
    426     fBodyGyro-mean()-Z: average frequency of the gyroscope signals in the Z direction
    427     fBodyGyro-std()-X: standard deviation of the frequency of the gyroscope signals in the X direction
    428     fBodyGyro-std()-Y: standard deviation of the frequency of the gyroscope signals in the Y direction
    429     fBodyGyro-std()-Z: standard deviation of the frequency of the gyroscope signals in the Z direction
    503     fBodyAccMag-mean(): average frequency of the magnitude of the body acceleration
    504     fBodyAccMag-std(): standard deviation of the frequency of the magnitude of the body acceleration
    516     fBodyBodyAccJerkMag-mean(): average frequency of the magnitude of the body acceleration Jerk signals
    517     fBodyBodyAccJerkMag-std(): standard deviation of the  frequency of the magnitude of the body acceleration Jerk signals
    529     fBodyBodyGyroMag-mean(): average magnitude of the frequency of the gyroscope signals in the Z direction
    530     fBodyBodyGyroMag-std(): standard deviation of the magnitude of the frequency of the gyroscope signals in the Z direction
    542     fBodyBodyGyroJerkMag-mean(): average frequency of the magnitude of the angular velocity Jerk signals in the Z direction  
    543     fBodyBodyGyroJerkMag-std(): standard deviation of the magnitude of the angular velocity Jerk signals in the Z direction  

References:
1.	Asad-Uj-Jaman.  Sensors in Smartphones.  http://mobiledeviceinsight.com/2011/12/sensors-in-smartphones/.  Accessed July 22, 2014.
2.	UCI Machine Learning Repository. Human Activity Recognition Using Smartphones Data Set.    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Accessed July 22, 2014. 
```


