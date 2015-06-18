# Getting And Cleaning Data Project
## by Robert Andrew Jagger (jagzuk)

The code in this repository is a solution to the project assingment for this course and outputs file called **tidy_data_set.txt**. 

The code comprises a single R script `run_analysis.R` that was developed using R studio. The script uses R core commands and does not require any additional libraries.

Information providing background and details of the source data files can be view at: (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

When first executed the script will download and unpack the data into a subdirectory of the current working directory (the sub directory will be created if it is not already present). 

On subsequent executions, the script will detect that the data has already been download and will skip the download set.

**Note:** This code was written for use on Windows 8.1, on other operating systems you may need to modify the parameters of the download.file command.

For further information on the data and the operation of the script, see *CodeBook.md* in this repository.




 




