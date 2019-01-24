#' Return the numeric position of a level in a factor variable
#'
#' @param f A factor variable
#' @param lvl The level for which the underlying value is returned
#'
#' @return The numeric position of the level
#' @export
#'
#' @examples
#'
#' lvl_number(iris$Species, "versicolor")

lvl_number <- function(f, lvl) {
  base::unique(base::as.numeric(f)[base::which(f == lvl)])
}
