#This is the Code book for data I cleaned and named for Activity 1-4 in the code project
#two datasets in train and test were combined
# Activity label was taken from train_Y and test_Y files and inserted to the data table
#then appropriate activityname was obtained from activity_label.txt file
#transformation of each data step is shown in code script
# column numbers for each mean and standard deviation variable mean() std() in the original features.txt file
#were extracted
 col number                        code                                                         name
1                          activitylabel                                                activitylabel
2                      tBodyAcc-mean()-X                            timevariedBodyacceleration-mean-X
3                      tBodyAcc-mean()-Y                            timevariedBodyacceleration-mean-Y
4                      tBodyAcc-mean()-Z                            timevariedBodyacceleration-mean-Z
5                       tBodyAcc-std()-X               timevariedBodyacceleration-standarddeviation-X
6                       tBodyAcc-std()-Y               timevariedBodyacceleration-standarddeviation-Y
7                       tBodyAcc-std()-Z               timevariedBodyacceleration-standarddeviation-Z
42                  tGravityAcc-mean()-X                         timevariedGravityacceleration-mean-X
43                  tGravityAcc-mean()-Y                         timevariedGravityacceleration-mean-Y
44                  tGravityAcc-mean()-Z                         timevariedGravityacceleration-mean-Z
45                   tGravityAcc-std()-X            timevariedGravityacceleration-standarddeviation-X
46                   tGravityAcc-std()-Y            timevariedGravityacceleration-standarddeviation-Y
47                   tGravityAcc-std()-Z            timevariedGravityacceleration-standarddeviation-Z
82                 tBodyAccJerk-mean()-X                        timevariedBodyaccelerationJerk-mean-X
83                 tBodyAccJerk-mean()-Y                        timevariedBodyaccelerationJerk-mean-Y
84                 tBodyAccJerk-mean()-Z                        timevariedBodyaccelerationJerk-mean-Z
85                  tBodyAccJerk-std()-X           timevariedBodyaccelerationJerk-standarddeviation-X
86                  tBodyAccJerk-std()-Y           timevariedBodyaccelerationJerk-standarddeviation-Y
87                  tBodyAccJerk-std()-Z           timevariedBodyaccelerationJerk-standarddeviation-Z
122                   tBodyGyro-mean()-X                                    timevariedBodyGyro-mean-X
123                   tBodyGyro-mean()-Y                                    timevariedBodyGyro-mean-Y
124                   tBodyGyro-mean()-Z                                    timevariedBodyGyro-mean-Z
125                    tBodyGyro-std()-X                       timevariedBodyGyro-standarddeviation-X
126                    tBodyGyro-std()-Y                       timevariedBodyGyro-standarddeviation-Y
127                    tBodyGyro-std()-Z                       timevariedBodyGyro-standarddeviation-Z
162               tBodyGyroJerk-mean()-X                                timevariedBodyGyroJerk-mean-X
163               tBodyGyroJerk-mean()-Y                                timevariedBodyGyroJerk-mean-Y
164               tBodyGyroJerk-mean()-Z                                timevariedBodyGyroJerk-mean-Z
165                tBodyGyroJerk-std()-X                   timevariedBodyGyroJerk-standarddeviation-X
166                tBodyGyroJerk-std()-Y                   timevariedBodyGyroJerk-standarddeviation-Y
167                tBodyGyroJerk-std()-Z                   timevariedBodyGyroJerk-standarddeviation-Z
202                   tBodyAccMag-mean()                           timevariedBodyaccelerationMag-mean
203                    tBodyAccMag-std()              timevariedBodyaccelerationMag-standarddeviation
215                tGravityAccMag-mean()                        timevariedGravityaccelerationMag-mean
216                 tGravityAccMag-std()           timevariedGravityaccelerationMag-standarddeviation
228               tBodyAccJerkMag-mean()                       timevariedBodyaccelerationJerkMag-mean
229                tBodyAccJerkMag-std()          timevariedBodyaccelerationJerkMag-standarddeviation
241                  tBodyGyroMag-mean()                                   timevariedBodyGyroMag-mean
242                   tBodyGyroMag-std()                      timevariedBodyGyroMag-standarddeviation
254              tBodyGyroJerkMag-mean()                               timevariedBodyGyroJerkMag-mean
255               tBodyGyroJerkMag-std()                  timevariedBodyGyroJerkMag-standarddeviation
267                    fBodyAcc-mean()-X                       frequencyvariedBodyacceleration-mean-X
268                    fBodyAcc-mean()-Y                       frequencyvariedBodyacceleration-mean-Y
269                    fBodyAcc-mean()-Z                       frequencyvariedBodyacceleration-mean-Z
270                     fBodyAcc-std()-X          frequencyvariedBodyacceleration-standarddeviation-X
271                     fBodyAcc-std()-Y          frequencyvariedBodyacceleration-standarddeviation-Y
272                     fBodyAcc-std()-Z          frequencyvariedBodyacceleration-standarddeviation-Z
346                fBodyAccJerk-mean()-X                   frequencyvariedBodyaccelerationJerk-mean-X
347                fBodyAccJerk-mean()-Y                   frequencyvariedBodyaccelerationJerk-mean-Y
348                fBodyAccJerk-mean()-Z                   frequencyvariedBodyaccelerationJerk-mean-Z
349                 fBodyAccJerk-std()-X      frequencyvariedBodyaccelerationJerk-standarddeviation-X
350                 fBodyAccJerk-std()-Y      frequencyvariedBodyaccelerationJerk-standarddeviation-Y
351                 fBodyAccJerk-std()-Z      frequencyvariedBodyaccelerationJerk-standarddeviation-Z
425                   fBodyGyro-mean()-X                               frequencyvariedBodyGyro-mean-X
426                   fBodyGyro-mean()-Y                               frequencyvariedBodyGyro-mean-Y
427                   fBodyGyro-mean()-Z                               frequencyvariedBodyGyro-mean-Z
428                    fBodyGyro-std()-X                  frequencyvariedBodyGyro-standarddeviation-X
429                    fBodyGyro-std()-Y                  frequencyvariedBodyGyro-standarddeviation-Y
430                    fBodyGyro-std()-Z                  frequencyvariedBodyGyro-standarddeviation-Z
504                   fBodyAccMag-mean()                      frequencyvariedBodyaccelerationMag-mean
505                    fBodyAccMag-std()         frequencyvariedBodyaccelerationMag-standarddeviation
517           fBodyBodyAccJerkMag-mean()              frequencyvariedBodyBodyaccelerationJerkMag-mean
518            fBodyBodyAccJerkMag-std() frequencyvariedBodyBodyaccelerationJerkMag-standarddeviation
530              fBodyBodyGyroMag-mean()                          frequencyvariedBodyBodyGyroMag-mean
531               fBodyBodyGyroMag-std()             frequencyvariedBodyBodyGyroMag-standarddeviation
543          fBodyBodyGyroJerkMag-mean()                      frequencyvariedBodyBodyGyroJerkMag-mean
544           fBodyBodyGyroJerkMag-std()         frequencyvariedBodyBodyGyroJerkMag-standarddeviation

