### Project Summary 

This project is done for Coursera `Data Science Specialization`, course 3 ie. `Getting and Cleaning Data`. 

The purpose of this project is to collect "Wearable Computing" data from Samsung Galaxy S smartphone, available at below address,

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Data Files Used

- 'features.txt' : list of 561 features captured. Both "Training" set and "Testing" set capture these features

- 'X_train.txt': Training Set. It contains 7352 rows

- 'X_test.txt': Test Set. It contains 2947 rows

- 'activity_labels.txt': It relates "Activity-IDs" to "Activity-Descriptions"

- 'y_train.txt': It contains "Activity-IDs" for Training Set. It contains 7352 rows

- 'y_test.txt': It contains "Activity-IDs" for Test Set. It contains 2947 rows

- 'subject_train.txt': It contains 1-30 "Person-IDs"for Training Set. It contains 7352 rows

- 'subject_test.txt': It contains 1-30 "Person-IDs" for Test Set. It contains 2947 rows


### File Structure Used 


- Current Working Directory : 
    - 'README.md': Explains various files. How they are connected

    - 'CodeBook.md': It describes the Data needed, the Transformations applied to the data as well as Variables used

    - `/data` directory :Contains data downloaded from above URL,
           - 'features.txt' 
           - 'X_train.txt' (github folder contains zipped file)
           - 'X_test.txt'  (github folder contains zipped file)
           - 'activity_labels.txt'
           - 'y_train.txt'
           - 'y_test.txt'
           - 'subject_train.txt'
           - 'subject_test.txt'

      Please see step below about how to extract the data. 

    - 'run_analysis.R': R script to process the data. Please see 'CodeBook.md' to understand the analysis done


### How to Extract the Data

- Visit above URL. Download ZIP file. Save it on your computer. Unzip it. It creates following folder structure,

-  getdata-projectfiles-UCI HAR Dataset (folder)
       - UCI HAR Dataset (folder)
           -  'activity_labels.txt'
           -  'features.txt'
           -  'features_info.txt'
           -  'README.txt'
           -  test  (folder)
              - 'X_test.txt'
              - 'y_test.txt'
              - 'subject_test.txt'
              - Inertial Signals (folder)
                   - 'body_acc_x_test.txt'
                   - 'body_acc_y_test.txt'
                   - 'body_acc_z_test.txt'
                   - 'body_gyro_x_test.txt'
                   - 'body_gyro_y_test.txt'
                   - 'body_gyro_z_test.txt'
                   - 'total_acc_x_test.txt'
                   - 'total_acc_y_test.txt'
                   - 'total_acc_z_test.txt'
           -  train (folder)
              - 'X_train.txt'
              - 'y_train.txt'
              - 'subject_train.txt'
              - Inertial Signals (folder)
                   - 'body_acc_x_train.txt'
                   - 'body_acc_y_train.txt'
                   - 'body_acc_z_train.txt'
                   - 'body_gyro_x_train.txt'
                   - 'body_gyro_y_train.txt'
                   - 'body_gyro_z_train.txt'
                   - 'total_acc_x_train.txt'
                   - 'total_acc_y_train.txt'
                   - 'total_acc_z_train.txt'

- Extract following files and put them into `/data` folder mentioned above,
  -  getdata-projectfiles-UCI HAR Dataset (folder)
       - UCI HAR Dataset (folder)
           -  'activity_labels.txt'
           -  'features.txt'
           -  test  (folder)
              - 'X_test.txt'
              - 'y_test.txt'
              - 'subject_test.txt'
           -  train (folder)
              - 'X_train.txt'
              - 'y_train.txt'
              - 'subject_train.txt'
 
  - After this is done, the `/data` folder should have following files,

           - 'features.txt' 
           - 'X_train.txt'
           - 'X_test.txt'
           - 'activity_labels.txt'
           - 'y_train.txt'
           - 'y_test.txt'
           - 'subject_train.txt'
           - 'subject_test.txt'

`Note that the "/data" folder on the github repository contains (X_train.zip) and (X_test.zip). You will need to un-zip them to get (X_train.txt) and (X_test.txt) files, after you download them to your PC`


### How to Process the Data

- Make sure (X_train.txt) and (X_test.txt) are in un-zipped format in "/data" folder 

- Once you have the above mentioned directory structure, execute the `run_analysis.R` file in "R Console". Make sure you "Change Dir..." in "R Console" to Current Working Directory, where "run_analysis.R" file is located

   > source "run_analysis.R"

- It should create `tidySet.txt` file in current working directory. This file should have 180 rows and 68 columns

- Please see 'CodeBook.md' to understand the analysis done





























































