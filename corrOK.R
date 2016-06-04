# complete return the number of full observation (no NAs) for each file

# directory should be a relative directory from current wd
# id as shown : an integer vector max the number of files
# return a dataframe 2 cols "id" "nobs"

corr <- function( directory, threshold = 0){
        
        id <- 1:332
        listDF<-list()
        listDF2<-list()
        listDF3<-list()
        idnobs<-vector()

        for (i in id) {
                BUFF <- read.csv( sprintf( "./%s/%03d.csv", directory, i), 
                                    stringsAsFactors = FALSE)
                BUFF$Date <- NULL
                BUFF <- BUFF [ ! apply( BUFF, 1, anyNA), ]
                if( ! nrow( BUFF) == 0) {
                        listDF[[ length( listDF) + 1]] <- data.frame( BUFF)
                }
        } 
        for( i in seq_along( listDF)){
                 if(! NROW( listDF[[ i]]) < threshold) { 
                         listDF2[[ length( listDF2)+1]] <- listDF[[ i]]}}

        for( i in seq_along( listDF2)){ 
                listDF3[ i] <- cor(x = listDF2[[ i]]$sulfate, y = listDF2[[ i]]$nitrate)
                }
        return( unlist( listDF3))
}
