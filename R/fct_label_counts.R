#' Recode a factor level to include sample size
#'
#' @param f A factor variable
#'
#' @return A factor variable with the counts included in the levels
#' @importFrom forcats fct_count
#' @export
#'
#' @examples
#' f <- fct_label_counts(iris$Species)
#' levels(f)
#' # "setosa (n=50)" "versicolor (n=50)" "virginica (n=50)"

fct_label_counts <- function(f) {
  counts <- fct_count(f)
  levels(f) <- paste0(counts$f, " (n=", prettyNum(counts$n, big.mark = ","), ")")
  f
}
