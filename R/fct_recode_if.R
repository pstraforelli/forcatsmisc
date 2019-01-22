#' Recode a factor level on a condition
#'
#' @param f A factor variable
#' @param cond A predicate to determine when the level should be recoded
#' @param level The level created based on the condition
#'
#' @return A factor variable with the new level added in
#' @export
#'
#' @examples
#' df <- data.frame(x = factor(c("apple", "bear", "banana", "dear")),
#'                  y = factor(c("fruit", "animal", "fruit", "animal")))
#'
#' dplyr::mutate(df, x = fct_recode_if(x, y == "animal", "not a fruit"))

fct_recode_if <- function(f, cond, level) {
  f <- forcats::fct_expand(f, level)
  f[cond] <- level
  f <- forcats::fct_drop(f)
  f
}
