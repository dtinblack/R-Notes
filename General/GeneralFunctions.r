# GeneralFunctions.r
#
# Learning about R through writing own functions

# Factorial using recursion

factorial <- function(x) { 
   if(x==1) return(1)
        else return(x*factorial(x-1)) }







