all_ancestors <- function(obj) {
  i <- ancestor_iterator(obj)
  i$get_next() # Skip self
  
  ancestors <- list()
  while(i$has_next()) {
    ancestors <- c(ancestors, list(i$get_next()))
  }
  ancestors
}

assert_ancestors_are <- function(obj, ancestors) {
  stopifnot(identical(all_ancestors(obj), ancestors))
}

assert_identical <- function(a, b) {
  stopifnot(identical(a, b))
}
expect_error <- function(x) {
  res <- try(force(x), TRUE)
  stopifnot(inherits(res, "try-error"))
}

assert <- function(x) {
  stopifnot(identical(x, TRUE))
}