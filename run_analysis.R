########################################
# Task 1

# Merge X
datafile1 <- read.table("./train/X_train.txt")
datafile2 <- read.table("./test/X_test.txt")
mergeddataX <- rbind(datafile1,datafile2)
write.table(mergeddataX,"./merged/X_merged.txt", row.names = FALSE, col.names = FALSE)

# Just in case, all(colSums(is.na(mergeddataX))==0) returns TRUE 
# i.e., no NAs in the data

# Merge y
datafile1 <- read.table("./train/y_train.txt")
datafile2 <- read.table("./test/y_test.txt")
mergeddataY <- rbind(datafile1,datafile2)
write.table(mergeddataY,"./merged/y_merged.txt", row.names = FALSE, col.names = FALSE)

# Merge subject
datafile1 <- read.table("./train/subject_train.txt")
datafile2 <- read.table("./test/subject_test.txt")
mergeddata <- rbind(datafile1,datafile2)
write.table(mergeddata,"./merged/subject_merged.txt", row.names = FALSE, col.names = FALSE)

# Merge body_gyro_x_
datafile1 <- read.table("./train/Inertial\ Signals/body_gyro_x_train.txt")
datafile2 <- read.table("./test/Inertial\ Signals/body_gyro_x_test.txt")
mergeddata <- rbind(datafile1,datafile2)
write.table(mergeddata,"./merged/Inertial\ Signals/body_gyro_x_merged.txt", row.names = FALSE, col.names = FALSE)

# Merge body_gyro_y_
datafile1 <- read.table("./train/Inertial\ Signals/body_gyro_y_train.txt")
datafile2 <- read.table("./test/Inertial\ Signals/body_gyro_y_test.txt")
mergeddata <- rbind(datafile1,datafile2)
write.table(mergeddata,"./merged/Inertial\ Signals/body_gyro_y_merged.txt", row.names = FALSE, col.names = FALSE)

# Merge body_gyro_z_
datafile1 <- read.table("./train/Inertial\ Signals/body_gyro_z_train.txt")
datafile2 <- read.table("./test/Inertial\ Signals/body_gyro_z_test.txt")
mergeddata <- rbind(datafile1,datafile2)
write.table(mergeddata,"./merged/Inertial\ Signals/body_gyro_z_merged.txt", row.names = FALSE, col.names = FALSE)

#####################
# Merge total_acc_x_
datafile1 <- read.table("./train/Inertial\ Signals/total_acc_x_train.txt")
datafile2 <- read.table("./test/Inertial\ Signals/total_acc_x_test.txt")
mergeddata <- rbind(datafile1,datafile2)
write.table(mergeddata,"./merged/Inertial\ Signals/total_acc_x_merged.txt", row.names = FALSE, col.names = FALSE)

# Merge total_acc_y_
datafile1 <- read.table("./train/Inertial\ Signals/total_acc_y_train.txt")
datafile2 <- read.table("./test/Inertial\ Signals/total_acc_y_test.txt")
mergeddata <- rbind(datafile1,datafile2)
write.table(mergeddata,"./merged/Inertial\ Signals/total_acc_y_merged.txt", row.names = FALSE, col.names = FALSE)

# Merge total_acc_z_
datafile1 <- read.table("./train/Inertial\ Signals/total_acc_z_train.txt")
datafile2 <- read.table("./test/Inertial\ Signals/total_acc_z_test.txt")
mergeddata <- rbind(datafile1,datafile2)
write.table(mergeddata,"./merged/Inertial\ Signals/total_acc_z_merged.txt", row.names = FALSE, col.names = FALSE)

#####################
# Merge body_acc_x_
datafile1 <- read.table("./train/Inertial\ Signals/body_acc_x_train.txt")
datafile2 <- read.table("./test/Inertial\ Signals/body_acc_x_test.txt")
mergeddata <- rbind(datafile1,datafile2)
write.table(mergeddata,"./merged/Inertial\ Signals/body_acc_x_merged.txt", row.names = FALSE, col.names = FALSE)

