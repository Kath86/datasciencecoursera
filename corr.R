## Write a function that takes a directory of data files and a threshold for complete cases and calculates the 
## correlation between sulfate and nitrate for monitor locations where the number of completely observed cases 
## (on all variables) is greater than the threshold. The function should return a vector of correlations for the 
## monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function 
## should return a numeric vector of length 0.

corr <- function(directory, threshold = 0){
  
  directory <- "C:/Dokumente und Einstellungen/Kath/Desktop/specdata"
  files_list <- dir(path = directory,pattern = "csv", full.names = TRUE)
  alldata <- data.frame()
  output_vector <- vector(mode = "numeric", length = 0)
  
  for (i in 1:332) {
    alldata <- read.csv(files_list[i])
    y_complete <- na.omit(alldata)
    count_row = nrow(y_complete)
    if (count_row >= threshold){
      cor.val = cor(y_complete$sulfate, y_complete$nitrate)
      output_vector = c(output_vector, cor.val)
    }
  }
  
  output_vector

}
