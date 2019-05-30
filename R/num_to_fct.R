#' Convert a numeric variable to a factor variable
#'
#' @description
#' Converting a numeric variable to a factor variable is perilous because the underlying values will be re-numbered. This function will ensure the conversion without surprising results.
#'
#' @param vec A numeric vector
#' @param levs Optionally, a character vector of the levels to apply to the factor variable
#'
#' @return A factor variable
#' @export
#'
#' @seealso
#' `fct_to_num()`
#'
#' @examples
#' num_vec <- c(59, 12, 54, 45, 2, 32, 3, 46, 54, 9, 39, 7, 49, 12)
#' num_levs <- c("2nd", "3rd", "7th", "9th", "12th", "32nd", "39th", "45th", "46th", "49th", "54th", "59th")
#' num_to_fct(num_vec)
#' num_to_fct(num_vec, num_levs)

num_to_fct <- function(vec, levs = NULL) {

  vec_fct <- base::as.factor(base::as.character(vec))
  vec_fct <- forcats::fct_relevel(vec_fct, base::as.character(base::sort(base::as.numeric(base::levels(vec_fct)))))

  if (!is.null(levs)) {
    base::levels(vec_fct) <- levs
  }

  vec_fct
}
