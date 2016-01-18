# QLearning.r
#
# 

## -Functions

#
#  Max(Q[next state, all actions])
#

Max <- function(x) {

  allactions <- which(x>=0,arr.ind=TRUE)

  rt <- 0

  for(i in 1:length(allactions)) {

    if( x[i] > 0 ) rt <- x[i]

  }

  return( rt )

}

#
# Convert the elements of matrix into percentage by dividing
# the non-zero elements by the largest elememt.
#

percent <- function(x) { round( (x  / max(Q)) * 100 ) }

#
#  Get R matrix from spreadsheet
#

getRewardMatrix <- function() {
  
     file.csv <- file.choose()      # Select file
     
     read.file <- read.csv(file.csv,
                       stringsAsFactors = FALSE,
                       header = FALSE)
     
     # Tidy up data frame
     
     read.file <- read.file[-c(1,2),]   # Remove rows
     
     read.file <- read.file[,-c(1)]     # Remove column
     
     # Convert to a matrix
     
     m <- matrix(as.numeric(unlist(read.file)), nrow=nrow(read.file))
     
     return(m)
  
}

# Get Reward Matrix from CSV file

R <- getRewardMatrix()

## - Initialse matrices and variables

# Initialise the Q matrix ( the brain )

Q <- matrix(rep(0,length(R)), nrow = nrow(R), ncol = ncol(R))

Gamma <- 0.8      # Set the Gamma factor ( between 0 to 1 )

oldQ <- Q         # Used to calculate the error

error <- c()      # Initialise the error vector

# Set random seed

set.seed(1234)

## - Compute the Q Matrix

# Repeat for each episode

for( episode in 1:100) { # Could use a 'while' instead of 'for'   

  print(paste("Episode: ", episode, sep=""))

# Select at random a current state

  state <- sample(nrow(R), 1, replace = TRUE)

# Repeat while state is not equal to the goal

  while(TRUE) {

    action <- which(R[state,] >= 0, arr.ind = TRUE)

    if( length(action) !=1) { # Number of actions available
        action <- sample(action, 1, replace=TRUE) }

# Update the entry in the Q matrix

   Q[state, action] <- R[state, action] +
                       Gamma * Max(Q[action,])

   # Check if goal has been reached

   if( state == action) break

   state <- action   # Changed position

  }

# Update error matrix  
  
  error[episode] <- sum(abs(oldQ - Q))

  oldQ <- Q

}

finalQ <- percent(Q)

## - Analyse the results of the Q-Learning algorithm

# Plot the error

plot(error, type="l")


