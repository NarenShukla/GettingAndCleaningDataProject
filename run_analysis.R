
################################################################

#####            Create Training Set                       #####

################################################################

library(plyr); library(dplyr); library(reshape2)

path <- ".\\data\\"

# Load (X_train.txt) into {trainSet} - Contains 7352 x 561
# Has 561 columns "V1","V2"..."V561"

   trainSet <- read.table(paste0(path, "X_train.txt"), 
                                stringsAsFactors=FALSE)


# Load titles from (features.txt) into {featureList}
# Has 2 columns "V1","V2"

  featureList <- read.table(paste0(path, "features.txt"), 
                                stringsAsFactors=FALSE)

  featureListTransposed <- t(featureList)

  featureListTitleRow <- featureListTransposed[2,]

# Add title-row to {trainSet}

  names(trainSet) <- featureListTitleRow

# Load (subject_train.txt) into {subTrain} - Contains 7352 rows
# Has single column "V1"

  subTrain <- read.table(paste0(path, "subject_train.txt"), 
                                stringsAsFactors=FALSE)


# Add title-row to {subTrain}

  names(subTrain) <- "SubjectPerson"

# Load (y_train.txt) into {actTrain} - Contains 7352 rows
# Has single column "V1"

  actTrain <- read.table(paste0(path, "y_train.txt"), 
                                stringsAsFactors=FALSE)


# Load(activity_labels.txt) into {actLabels} - Contains 6 x 2
# Has 2 columns "V1","V2"
# Add column "V3", give meaningful activity names

  actLabels <- read.table(paste0(path, "activity_labels.txt"), 
                                stringsAsFactors=FALSE)

  actLabels$V3 <- c("Walk", "WalkUp","WalkDown", "Sit",
                    "Stand","Lay")


# Merge {actTrain} and {actLabels}. Call it {actTrainNew}

  actTrainNew <- join(actTrain, actLabels)

# Add title-row to {actTrainNew}

  names(actTrainNew)<- c("ActivityID","ActivityDescription",
                         "ActivityName")

# Pre-pend {subTrain}, {actTrainNew} to {trainSet} 
# Call it {trainSetNew}. It contains 7352 x 563
# columns are : "SubjectPerson","ActivityName",...

  trainSetNew <- cbind(subTrain, actTrainNew$ActivityName,
                          trainSet)  

  names(trainSetNew)[2] <- "ActivityName"

################################################################

#####            Create Test Set                           #####

################################################################


# Load (X_test.txt) into {testSet} - Contains 2947 x 561
# Has 561 columns "V1","V2"..."V561"

  testSet <- read.table(paste0(path, "X_test.txt"), 
                                stringsAsFactors=FALSE)


# Load titles from (features.txt) into {featureList}
# This step is executed above



# Add title-row to {testSet}
 
  names(testSet) <- featureListTitleRow

# Load (subject_test.txt) into {subTest} - Contains 2947 rows
# Has single column "V1"

  subTest <- read.table(paste0(path, "subject_test.txt"), 
                                stringsAsFactors=FALSE)



# Add title-row to {subTest}

  names(subTest) <- "SubjectPerson"

# Load (y_test.txt) into {actTest} - Contains 2947 rows
# Has single column "V1"

  actTest <- read.table(paste0(path, "y_test.txt"), 
                                stringsAsFactors=FALSE)



# Load(activity_lables.txt) into {actLabels} - Contains 6 x 2
# Has 2 columns "V1","V2"
# Add column "V3", give meaningful activity names
# This step is already done



# Merge {actTest} and {actLabels}. Call it {actTestNew}

  actTestNew <- join(actTest, actLabels)

# Add title-row to {actTestNew}

  names(actTestNew)<- c("ActivityID","ActivityDescription",
                         "ActivityName")


# Pre-pend {subTest}, {actTestNew} to {testSet} 
# Call it {testSetNew}. It contains 2947 x 563
# columns are : "SubjectPerson","ActivityName",...

  testSetNew <- cbind(subTest, actTestNew$ActivityName,
                          testSet)  

  names(testSetNew)[2] <- "ActivityName"



################################################################

#####            Merge Training & Test sets                #####

################################################################

# Merge {trainSetNew} and {testSetNew} - Contains 10299 x 563
# Call it {combinedSet}

  combinedSet <- rbind(trainSetNew, testSetNew)

################################################################

#####         Extract Mean and Standard Deviation fields   #####

################################################################


