#' Random Sample Generation of the Extended Laplace Distribution
#'
#' @description Generates random samples from the Extended Laplace distribution using the convolution representation: \eqn{Y = X + U}, where \eqn{X \sim \text{Laplace}(\mu, \sigma)} and \eqn{U \sim \text{Uniform}(-\delta, \delta)}.
#'
#' @references Saah, D. K., & Kozubowski, T. J. (2025). A new class of extended Laplace distributions with applications to modeling contaminated Laplace data. *Journal of Computational and Applied Mathematics*. \doi{10.1016/j.cam.2025.116588}
#'
#' @param n Integer. Sample size.
#' @param mu Numeric. Location parameter.
#' @param sigma Numeric. Scale parameter (must be > 0).
#' @param delta Numeric. Uniform noise parameter (must be > 0).
#'
#' @return A numeric vector of random samples from the Extended Laplace distribution.
#' @importFrom VGAM rlaplace
#' @importFrom stats runif
#' @export
#'
#' @examples
#' rEL(10, mu = 0, sigma = 1, delta = 0.5)
rEL <- function(n, mu, sigma, delta) {
  stopifnot(n > 0, sigma > 0, delta > 0)
  X <- rlaplace(n, location = mu, scale = sigma)
  U <- runif(n, -delta, delta)
  return(X + U)
}
