


descript.database <- function(data)
{
  resum.table <- data.frame(matrix(nc=5,nrow=ncol(data)))
  names(resum.table) <- c("Variable","Class","Nombre_Elements","Nombre_NA","Description")
  data.df <- as.data.frame(data)
  
  for (i in 1:ncol(data))
  {
    
    resum.table[i,1] <- names(data)[i]
    resum.table[i,2] <- class(data.df[,i])[1]
    resum.table[i,3] <- dim(unique(na.omit(data[,i])))[1]  
    resum.table[i,4] <- length(which(is.na(data[,i])))
    
    if(as.numeric(resum.table[i,3])<=10)
    {
      numberElement.occur <- table(data[,i])
      resum.table[i,5] <- str_c(names(numberElement.occur)," : ",numberElement.occur,collapse=" - ")
      
    }  else
    {
      resum.table[i,5] <- as.character((unique(na.omit(as.data.frame(data[,i])))[1,1]))
    }
    
  }
  return(as_tibble(resum.table))
}


