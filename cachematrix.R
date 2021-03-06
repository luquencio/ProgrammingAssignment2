## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

  inverse <- NULL
  
  set <- function(y){
    x <<- y
    inverse <<- NULL
  }
  
  get <- function() {
    x
  }
  
  setInverse <- function(inv){
    inverse <<- inv
  }
  
  getInverse <- function() {
    inverse
  }
  
  list(set =set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  inverse <- x$getInverse()
  
  if (!is.null(inverse)) {
    message("getting chached data")
    return(inverse)
  }
  
  data <- x$get()
  inverse <- solve(data, ...)
  x$setInverse(inverse)
  inverse
  
}

matrixTest <- function(){
  
  newMatrix <- makeCacheMatrix(matrix(1:4, 2, 2))
  newMatrix$get()
  newMatrix$getInverse()
  cacheSolve(newMatrix)
  
  newMatrix <- makeCacheMatrix(matrix(4:8, 2, 2))
  newMatrix$get()
  newMatrix$getInverse()
  cacheSolve(newMatrix)
}
