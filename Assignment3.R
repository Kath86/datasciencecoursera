## Write a function called best that take two arguments (state and outcome). The function reads the 
## outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that 
## has the bes (i.e. lowest) 30-Day mortality for the specified outcome in that state.

best <- function(state, outcome) {
        ## read the data of the file
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character",na.strings = "Not Available")
        
        ## Filter the column names
        data <- data[c(2, 7, 11, 17,23)]
        
        ## rename the column names
        names(data)[1] <- "name"
        names(data)[2] <- "state"
        names(data)[3] <- "heart attack"
        names(data)[4] <- "heart failure"
        names(data)[5] <- "pneumonia"
        
        ## validate the outcome string
        y <- c("heart attack", "heart failure", "pneumonia")
        if(outcome %in% y == FALSE) stop("invalid outcome")
        
        ## Validate the state string
        x <- data[, 2]
        x <- unique(x)
        if(state %in% x == FALSE) stop("invalid state")
        
        ## takes only rows with the state value
        data <- data[data$state == state & data[outcome] !='NA',]
        vals <- data[, outcome]
        rowNum <- which.min(vals)
        
        ## Return hospital name in the state with 30-day death rate
        data[rowNum, ]$name
}


