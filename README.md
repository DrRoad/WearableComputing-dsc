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

As explained in [1], the data can be downloaded in a .zip file. Once extracted, the data is split in two data sets "train" and "test". Each of these data sets is comprised, equivalently for "train" and "test", of one folder "Inertial Signals" (with nine files: (x,y,z)-gyroscope data, (x,y,z)-accelerometer data, and (x,y,z)-total accelerometer data), and three files (X data; y data; and Subject data). Concretely, the files for the "train" data set are:


<ul>
<li> X_train.txt: Training set. Domain: Float numbers. 
</li>
<li> y_train.txt: Training labels. Domain: Integer numbers 1 to 6, with
  <ol>
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
  </ol>
</li>
<li> subject_train.txt: Subject data, each row identifying the subject who performed the activity for each window sample. Domain: Integers 1 to 30. 
</li>
<li> Folder "Inertial Signals" with (x,y,z)-gyroscope angular velocity data, (x,y,z)-estimated body acceleration data, and (x,y,z)-total acceleration data from the accelerometer:
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

The equivalent files are available for the test data. 


<h5>References</h5>

<ol>
<li> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. </li> 
</ol>
