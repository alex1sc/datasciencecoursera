# works great but the rbind
# can't find how to do without if (for now)

########################################################################
# and rbind really slow

########################################################################
# complete return the number of full observation (no NAs) for each file

########################################################################
# directory should be a relative directory from current wd
# id as shown : an integer vector max the number of files
# return a dataframe 2 cols "id" "nobs"

complete <- function( directory, id= 1:332){
       
        listDF <- list()
        for (i in id) {
                BUFF <- read.csv( sprintf( "./%s/%03d.csv", directory, i), 
                                  stringsAsFactors = FALSE)
                BUFF$Date <- NULL
                BUFF <- BUFF [ ! apply( BUFF, 1, anyNA), ]
                listDF[[ length( listDF) + 1]] <- BUFF

        }       

        idnobs<-NULL
        for (i in seq_along( listDF)) {
                idnobs <- rbind( idnobs, c( i, nrow( listDF[[ i]])))
        }
        idnobs <- as.data.frame( idnobs)        
        names( idnobs) <- c( "id", "nobs")
        return( idnobs)
}    
