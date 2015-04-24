### File Structure Used

It assumes that the Current Working directory has following structure present,

- Current Working Directory : 
    - 'README.md': Explains various files. How they are connected

    - 'CodeBook.md': It describes the Data needed, the Transformations applied to the data as well as Variables used

    - `/data` directory :Contains data downloaded from above URL,
           - 'features.txt' 
           - 'X_train.txt'
           - 'X_test.txt'
           - 'activity_labels.txt'
           - 'y_train.txt'
           - 'y_test.txt'
           - 'subject_train.txt'
           - 'subject_test.txt'

`Note that the "/data" folder on the github repository contains (X_train.zip) and (X_test.zip). You will need to un-zip them to get (X_train.txt) and (X_test.txt) files, after you download them to your PC`

    - 'run_analysis.R': R script to process the data. 


### How to Process the Data

- Make sure (X_train.txt) and (X_test.txt) are in un-zipped format in "/data" folder 

- Once you have the above mentioned directory structure, execute the `run_analysis.R` file in "R Console"

   > source "run_analysis.R"

- It should create `tidySet.txt` file in current working directory. This file should have 180 rows and 68 columns


### How the data is transformed


- Create `Training Set`

   - Load (X_train.txt) into {trainSet} - Contains 7352 rows x 561 columns. 
     Columns are : "V1","V2"..."V561"

   - Load titles from (features.txt) into {featureList}
     Has 2 columns "V1","V2"

   - Add title-row to {trainSet}

   - Load (subject_train.txt) into {subTrain} - Contains 7352
     rows. Has single column "V1"

   - Add title-row to {subTrain}

   - Load (y_train.txt) into {actTrain} - Contains 7352 rows
     Has single column "V1"

   - Load(activity_labels.txt) into {actLabels} - Contains 6 rows x 2 columns. 
     Columns are : "V1","V2"
     Add column "V3", give meaningful activity names

   - Merge {actTrain} and {actLabels}. Call it {actTrainNew}

   - Add title-row to {actTrainNew}

   - Pre-pend {subTrain}, {actTrainNew} to {trainSet} 
     Call it {trainSetNew}. It contains 7352 rows x 563 columns.
     columns are : "SubjectPerson","ActivityName",...

- Create `Test Set`

   - Load (X_test.txt) into {testSet} - Contains 2947 rows x 561 columns. 
    Columns are : "V1","V2"..."V561"

   - Add title-row to {testSet}

   - Load (subject_test.txt) into {subTest} - Contains 2947 rows.
     Has single column "V1"

   - Add title-row to {subTest}

   - Load (y_test.txt) into {actTest} - Contains 2947 rows.
     Has single column "V1"

   - Merge {actTest} and {actLabels}. Call it {actTestNew}

   - Add title-row to {actTestNew}

   - Pre-pend {subTest}, {actTestNew} to {testSet} 
     Call it {testSetNew}. It contains 2947 rows x 563 columns.
     columns are : "SubjectPerson","ActivityName",...

- Merge `Training` & `Test` sets

   - Merge {trainSetNew} and {testSetNew} - Contains 10299 rows x 563 columns.
     Call it {combinedSet}

- Extract `Mean` and `Standard Deviation` fields. 

   - Extract Mean and Standard Deviation fields from{combinedSet}
     Call it {finalSet}. It contains 10299 rows x 68 columns.

   - Label {finalSet} with descriptive variable names. Activities 
     are already named with descriptive activity names

- Create `Tidy` DataSet with Averages

   - Create another data-set. Call it {tidySet}. 
     It contains (each Subject), (each Activity), 
                 (average of each variable).
     Load intermediate result into {finalSetMelt}. 
     It cotains 679734 rows x 4 columns.
     {tidySet} contains 180 rows x 68 columns.

- Create Output TXT file from Tidy Data Set

   - It creates `tidySet.txt` file in current working directory.  
     This file should have 180 rows and 68 columns


### Different Variables Used


- `tidySet.txt` contains 180 rows and 68 columns

- Here's the description of those 68 columns,

   - "SubjectPerson" :  Subject Person who carried out this experient. Value: (1:30), Type: Numeric

   - "ActivityName" :   Activity carried out by this person. Value:"Lay","Sit","Stand","Walk", "WalkDown", "WalkUp",  Type: Character

