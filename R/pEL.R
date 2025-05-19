#' Cumulative Distribution Function of the Extended Laplace Distribution
#' @references Saah, D. K., & Kozubowski, T. J. (2025). A new class of extended Laplace distributions with applications to modeling contaminated Laplace data. Journal of Computational and Applied Mathematics. \doi{10.1016/j.cam.2025.116588}
#' @param y Vector of values where the density is to be evaluated
#' @param mu Location parameter
#' @param sigma Scale parameter (must be > 0)
#' @param delta Uniform noise parameter (must be > 0)
#'
#' @return Vector of distribution values
#' @export
pEL <- function(y, mu, sigma, delta) {
  stopifnot(sigma > 0, delta > 0)

  z <- (y - mu)
  out <- numeric(length(z))

  idx1 <- z < -delta
  out[idx1] <- (sigma / (4 * delta)) * (exp((z[idx1] + delta) / sigma) - exp((z[idx1] - delta) / sigma))

  idx2 <- (z >= -delta) & (z < delta)
  out[idx2] <- (1 / (4 * delta)) * (2 * (z[idx2] + delta) + sigma * exp(-(z[idx2] + delta) / sigma) - sigma * exp((z[idx2] - delta) / sigma))

  idx3 <- z >= delta
  out[idx3] <- (1 / (4 * delta)) * (4 * delta + sigma * exp(-(z[idx3] + delta) / sigma) - sigma * exp(-(z[idx3] - delta) / sigma))

  return(out)
}
