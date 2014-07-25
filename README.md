Project
=======

GettingAndCleaningData
======================
 
The data used in this data cleaning exercise is a subset of the “Human Activity Recognitions Using Smartphones Dataset” collected by Smartlab - Non Linear Complex Systems Laboratory, University of Genoa, Genoa, Italy. The data were from 30 participants with ages ranging from 19 to 48 years old. Six human activities, namely: walking, walking upstairs or downstairs, sitting, standing and laying down were recorded by Samsung Galaxy S II smartphones worn on the waist of each participants.. A detailed description of the experiment and the data set is available at the UCI Machine Learning Repository [2].  This dataset was downloaded from the course website: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip on July 22, 2014. The dataset files used in this exercise consists of:

1.	features.txt - list of all features
2.	activity_labels.txt - list of class labels with their activity name
3.	train/X_train.txt - Training set
4.	train/y_train.txt - Training labels
5.	test/X_test.txt - Test set
6.	test/y_test.txt - Test labels.
7.	train/subject_train.txt - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The raw datasets had a total of 10,299 observation records, each having 561-feature vectors with time and frequency domain variables.  The 561 variables were data from the accelerometer and gyroscope readings. The train and test datasets contributed 7,352 (70%) and 2947 (30%) observations, respectively.  In addition, respective data for the activity label and subject/participants were also provided.  

The data were combined to create the train and test set by merging the activity, subject and train or test sets.  Then the train and test data sets were merged and created the 10,299X564 “big data.” The data that were designated as means and standard deviations were extracted from the “big data.” Lastly, averages were computed.  The Rcode used to generate the "tidy data" required by this project is run_analysis.R.  The code includes comments lines that describe the various steps or processing that were taken to create the "tidy data" file.
