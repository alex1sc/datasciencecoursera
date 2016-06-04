# calculates the mean of a pollutant (sulfate or nitrate) 
# across a specified list of monitors
# takes three arguments: 'directory', 'pollutant', and 'id'

# Given a vector monitor ID numbers, 'pollutantmean' reads that monitors'
# particulate matter data from the directory specified in the 'directory'
# argument and returns the mean of the pollutant across all of the monitors, 
# ignoring any missing values coded as NA.

# directory should be a relative directory from current wd
# pollutant "nitrate" or "sulfate"
# id as shown an integer vector max the number of files

pollutantmean <- function( directory, pollutant, id=1:332){
        
        # For all files "id" in "directory"
        # append their content to my_df
        my_df <- data.frame()
        
        l <- list.files( directory, pattern = "[0-9]{3}.csv")
        l <- l[ id] # subset with id <- 1:N parameter
        
        #        for ( i in id){
        for( i in seq_along( l)){
                my_df <- rbind( my_df, 
                                read.csv( sprintf( "./%s/%s", directory, l[ i]),
                                          stringsAsFactors = FALSE))
        }
        
        # calculate the mean without NAs
        mean( my_df[[ pollutant]], na.rm = TRUE)
}        

