# cleaning_and_getting_data
Coursera Course 3 - cleaning and getting data

This script uses the input data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and creates two dataframes:

####df
is created as a result of

1. using *activity_labels.txt* to annotate each row in *Y_train.txt* and *y_test.txt*
2. using *features.txt* to annotate each column in *x_train.txt* and *x_test.txt*
3. using *y_train.txt* and subject_train.txt to annotate each row in *x_train.txt* and *x_test.txt*
4. merging *x_train.txt* and *x_test.txt* into preliminary dataframe *df*
5. extracting only columns containing text *mean* or *std* into final dataframe *df*

####dfsum
is created as a result of

1. grouping df by activity and subject
2. summarising with function mean across all other metrics
3. data is exported to a text file