`All below values are AVERAGES for "Subject Person" and
"ActivityName", for each variable mentioned below. 
Total Variables : 66. Each Variable Type : Numeric`


   - "MeanBodyAccSignalTimeX" : MEAN of Body Acceleration Time Domain X-axial Signal

   - "MeanBodyAccSignalTimeY" : MEAN of Body Acceleration Time Domain Y-axial Signal

   - "MeanBodyAccSignalTimeZ" : MEAN of Body Acceleration Time Domain Z-axial Signal 

   - "StdDevBodyAccSignalTimeX" : STANDARD DEVIATION of Body Acceleration Time Domain X-axial Signal

   - "StdDevBodyAccSignalTimeY" : STANDARD DEVIATION of Body Acceleration Time Domain Y-axial Signal

   - "StdDevBodyAccSignalTimeZ" : STANDARD DEVIATION of Body Acceleration Time Domain Z-axial Signal
       
   - "MeanGravityAccSignalTimeX" : MEAN of Gravity Acceleration Time Domain X-axial Signal

   - "MeanGravityAccSignalTimeY" : MEAN of Gravity Acceleration Time Domain Y-axial Signal

   - "MeanGravityAccSignalTimeZ" : MEAN of Gravity Acceleration Time Domain Z-axial Signal
 
   - "StdDevGravityAccSignalTimeX" : STANDARD DEVIATION of Gravity Acceleration Time Domain X-axial Signal

   - "StdDevGravityAccSignalTimeY" : STANDARD DEVIATION of Gravity Acceleration Time Domain Y-axial Signal

   - "StdDevGravityAccSignalTimeZ" : STANDARD DEVIATION of Gravity Acceleration Time Domain Z-axial Signal
   
   - "MeanBodyAccJerkTimeX" : MEAN of Body Acceleration Jerk Time Domain X-axial Signal

   - "MeanBodyAccJerkTimeY" : MEAN of Body Acceleration Jerk Time Domain Y-axial Signal

   - "MeanBodyAccJerkTimeZ" : MEAN of Body Acceleration Jerk Time Domain Z-axial Signal

   - "StdDevBodyAccJerkTimeX" : STANDARD DEVIATION of Body Acceleration Jerk Time Domain X-axial Signal

   - "StdDevBodyAccJerkTimeY" : STANDARD DEVIATION of Body Acceleration Jerk Time Domain Y-axial Signal

   - "StdDevBodyAccJerkTimeZ" : STANDARD DEVIATION of Body Acceleration Jerk Time Domain Z-axial Signal

   - "MeanBodyGyroTimeX" : MEAN of Body Gyro Time Domain X-axial Signal

   - "MeanBodyGyroTimeY" : MEAN of Body Gyro Time Domain Y-axial Signal

   - "MeanBodyGyroTimeZ" : MEAN of Body Gyro Time Domain Z-axial Signal
 
   - "StdDevBodyGyroTimeX" : STANDARD DEVIATION of Body Gyro Time Domain X-axial Signal

   - "StdDevBodyGyroTimeY" : STANDARD DEVIATION of Body Gyro Time Domain Y-axial Signal

   - "StdDevBodyGyroTimeZ" : STANDARD DEVIATION of Body Gyro Time Domain Z-axial Signal

   - "MeanBodyGyroJerkTimeX" : MEAN of Body Gyro Jerk Time Domain X-axial Signal

   - "MeanBodyGyroJerkTimeY" : MEAN of Body Gyro Jerk Time Domain Y-axial Signal

   - "MeanBodyGyroJerkTimeZ" : MEAN of Body Gyro Jerk Time Domain Z-axial Signal

   - "StdDevBodyGyroJerkTimeX" : STANDARD DEVIATION of Body Gyro Jerk Time Domain X-axial Signal

   - "StdDevBodyGyroJerkTimeY" : STANDARD DEVIATION of Body Gyro Jerk Time Domain Y-axial Signal

   - "StdDevBodyGyroJerkTimeZ" : STANDARD DEVIATION of Body Gyro Jerk Time Domain Z-axial Signal
     
   - "MeanBodyAccMagnitudeTime" : MEAN of Body Acceleration Magnitude time

   - "StdDevBodyAccMagnitudeTime" : STANDARD DEVIATION of Body Acceleration Magnitude time

   - "MeanGravityAccMagnitudeTime" : MEAN of Gravity Acceleration Magnitude time

   - "StdDevGravityAccMagnitudeTime" : STANDARD DEVIATION of Gravity Acceleration Magnitude time

   - "MeanBodyAccJerkMagnitudeTime" : MEAN of Body Acceleration Jerk Magnitude time

   - "StdDevBodyAccJerkMagnitudeTime" : STANDARD DEVIATION of Body Acceleration Jerk Magnitude time

   - "MeanBodyGyroMagnitudeTime" : MEAN of Body Gyro Magnitude time

   - "StdDevBodyGyroMagnitudeTime" : STANDARD DEVIATION of Body Gyro Magnitude time

   - "MeanBodyGyroJerkMagnitudeTime" : MEAN of Body Gyro Jerk Magnitude time

   - "StdDevBodyGyroJerkMagnitudeTime" : STANDARD DEVIATION of Body Gyro Jerk Magnitude time

   - "MeanBodyAccFrequencyX" : MEAN of Body Acceleration Frequency Domain X-axial Signal

   - "MeanBodyAccFrequencyY" : MEAN of Body Acceleration Frequency Domain Y-axial Signal

   - "MeanBodyAccFrequencyZ" : MEAN of Body Acceleration Frequency Domain Z-axial Signal

   - "StdDevBodyAccFrequencyX" : STANDARD DEVIATION of Body Acceleration Frequency Domain X-axial Signal

   - "StdDevBodyAccFrequencyY" : STANDARD DEVIATION of Body Acceleration Frequency Domain Y-axial Signal

   - "StdDevBodyAccFrequencyZ" : STANDARD DEVIATION of Body Acceleration Frequency Domain Z-axial Signal

   - "MeanBodyAccJerkFrequencyX" : MEAN of Body Acceleration Jerk Frequency Domain X-axial Signal

   - "MeanBodyAccJerkFrequencyY" : MEAN of Body Acceleration Jerk Frequency Domain Y-axial Signal

   - "MeanBodyAccJerkFrequencyZ" : MEAN of Body Acceleration Jerk Frequency Domain Z-axial Signal

   - "StdDevBodyAccJerkFrequencyX" : STANDARD DEVIATION of Body Acceleration Jerk Frequency Domain X-axial Signal

   - "StdDevBodyAccJerkFrequencyY" : STANDARD DEVIATION of Body Acceleration Jerk Frequency Domain Y-axial Signal

   - "StdDevBodyAccJerkFrequencyZ" : STANDARD DEVIATION of Body Acceleration Jerk Frequency Domain Z-axial Signal 

   - "MeanBodyGyroFrequencyX" : MEAN of Body Gyro Frequency Domain X-axial Signal

   - "MeanBodyGyroFrequencyY" : MEAN of Body Gyro Frequency Domain Y-axial Signal

   - "MeanBodyGyroFrequencyZ" : MEAN of Body Gyro Frequency Domain Z-axial Signal

   - "StdDevBodyGyroFrequencyX" : STANDARD DEVIATION of Body Gyro Frequency Domain X-axial Signal

   - "StdDevBodyGyroFrequencyY" : STANDARD DEVIATION of Body Gyro Frequency Domain Y-axial Signal

   - "StdDevBodyGyroFrequencyZ" : STANDARD DEVIATION of Body Gyro Frequency Domain Z-axial Signal
 
   - "MeanBodyAccMagnitudeFrequency" : MEAN of Body Acceleration Magnitude Frequency

   - "StdDevBodyAccMagnitudeFrequency" : STANDARD DEVIATION of Body Acceleration Magnitude Frequency

   - "MeanBodyAccJerkMagnitudeFrequency" : MEAN of Body Acceleration Jerk Magnitude Frequency

   - "StdDevBodyAccJerkMagnitudeFrequency" : STANDARD DEVIATION of Body Acceleration Jerk Magnitude Frequency

   - "MeanBodyGyroMagnitudeFrequency" : MEAN of Body Gyro Magnitude Frequency

   - "StdDevBodyGyroMagnitudeFrequency" : STANDARD DEVIATION of Body Gyro Magnitude Frequency

   - "MeanBodyGyroJerkMagnitudeFrequency" : MEAN of Body Gyro Jerk Magnitude Frequency

   - "StdDevBodyGyroJerkMagnitudeFrequency" : STANDARD DEVIATION of Body Gyro Jerk Magnitude Frequency

