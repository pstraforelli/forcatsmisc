#' Return a sub-range of levels
#'
#' @param f A factor variable
#' @param lvls A vector of 2 levels that you want the levels in between returned
#'
#' @return A vector of the factor variable's levels located in between the levels specified, inclusive.
#' @export
#'
#' @examples
#' var <- factor(c("Very likely", "Somewhat likely", "Somewhat unlikely", "Very unlikely"),
#'              levels = c("Very likely", "Somewhat likely", "Somewhat unlikely", "Very unlikely"))
#' lvl_range(var, c("Very likely", "Somewhat unlikely"))

lvl_range <- function(f, lvls) {
  base::levels(f)[base::which(base::levels(f) == lvls[1]):base::which(base::levels(f) == lvls[2])]
}
