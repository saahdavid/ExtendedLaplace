#' Density function of the Extended Laplace Distribution
#' @references Saah, D. K., & Kozubowski, T. J. (2025). A new class of extended Laplace distributions with applications to modeling contaminated Laplace data. Journal of Computational and Applied Mathematics. \doi{10.1016/j.cam.2025.116588}
#' @param y Vector of values where the density is to be evaluated
#' @param mu Location parameter
#' @param sigma Scale parameter (must be > 0)
#' @param delta Uniform noise parameter (must be > 0)
#'
#' @return Vector of density values
#' @export
dEL <- function(y, mu, sigma, delta) {
  stopifnot(sigma > 0, delta > 0)

  z <- (y - mu)
  out <- numeric(length(z))

  # Region 1: y < mu - delta
  idx1 <- z < -delta
  out[idx1] <- (1 / (4 * delta)) * (exp((z[idx1] + delta) / sigma) - exp((z[idx1] - delta) / sigma))

  # Region 2: mu - delta ≤ y < mu + delta
  idx2 <- (z >= -delta) & (z < delta)
  out[idx2] <- (1 / (4 * delta)) * (2 - exp(-(z[idx2] + delta) / sigma) - exp((z[idx2] - delta) / sigma))

  # Region 3: y ≥ mu + delta
  idx3 <- z >= delta
  out[idx3] <- (1 / (4 * delta)) * (exp(-(z[idx3] - delta) / sigma) - exp(-(z[idx3] + delta) / sigma))

  return(out)
}

