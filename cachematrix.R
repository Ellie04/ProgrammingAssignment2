## Together, these functions cache the inverse of a matrix. 
## Therefore, rather than computing the inverse of a matrix mutliple times, you can use the cached inverse to save time
## This first function creates a special "matrix" object that can cache its inverse. It sets the value of the matrix, gets the value of the matrix, sets the value of the inverse, and get the value of the inverse
makeCacheMatrix <- function(x = matrix()) {
m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(source) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## this calculates the inverse of a special "matrix" created with the above function. It first checks to see if the inverse has already been calculated. If it has, it gets the inverse from the cache and skips computation

cacheSolve <- function(x, ...) {
  m <- x$getinverse
  if(!is.null(m)) {
    message("getting cached data")
    return(m)  
  }
  data <- x$get()
  m <- source(data, ...)
  x$setinverse(m)
  m       
}
