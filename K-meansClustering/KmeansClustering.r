# KmeansClustering.r
#
# Simple description of K means clustering algorithm
#

## Functions

# Distance function - Euclidean

euclidean <- function(x,y) { 
  return ( sqrt( (x[1] - y[1] )^2
                 + (x[2] - y[2])^2))}

# Objective function - J ( minimise the the sum of squares )

J <- function( data, centroids, groups) {
  
  sum <- 0
  
  for ( j in 1:nrow(centroids)) {
    
    index <- which(groups[,j]==1)
    
    for( n in 1:length(index)) {
      
      sum <- sum + euclidean(data[index[n],], centroids[j,])
      
    }
    
  }
  
  return( sum )
  
}

# kmean function - simple algorithim to demonstrate
# the principles

mykmeans <- function( df, k ) { # data is assumed to be in a 
  # data frame
  
  # Convert data frame to matrix - using ".m" to remind 
  # that working with matrices throughout.
  
  df.m <- matrix(as.numeric(unlist(df)), nrow=nrow(df))   
  
  # Initialise matrices
  
  centroids.m <- matrix(0, nrow=k, ncol=ncol(df.m))
  
  groups.m  <-  matrix(0, nrow=nrow(df.m), ncol=k)
  
  dist.m <- matrix(0, nrow=nrow(df.m), ncol=k )
  
  # Initialise Error function and iteration
  
  error <- c()
  
  iter <- 1
  
  # Randomly select k points as initial cluster centers
  
  index <- sample(1:nrow(df.m), k, replace = FALSE)
  
  centroids.m <- df.m[index,]
  
  # Set oldcentroids.m which will be used to check convergence
  
  oldcentroids.m <- centroids.m
  
  # Start iteration
  
  while(TRUE) {
    
    # Calculate the distance between data and centroids
    
    for( i in 1:k) {
      
      dist.m[,i] <- apply(df.m, 1, FUN=function(x) euclidean(x,centroids.m[i,])) 
      
    }
    
    # Allocate observations depending on the minimim 
    # distance to the appropriate cluster - similar to argmin()
    
    for ( i in 1:nrow(df.m)) {
      
      # Note assuming that there is a unique minimum
      
      index <- which(dist.m[i,]==min(dist.m[i,]))
      
      groups.m[i,index] <- 1
      groups.m[i,-index] <- 0
      
    }
    
    # Calculate the new centroid position based on means
    
    for ( i in 1:k) {
      
      k.sum <- sum(groups.m[,i])
      
      index <- which(groups.m[,i]==1)
      
      for ( j in 1:k ) {
        
        centroids.m[i,j] <- ( 1/k.sum ) * sum(df.m[index,j]) 
        
      }
      
    }
    
    error[iter] <- J(df.m, centroids.m, groups.m)
    
    iter <- iter + 1
    
    # Check for convergence
    
    if(sum(abs(oldcentroids.m - centroids.m))==0) break  
    
    oldcentroids.m <- centroids.m 
    
    # Safety check - doesn't loop indefinately
    
    if ( iter > 100) break
    
  } # End of While loop  
  
  # Convert results back to information in the data frame
  
  rownames(groups.m) <- rownames(df)
  
  colnames(centroids.m) <- colnames(df)
  
  # Return results in a list
  
  return (list(groups.m,centroids.m, error,iter))
  
}

## Data

# Medicines Data

weight <- c(1,2,4,5)
pH <- c(1,1,3,4)

med.data <- data.frame(Weight=weight, pHIndex=pH )

rownames(med.data) <- c("A","B","C","D")

# Scores on individuals

A <- c(1.0,1.5,3.0,5.0,3.5,4.5,3.5)

B <- c(1.0,2.0,4.0,7.0,5.0,5.0,4.5)

score.data <- data.frame(A=A, B=B)

## Uisng the functions with the data

myfit <- mykmeans(med.data, 2)

# Using R's function - kmeans

fit <- kmeans(med.data, 2 )    # Gets answer shown in the OHDs