# Merge body_acc_y_
datafile1 <- read.table("./train/Inertial\ Signals/body_acc_y_train.txt")
datafile2 <- read.table("./test/Inertial\ Signals/body_acc_y_test.txt")
mergeddata <- rbind(datafile1,datafile2)
write.table(mergeddata,"./merged/Inertial\ Signals/body_acc_y_merged.txt", row.names = FALSE, col.names = FALSE)

# Merge body_acc_z_
datafile1 <- read.table("./train/Inertial\ Signals/body_acc_z_train.txt")
datafile2 <- read.table("./test/Inertial\ Signals/body_acc_z_test.txt")
mergeddata <- rbind(datafile1,datafile2)
write.table(mergeddata,"./merged/Inertial\ Signals/body_acc_z_merged.txt", row.names = FALSE, col.names = FALSE)


########################################
# Task 2

# First, load the feature names of all variables
features <- read.table("./features.txt")

# Second, measurements on the mean and standard deviation are those with "mean()" or "std()" 
# in the feature names. grep can be used to search for these strings using regular expressions:
iFeaturesMeanStd <- grep("mean[(][)]|std[(][)]", features$V2, ignore.case = TRUE, value = FALSE)

# grep returns the indices of the found values, so we need all rows from
# the data set (mergeddataX) for the columns that correspond to these indices: 
dataMeansStds <- mergeddataX[,iFeaturesMeanStd]


########################################
# Task 3
library(dplyr)

# First, make a vector with the activity names:
activityDesc <- c("WALKING",
                  "WALKING_UPSTAIRS",
                  "WALKING_DOWNSTAIRS",
                  "SITTING",
                  "STANDING",
                  "LAYING")

# Second, add the activity name to the data frame of activities performed in 
# the experiment, and name it 'activities':
activities <- mutate(mergeddataY, activity = activityDesc[mergeddataY$V1])


########################################
# Task 4
# Use the colnames function to specify the column names of a data frame:
colnames(features) <- c("id", "FeatureName")	# label the columns of features
colnames(activities) <- c("ActivityId", "ActivityName")	# label the columns of activities

subjects <- read.table("./merged/subject_merged.txt")	# load the subject (volunteer) ids
colnames(subjects) <- c("SubjectId")			# label the columns of subjects
colnames(mergeddataX) <- features[,2]		# label the columns of experiment
# measurements (stored in mergeddataX)

# Recall from Task 2 that iFeaturesMeanStd contains the indices of the columns
# that correspond to the measurements on means and standard deviations
# Thus, we obtain the labels of these features by subsetting the corresponding
# rows from the features data frame:
columnLabels <- features[iFeaturesMeanStd,2]
colnames(dataMeansStds) <- columnLabels


########################################
# Task 5

# Goal: Compute average of each of the 66 variables of the dataMeansStds data frame,
#	grouping by subject and activity. To achieve this, it is necessary to merge
#	this data frame with the corresponding subjects and activities.

# a. Add a sequential id to be used as a column for the merge in all the required data frames.
#	This id ranges from 1 to 10299. The limit 10299 can be generalized as the rows of 
#	the dimension of the data frame (i.e., dim(dataMeansStds)[1]):
ids <- seq_len(dim(dataMeansStds)[1]) # Generate the sequence of ids

dataMeansStds["id"] <- ids	# add the ids column to dataMeansStds
subjects["id"] <- ids		# add the ids column to subjects
activities["id"] <- ids		# add the ids column to activities

# b. Merge the data frames by the added column "id"
finaldata <- merge(subjects, activities, sort=FALSE)		# First subjects and activities
finaldata <- merge(finaldata, dataMeansStds, sort=FALSE)	# Then, measurements

# c. Delete the id column 
finaldata$id <- NULL

# d. Average the 66 variables grouping by subject and activity
bySubjectActivity <- group_by(finaldata, SubjectId, ActivityId, ActivityName)
meansBySA <- summarise_each(bySubjectActivity, funs(mean))



########################################
# Finally, save the tidy data set
write.table(meansBySA,"./merged/meansBySA.txt", row.names = FALSE, col.names = TRUE)