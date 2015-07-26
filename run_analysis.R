# This program helps prepare the data for analysis. The data tables used in this are 
### Step 1 - Merge training and test data sets
## Rad the data sets from files
#The subjects 1 - 30 in the experiment train and test are read in 
strain <- read.table("train/subject_train.txt")
stest <- read.table("test/subject_test.txt")
activity_labels <- read.table("activity_labels.txt")[, 2]

# read the training data
xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")

# read the test data 
xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/y_test.txt")

# Merge the data sets. Add columns of Subject and Activity to the train data
train_merged <- cbind(strain, ytrain, xtrain)
test_merged <- cbind(stest, ytest, xtest)
# Now merge the both the train and test datasets
merged_data <- rbind(train_merged, test_merged)

# cretae a row vector of readable feature names.
fset <- read.table("features.txt")
fnset <- as.character(fset[, 2])
# Now add the col names fro subject and activity to form the entire merged feature set
readable_feature_names <- c("Subject ID", "Activity", fnset)
# Remove non alpha numeric characters from the names
readable_feature_names <- gsub("[^[:alpha:]]", "", readable_feature_names)

# Set readable column names for the merged dataset
colnames(merged_data) <- readable_feature_names
#Map the activity label to the numeric indicator in the ativity columns
merged_data$Activity <- mapvalues(merged_data$Activity, from = c(1, 2, 3, 4, 5, 6), to = as.character(activity_labels))

# Remove duplicate columns from the merged data sets 
merged_data <- merged_data[, !duplicated(colnames(merged_data))]

# Extract the columns that have "mean()" or "std()" in train dataset
merged_data_final <- select(merged_data, matches("subject|Activity|mean|std"))
merged_data_final <- select(merged_data_final, -contains("angle"))

# Step 5 aggregating the dta with average of each variable by subject and activity
aggregate_ave_subject_activity <- aggregate(merged_data_final[, 3:ncol(merged_data_final)],
                       by=list('Subject ID' = merged_data_final$`SubjectID`, 
                               'Activity' = merged_data_final$Activity),
                       mean)
#Write to table
write.table(format(aggregate_ave_subject_activity, scientific=T), "tidy_data_2.txt",
            row.names=F, col.names=F, quote=2)

