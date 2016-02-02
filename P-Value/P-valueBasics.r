# P-valueBasics.r
#
# Using R to create a null distribution for a fair coin
# and calculate a p value for an event
#

# Use a function to generate the coin flips

# 0 = Tails and 1 = Heads

FlipCoin <- function(n) sample(0:1,n,rep=T)

heads <- FlipCoin(20) # to start calculation

# Flip the 20 coins 10000 times

for(i in 1:10000) heads[i] <- sum(FlipCoin(20)==1)

hist(heads, main="Number of heads out of 20 tosses")

histinfo <- hist(heads)

print(histinfo)

# Use the Binomial Distribution to work out the probability of
# getting 16 heads out of 20 flips of a fair coin

binomial <- dbinom(16, size=20, prob=0.5) + dbinom(17, size=20, prob=0.5) + dbinom(18, size=20, prob=0.5) + dbinom(19, size=20, prob=0.5) + dbinom(20, size=20, prob=0.5)

print(binomial)
