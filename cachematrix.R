## makeCacheMatrix creates a special "matrix", which is a list containing a function to
## set the value of the matrix
## get the value of the matrix
## set the inverse of the matrix
## get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
 
  m <- NULL
  
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() {
    x
  }
  setinverse <- function(inverse) {
    m <<- inverse
  }
  getinverse <- function() {
    m
  }
  
  list(set = set, 
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached matrix")
    return(m)
  }
  message("Inverting matrix")
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m
}
