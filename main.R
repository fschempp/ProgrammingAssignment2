source("cachematrix.R")
mdat <- matrix(c(1,3,5,4,5,6,7,10,9), nrow = 3, ncol = 3, byrow = TRUE)
       
mdat
idat <- solve(mdat)
idat

mlist <- makeCacheMatrix(mdat)
inverse <- cacheSolve(mlist)
inverse

inverse2 <- cacheSolve(mlist)
inverse2