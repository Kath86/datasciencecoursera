## Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) 
## across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 
## 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate 
## matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant 
## across all of the monitors, ignoring any missing values coded as NA. 


pollutantmean <- function(directory, pollutant, id = 1:332){
  directory <- "C:/Dokumente und Einstellungen/Kath/Desktop/specdata"
  files_list <- dir(path = directory,pattern = "csv", full.names = TRUE)
  alldata <- data.frame()
  for (i in id) {
    alldata <- rbind(alldata, read.csv(files_list[i]))
  }
  if(pollutant == "sulfate"){
    pollutantmean <- mean(alldata$sulfate, na.rm = TRUE)
  }
  else if(pollutant == "nitrate"){
    pollutantmean <- mean(alldata$nitrate, na.rm = TRUE)
  }
  pollutantmean
}
