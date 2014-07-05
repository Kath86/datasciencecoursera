complete <- function(directory, id = 1:332){
  directory <- "C:/Dokumente und Einstellungen/Kath/Desktop/specdata"
  files_list <- dir(path = directory,pattern = "csv", full.names = TRUE)
  alldata <- data.frame()
  nobs <- NULL
  for (i in id) {
    alldata <- read.csv(files_list[i])
    y <- sum(complete.cases(alldata))
    nobs <- c(nobs, y)
  }
  
  result <- data.frame(id, nobs)
  result
}