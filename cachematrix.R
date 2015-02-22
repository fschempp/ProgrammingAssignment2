## makeCacheMatrix This function creates a special "matrix" object that can cache its inverse.
## input is a square invertable matrix
## makeCacheMatrix returns a list containing four functions to:
## set the value of the original matrix
## get the value of the original matrix
## set the inverse of the matrix
## get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  ## x is the original matrix
  ## i is used to store the inverse of matrix x 
  i <- NULL
  ## set the the original matrix and it's inverse to NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  ## return the original matrix
  get <- function() {
    x
  }
  ## set i to the inverse of the matrix
  setinverse <- function(inverse) {
    i <<- inverse
  }
  ## get the inverted matrix
  getinverse <- function() {
    i
  }
  ## return the list of four functions
  list(set = set, 
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## cachSolve This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve will 
## retrieve the inverse from the cache.
## input is a list of four functions returned from makeCacheMatrix()
## output returns a matrix that is the inverse of 'x'
cacheSolve <- function(x) {
  m <- x$getinverse()
  ## If the inverse matrix exists return it
  if(!is.null(m)) {
    message("Getting cached matrix")
    return(m)
  }
  ## else get the original matrix, calculculate the inverse, store it and return the inverted matrix
  message("Inverting matrix")
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m
}
