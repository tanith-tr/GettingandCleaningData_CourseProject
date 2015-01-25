# run_analysis.R
# course project script

# Preliminary: 

# Get the data.  it's in a zip file, so download contents
# from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# Then, gather the relevant files into a folder named "UCIHAR" in your working directory

# The code:

# Read the data files into R:
subtest <- read.table("./UCIHAR/test/subject_test.txt")
xtest <- read.table("./UCIHAR/test/X_test.txt")
ytest <- read.table("./UCIHAR/test/y_test.txt")
subtrain <- read.table("./UCIHAR/train/subject_train.txt")
xtrain <- read.table("./UCIHAR/train/X_train.txt")
ytrain <- read.table("./UCIHAR/train/y_train.txt")
features <- read.table("./UCIHAR/features.txt")
activities <- read.table("./UCIHAR/activity_labels.txt")

# Merge all that data into one dataset
allx <- rbind(xtrain, xtest)
ally <- rbind(ytrain, ytest)
allsubject <- rbind(subtrain, subtest)
alldata <- cbind(allsubject, ally, allx)

# Clear unnecessary objects from workspace
rm(xtest,ytest,xtrain,ytrain,subtrain,subtest,allx,ally,allsubject)  

# Set names to variables
featureNames <- as.character(features[,2])
newCols <- c("subject", "activity", featureNames)
colnames(alldata) <- newCols
names(activities) <- c("id","activityname")

# Extract only the measurements on the mean and standard deviation for each measurement
library(plyr)
subdataFeaturesNames <- featureNames[grep("mean\\(\\)|std\\(\\)", featureNames)]

# Subset alldata by selected names
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
subdata<-subset(alldata,select=selectedNames)

# Give descriptive activity names to the activities in the data set
subdata2 <- merge(subdata, activities, by.x="activity",by.y="id", all.x=TRUE)

# Label the data set with descriptive variable names
names(subdata2) <- gsub("Acc", "Accelerator", names(subdata2))
names(subdata2) <- gsub("Mag", "Magnitude", names(subdata2))
names(subdata2) <- gsub("Gyro", "Gyroscope", names(subdata2))
names(subdata2) <- gsub("^t", "time", names(subdata2))
names(subdata2) <- gsub("^f", "frequency", names(subdata2))
names(subdata2) <- gsub("BodyBody", "Body", names(subdata2))
names(subdata2) <- gsub("\\(\\)", "", names(subdata2))

# Create a second,independent tidy data set and output it
subdata3 <- aggregate(. ~subject + activityname, subdata2, mean)
subdata3 <- subdata3[order(subdata3$subject,subdata3$activityname),]
write.table(subdata3, file = "tidydata.txt",row.name=FALSE)