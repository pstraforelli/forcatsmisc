#' Convert a factor variable with numeric levels to a numeric variable
#'
#' @param f A factor variable with numeric levels
#'
#' @return A numeric variable
#' @export
#'
#' @examples
#' var <- factor(c("1", "2", "3"))
#' fct_to_num(var)

fct_to_num <- function(f) {
  as.numeric(levels(f))[f]
}
