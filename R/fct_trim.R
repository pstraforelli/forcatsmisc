
#' Trim whitespace from factor levels
#'
#' @param f A factor variable with whitespace
#' @param ... Arguments passed on to `stringr::str_trim()`
#'
#' @return A factor variable with whitespace removed
#' @importFrom stringr str_trim
#' @export
#'
#' @examples
#' var <- factor(c("  Level with trailing and leading white space\t",
#' "\n\nLevel with trailing and leading white space\n\n"))
#' fct_trim(var)

fct_trim <- function(f, ...) {
  levels(f) <- str_trim(levels(f), ...)
  f
}
