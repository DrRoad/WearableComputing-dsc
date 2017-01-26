# WearableComputing-dsc (course project)
<h3>General Topic: IoT data processing (from wearable devices)</h3>

In this course project, several tasks must be performed on data resulted from experiments published and described in [1]. In short, 30 volunteers (19-48 years old) performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone. Data was captured from the smartphone's accelerometer and gyroscope at a constant rate of 50Hz, and labeled manually. Finally, 70% of the volunteers' data was randomly selected as "training" data, and the remaining 30% as "test" data.

The course project consists in creating one R script "run_analysis.R" that:

<ol>
<li> Merges the training and the test sets to create one data set.
</li>
<li> Extracts only the measurements on the mean and standard deviation for each measurement.
</li>
<li> Uses descriptive activity names to name the activities in the data set
</li>
<li> Appropriately labels the data set with descriptive variable names.
</li>
<li> From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
</li>
</ol>


<h4>Task 1. Merge the training and the test sets to create one data set.
</h4>

As explained in [1], the data can be downloaded in a .zip file. Once extracted, the data is presented in two data sets "train" and "test". Each of these data sets is comprised, equivalently for "train" and "test", of one folder "Inertial Signals" (with nine files: (x,y,z)-gyroscope data, (x,y,z)-accelerometer data, and (x,y,z)-total accelerometer data), and three files (X data; y data; and Subject data). Concretely, the files for the "train" data set are:

<ul>
<li> X_train.txt: Training set. Domain: Float numbers. 
</li>
<li> y_train.txt: Training labels. Domain: Integer numbers 1 to 6, with
  <ul>
	<li> 	1 WALKING
	</li>
	<li>	2 WALKING_UPSTAIRS
	</li>
	<li>	3 WALKING_DOWNSTAIRS
	</li>
	<li>	4 SITTING
	</li>
	<li>	5 STANDING
	</li>
	<li>	6 LAYING. 
	</li>
  </ul>
</li>
<li> subject_train.txt: Subject data, each row identifying the subject who performed the activity for each window sample. Domain: Integers 1 to 30. 
</li>
<li> Folder "Inertial Signals" with (x,y,z)-gyroscope angular velocity data, (x,y,z)-total acceleration data from the accelerometer, (x,y,z)-estimated body acceleration data:
  <ol>
	<li>	body_gyro_x_train.txt: The angular velocity vector for the X axis measured by the gyroscope for each window sample. The units are radians/second. Domain: Float numbers.
	</li>
	<li>	body_gyro_y_train.txt: The same 'body_gyro_x_train.txt' data for the Y axis.
	</li>
	<li>	body_gyro_z_train.txt: The same 'body_gyro_x_train.txt' data for the Z axis. 
	</li>
	<li>	total_acc_x_train.txt: The acceleration signal from the accelerometer X axis in standard gravity units 'g'. Every row is a 128 element vector. Domain: Float numbers. 
	</li>
	<li>	total_acc_y_train.txt: The same 'total_acc_x_train.txt' data for the Y axis.
	</li>
	<li>	total_acc_z_train.txt: The same 'total_acc_x_train.txt' data for the Z axis.
	</li>
	<li>	body_acc_x_train.txt: The body acceleration signal in the X axis obtained by subtracting the gravity from the total acceleration. Domain: Float numbers.
	</li>
	<li>	body_acc_y_train.txt: The same 'body_acc_x_train.txt' data for the Y axis.
	</li>
	<li>	body_acc_z_train.txt: The same 'body_acc_x_train.txt' data for the Z axis.
	</li>
  </ol>
</li>
</ul>

The equivalent files are available for the "test" data. 

It is worth noting that the task instructions makes reference to these 12 files as one "data set". Thus, to build one data set, it is necessary to combine the two sets of files, "train" and "test". This operation can be performed using the rbind(f1,f2) function, which concatenates the contents of f2 after the contents of f1 and then writing the resulting data frame, on each of the 12 files.


<pre><code>
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
</code></pre>


<!-- =================================================================== -->
<h4>Task 2. Extracts only the measurements on the mean and standard deviation for each measurement.</h4>

<pre><code>
# First, load the feature names of all variables
features <- read.table("./features.txt")

# Second, measurements on the mean and standard deviation are those with "mean()" or "std()" 
# in the feature names. grep can be used to search for these strings using regular expressions:
iFeaturesMeanStd <- grep("mean[(][)]|std[(][)]", features$V2, ignore.case = TRUE, value = FALSE)

# grep returns the indices of the found values, so we need all rows from
# the data set (mergeddataX) for the columns that correspond to these indices: 
dataMeansStds <- mergeddataX[,iFeaturesMeanStd]
</code></pre>


<!-- =================================================================== -->
<h4>Task 3. Uses descriptive activity names to name the activities in the data set.</h4>

<pre><code>
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
</code></pre>


<!-- =================================================================== -->
<h4>Task 4. Appropriately labels the data set with descriptive variable names.</h4>

The data set, for now, comprises the following main data frames:

<ol>
	<li> features: the feature names</li>
	<li> activities: the id of the activities to which correspond the experiment</li>
	<li> subjects: the id of the subjects that performed the activity</li>
	<li> mergeddataX: the measurements taken on the experiments</li>
	<li> dataMeansStds: the measurements on means and standard deviations</li>
</ol>

To appropriately label each of these data frames, use the following code:
<pre><code>
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
</code></pre>



<!-- =================================================================== -->
<h4>Task 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</h4>

The original data set has 10,299 observations of 561 variables, for 30 volunteers performing 6 kinds of activities. No NAs present.

In the previous steps, I extracted the measurements on means and standard deviations (stored in the dataMeansStds data frame, resulting in 10,299 observations of 66 variables. Also, I added complementary data for the values to be more self-explaining in the data sets.

Now, an independent data set with the average of each variable for each activity and each subject would have 30 x 6 observations of each of the 66 variables. This data frame is build with the following code:

<pre><code>
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
</code></pre>



<!-- =================================================================== -->
References

<ol>
<li> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. </li> 
</ol>
