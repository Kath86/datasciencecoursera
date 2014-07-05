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
