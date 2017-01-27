library(data.table)
library(dplyr)

# Read data
x_test <- fread("./test/x_test.txt")
x_train <- fread("./train/x_train.txt")
y_test <- fread("./test/y_test.txt")
y_train <- fread("./train/y_train.txt")
subject_test <- fread("./test/subject_test.txt")
subject_train <- fread("./train/subject_train.txt")
activity_labels <- fread("./activity_labels.txt")
features <- fread("./features.txt")

# Perform row binds to combine test and train data
allX <- rbind(x_test, x_train)
allSubjects <- rbind(subject_test, subject_train)  
allActivities <- rbind(y_test, y_train)  

# Column bind allX, allSubjects, and allActivities to a data frame
df_all <- cbind(allX, allSubjects, allActivities)

# Provide headers for the df_all dataframe
headers <- c(features$V2, "subjects", "activities")
names(df_all) <- headers

# Extract the means and standard deviations from the above dataframe by removing irrelevant columns
for (header in headers) {
    if (!(grepl("-mean()", header) | grepl("-std()", header) | header == "subjects" | header == "activities" )) {
        temp <- quote(header)
        df_all[,eval(temp)] <- NULL
    }
}

# Replace activity id with activity name
df_all$activities <- as.character(df_all$activities)
df_all$activities[df_all$activities == "1"] <- "WALKING"
df_all$activities[df_all$activities == "2"] <- "WALKING_UPSTAIRS"
df_all$activities[df_all$activities == "3"] <- "WALKING_DOWNSTAIRS"
df_all$activities[df_all$activities == "4"] <- "SITTING"
df_all$activities[df_all$activities == "5"] <- "STANDING"
df_all$activities[df_all$activities == "6"] <- "LAYING" 

# Write data frame
fn <- "./df_all.csv"
if (file.exists(fn)) { file.remove(fn) }
write.csv(df_all, file = fn, row.names = FALSE)

# Group df_all by subjects and activities; store as df_all_means
df_all_means <- df_all %>% group_by(subjects, activities) %>% summarise_each(funs(mean))

# Write df_all_means
fn <- "./meansByActAndSub.txt"
if (file.exists(fn)) { file.remove(fn) }
write.table(df_all_means, file = fn, row.names = FALSE)
