
#' Wrap factor levels into nicely formatted paragraphs
#'
#' @param f A factor variable with long levels
#' @param ... Arguments passed on to `stringr::str_wrap()`
#'
#' @return A factor variable with re-wrapped levels
#' @export
#'
#' @examples
#' var <- factor(c("a very, very, very, very long factor level", "an even longer, unbelievably longer, factor level"))
#' fct_wrap(var, width = 10)

fct_wrap <- function(f, ...) {
  base::levels(f) <- stringr::str_wrap(base::levels(f), ...)
  f
}
