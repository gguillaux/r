# global variables
cwd           <- "~/dev/r/plst-eda-with-r"
raw_data      <- "raw_movies.txt" 

# set up working directory
setwd(cwd)

# load raw data tab delimited
movies_raw    <- read.table(file   =  raw_data,
                           header  = TRUE,
                           sep     = "\t",
                           quote   = "\"")



# *** #1 rename columns ***
# rename column TOMATO.METER to CRITICS.SCORE
names(movies_raw)[5] <- "Critics.Score"




# *** #2 clean null values ***
# how many null or NA values there are in the dataframe?
sum(is.na(movies_raw))      # returns 4

# remove lines with na values
movies_raw2  <- na.omit(movies_raw)

# validates removal
sum(is.na(movies_raw2))      # returns 0



# *** #3 clean null values ***
class(movies_raw2$Runtime)
# mean(movies_raw2$Runtime)  # fails because data is't numerical

# creates a serie with the factor / categorical data turned into caracter
runtimes            <- as.character(movies_raw2$Runtime)
# remove 'min' string
runtimes            <- trimws(sub("min", "", runtimes))
# convert to string
movies_raw2$Runtime <- as.integer(runtimes) 
# validate conversion
head(movies_raw2)
class(movies_raw2$Runtime)
mean(movies_raw2$Runtime)

summary(movies_raw2)


# *** #3 clean box office data ***
head(movies_raw2$Box.Office)
# create function to clean the data in the box office colun
clean_box_office <- function(box_office) {
    # convert to string
    string_bo  <- as.character(box_office)
    # remove $ | k | M characters
    cleaned_bo <- gsub("[$|M|k]", "", string_bo)
    # convert data type to numerical
    numeric_bo <- as.numeric(cleaned_bo)
    
    # return value accordingly
    if (grepl("M", string_bo)) {
      return(numeric_bo * 1.0)
    } else if (grepl("k", string_bo)) {
      return(numeric_bo * 0.001)
    } else {
      return(numeric_bo * 0.000001)
    }
}

# apply cleaning function to each record in the box office column
movies_raw2$Box.Office <- sapply(movies_raw2$Box.Office,
                                 clean_box_office)

# validate changes
head(movies_raw2$Box.Office)
tail(movies_raw2$Box.Office)
mean(movies_raw2$Box.Office)

# save new file as output_movies.csv
write.csv(movies_raw2, "output_movies.csv")
print("Success!")
