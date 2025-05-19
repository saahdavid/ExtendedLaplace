#' Random Sample Generation of the Extended Laplace Distribution
#' @references Saah, D. K., & Kozubowski, T. J. (2025). A new class of extended Laplace distributions with applications to modeling contaminated Laplace data. Journal of Computational and Applied Mathematics. \doi{10.1016/j.cam.2025.116588}
#' @param n Sample size
#' @param mu Location parameter
#' @param sigma Scale parameter (must be > 0)
#' @param delta Uniform noise parameter (must be > 0)
#'
#' @return Vector of sample values
#' @importFrom stats runif
#' @export
rEL <- function(n, mu, sigma, delta) {
  u <- runif(n)
  qEL(u, mu, sigma, delta)
}
