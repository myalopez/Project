### Getting and Cleaning Data Project 
library(psych)
library(plyr)

#  options(warn=1) # print warnings

labels=read.table("features.txt")

# Identify the columns that are means and std measurements

mrows = labels[(grepl("-mean()",labels$V2,fixed=TRUE)),]
stdrows = labels[(grepl("-std()",labels$V2,fixed=TRUE)),]

#  Read train and testdataset

train = read.table("X_train.txt")
test=read.table("X_test.txt")

#  Read the subject and activity files of the train and test datasets

subTrain=read.table("subject_train.txt")
subTrain = rename(subTrain, c(V1="Subject"))
actTrain=read.table("y_train.txt")
actTrain = rename(actTrain, c(V1="Activity"))
subTest=read.table("subject_test.txt")
subTest = rename(subTest, c(V1="Subject"))
actTest=read.table("y_test.txt")
actTest = rename(actTest, c(V1="Activity"))

#  Create the datasets with subject and activity levels

Train = cbind(actTrain, subTrain, train)
Test = cbind(actTest, subTest, test)

#  Create the combine train and test "mean" and "std" data sets

samsung= rbind(Train,Test)
dim(samsung)

#  Subset the mean and stddata of the train and test datasets

data = samsung[,c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,544:545)]
dim(data)

#  Rename variable/column names

data = rename(data, c(V1="MeanTimeBodyAcceleration-X",
   V2=         "MeanTimeBodyAcceleration-Y",
   V3=         "MeanTimeBodyAcceleration-Z",
   V4=       "StdDevTimeBodyAcceleration-X",
   V5=        "StdDevTimeBodyAccelaration-Y",
   V6=        "StdDevTimeBodyAcceleration-Z",
   V41=       "MeanTimeGravityAcceleration-X",
   V42=       "MeanTimeGravityAcceleration-Y",
   V43=       "MeanTimeGravityAcceleration-Z",
   V44=     "StdDevTimeGravityAcceleration-X",
   V45=     "StdDevTimeGravityAcceleration-Y",
   V46=     "StdDevTimeGravityAccelaration-Z",
   V81=               "MeanTimeBodyAccJerk-X",
   V82=               "MeanTimeBodyAccJerk-Y",
   V83=               "MeanTimeBodyAccJerk-Z",
   V84=             "StdDevTimeBodyAccJerk-X",
   V85=             "StdDevTimeBodyAccJerk-Y",
   V86=             "StdDevTimeBodyAccJerk-Z",
   V121=                  "MeanTimeBodyGyro-X",
   V122=                  "MeanTimeBodyGyro-Y",
   V123=                  "MeanTimeBodyGyro-Z",
   V124=                "StdDevTimeBodyGyro-X",
   V125=                "StdDevTimeBodyGyro-Y",
   V126=                "StdDevTimeBodyGyro-Z",
   V161=              "MeanTimeBodyGyroJerk-X",
   V162=              "MeanTimeBodyGyroJerk-Y",
   V163=              "MeanTimeBodyGyroJerk-Z",
   V164=            "StdDevTimeBodyGyroJerk-X",
   V165=            "StdDevTimeBodyGyroJerk-Y",
   V166=            "StdDevTimeBodyGyroJerk-Z",
   V201=            "MeanTimeBodyAccMagnitude",
   V202=          "StdDevTimeBodyAccMagnitude",
   V214=         "MeanTimeGravityAccMagnitude",
   V215=       "StdDevTimeGravityAccMagnitude",
   V227=        "MeanTimeBodyAccJerkMagnitude",
   V228=         "StdDevBodyAccJerkMagnitude",
   V240=          "MeanTimeBodyGyroMagnitude",
   V241=           "StdDevBodyGyroMagnitude",
   V253=       "MeanTimeBodyGyroJerkMagnitude",
   V254=     "StdDevTimeBodyGyroJerkMagnitude",
   V266=        "MeanFreqBodyAcceleration-X",
   V267=        "MeanFreqBodyAcceleration-Y",
   V268=        "MeanFreqBodyAcceleration-Z",
   V269=        "StdDevFreqBodyAcceleration-X",
   V270=        "StdDevFreqBodyAcceleration-Y",
   V271=        "StdDevFreqBodyAcceleration-Z",
   V345=         "MeanFreqBodyAccJerk-X",
   V346=         "MeanFreqBodyAccJerk-Y",
   V347=         "MeanFreqBodyAccJerk-Z",
   V348=         "StdDevFreqBodyAccJerk-X",
   V349=         "StdDevFreqBodyAccJerk-Y",
   V350=         "StdDevFreqBodyAccJerk-Z",
   V424=         "MeanFreqBodyGyro-X",
   V425=         "MeanFreqBodyGyro-Y",
   V426=         "MeanFreqBodyGyro-Z",
   V427=         "StdDevFreqBodyGyro-X",
   V428=         "StdDevFreqBodyGyro-Y",
   V429=         "StdDevFreqBodyGyro-Z",
   V503=         "MeanFreqBodyAccMagnitude",
   V504=          "StdDevFreqBodyAccMagnitude",
   V516=    "MeanFreqBodyBodyAccJerkMagnitude",
   V517=  "StdDevFreqBodyBodyAccJerkMagnitude",
   V529=       "MeanFreqBodyBodyGyroMagnitude",
   V530=     "StdDevFreqBodyBodyGyroMagnitude",
   V542=   "MeanFreqBodyBodyGyroJerkMagnitude",
   V543= "StdDevFreqBodyBodyGyroJerkMagnitude"))


#  Create subsets for each activity level for "mean" and "std" datasets

Ex1 = subset(data,data$Activity == 1)
Ex2 = subset(data,data$Activity == 2)
Ex3 = subset(data,data$Activity == 3)
Ex4 = subset(data,data$Activity == 4)
Ex5 = subset(data,data$Activity == 5)
Ex6 = subset(data,data$Activity == 6)

#  Calculate the column means 

df1 = ddply(Ex1, .(Subject), numcolwise(mean))
df2 = ddply(Ex2, .(Subject), numcolwise(mean))
df3 = ddply(Ex3, .(Subject), numcolwise(mean))
df4 = ddply(Ex4, .(Subject), numcolwise(mean))
df5 = ddply(Ex5, .(Subject), numcolwise(mean))
df6 = ddply(Ex6, .(Subject), numcolwise(mean))

#  Rename the Activity labels

df1$Activity = "Walking"
col_idx <- grep("Activity", names(df1))
df1 <- df1[, c(col_idx, (1:ncol(df1))[-col_idx])]

df2$Activity = "Walking_Up"
col_idx <- grep("Activity", names(df2))
df2 <- df2[, c(col_idx, (1:ncol(df2))[-col_idx])]

df3$Activity = "Walking_Down"
col_idx <- grep("Activity", names(df3))
df3 <- df3[, c(col_idx, (1:ncol(df3))[-col_idx])]

df4$Activity = "Sitting"
col_idx <- grep("Activity", names(df4))
df4 <- df4[, c(col_idx, (1:ncol(df4))[-col_idx])]

df5$Activity = "Standing"
col_idx <- grep("Activity", names(df5))
df5 <- df5[, c(col_idx, (1:ncol(df5))[-col_idx])]

df6$Activity = "Laying"
col_idx <- grep("Activity", names(df6))
df6 <- df6[, c(col_idx, (1:ncol(df6))[-col_idx])]

#  Combine all datasets to create a tidy data

 TidyData = rbind(df1,df2,df3,df4,df5,df6)

#  Save the tidy data

 write.csv(TidyData,"TidyData.csv")
 write.table(TidyData, "TidyData.txt", sep="\t")