# Extract Mean and Standard Deviation fields from{combinedSet}
# Call it {finalSet}. It contains 10299 x 68

   meanColumns <- grep("\\-mean\\(\\)",names(combinedSet))

   SDcolumns   <- grep("std",names(combinedSet))

   meanAndSDcolumns <- sort(c(1,2, meanColumns, SDcolumns))

   finalSet <- combinedSet[,meanAndSDcolumns] 


# Label {finalSet} with descriptive variable names. Activities 
# are already named with descriptive activity names.

   names(finalSet) <- c("SubjectPerson", "ActivityName",

     "MeanBodyAccSignalTimeX","MeanBodyAccSignalTimeY",
     "MeanBodyAccSignalTimeZ",
     "StdDevBodyAccSignalTimeX", "StdDevBodyAccSignalTimeY",
     "StdDevBodyAccSignalTimeZ",  
       
     "MeanGravityAccSignalTimeX", "MeanGravityAccSignalTimeY",
     "MeanGravityAccSignalTimeZ", 
     "StdDevGravityAccSignalTimeX", 
     "StdDevGravityAccSignalTimeY",
     "StdDevGravityAccSignalTimeZ",
   
     "MeanBodyAccJerkTimeX","MeanBodyAccJerkTimeY",
     "MeanBodyAccJerkTimeZ",
     "StdDevBodyAccJerkTimeX","StdDevBodyAccJerkTimeY",
     "StdDevBodyAccJerkTimeZ",

     "MeanBodyGyroTimeX","MeanBodyGyroTimeY","MeanBodyGyroTimeZ", 
     "StdDevBodyGyroTimeX",
     "StdDevBodyGyroTimeY","StdDevBodyGyroTimeZ",

     "MeanBodyGyroJerkTimeX",
     "MeanBodyGyroJerkTimeY","MeanBodyGyroJerkTimeZ", 
     "StdDevBodyGyroJerkTimeX",
     "StdDevBodyGyroJerkTimeY","StdDevBodyGyroJerkTimeZ",
     
     "MeanBodyAccMagnitudeTime",
     "StdDevBodyAccMagnitudeTime",

     "MeanGravityAccMagnitudeTime",
     "StdDevGravityAccMagnitudeTime",

     "MeanBodyAccJerkMagnitudeTime",
     "StdDevBodyAccJerkMagnitudeTime",

     "MeanBodyGyroMagnitudeTime",
     "StdDevBodyGyroMagnitudeTime",

     "MeanBodyGyroJerkMagnitudeTime",
     "StdDevBodyGyroJerkMagnitudeTime",

     "MeanBodyAccFrequencyX","MeanBodyAccFrequencyY",
     "MeanBodyAccFrequencyZ",
     "StdDevBodyAccFrequencyX",
     "StdDevBodyAccFrequencyY",
     "StdDevBodyAccFrequencyZ",  

     "MeanBodyAccJerkFrequencyX",
     "MeanBodyAccJerkFrequencyY",
     "MeanBodyAccJerkFrequencyZ",
     "StdDevBodyAccJerkFrequencyX",
     "StdDevBodyAccJerkFrequencyY",
     "StdDevBodyAccJerkFrequencyZ",  

     "MeanBodyGyroFrequencyX",
     "MeanBodyGyroFrequencyY",
     "MeanBodyGyroFrequencyZ", 
     "StdDevBodyGyroFrequencyX",
     "StdDevBodyGyroFrequencyY",
     "StdDevBodyGyroFrequencyZ",
 
     "MeanBodyAccMagnitudeFrequency",
     "StdDevBodyAccMagnitudeFrequency",

     "MeanBodyAccJerkMagnitudeFrequency",
     "StdDevBodyAccJerkMagnitudeFrequency",

     "MeanBodyGyroMagnitudeFrequency",
     "StdDevBodyGyroMagnitudeFrequency",

     "MeanBodyGyroJerkMagnitudeFrequency",
     "StdDevBodyGyroJerkMagnitudeFrequency")


################################################################

#####        Create Tidy DataSet with Averages             #####

################################################################


# Create another data-set. Call it {tidySet}. It contains (each 
# Subject), (each Activity), (average of each variable)
# Load intermediate result into {finalSetMelt}. 
# It cotains 679734 x 4
# {tidySet} contains 180 x 68

     finalSetMelt <- melt(finalSet, id=1:2, 
                                measure.vars=3:68)

     tidySet <- dcast(finalSetMelt, 
                        SubjectPerson + ActivityName ~ variable,
                        mean)
    
     if (file.exists("tidySet.txt")) 
           {
              file.remove("tidySet.txt")
           }


     write.table(tidySet,"tidySet.txt", row.names=FALSE)


###############################################################

































































































