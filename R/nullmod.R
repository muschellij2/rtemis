# nullmod.R
# ::rtemis::
# Efstathios D Gennatas egenn.github.io

#' \pkg{rtemis} internal: predict for an object of class `nullmod`
#' 
#' @param object Object of class `nullmod`
#' @param newdata Unused
#' @param ... Unused
#' @method predict nullmod
#' @export

predict.nullmod <- function(object, newdata = NULL, ...) {
  
  object$fitted
  
} # rtemis::predict.nullmod
