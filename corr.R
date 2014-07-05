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