#' Inverse Cumulative Distribution Function or Quantile Function of the Extended Laplace Distribution
#' @references Saah, D. K., & Kozubowski, T. J. (2025). A new class of extended Laplace distributions with applications to modeling contaminated Laplace data. Journal of Computational and Applied Mathematics. \doi{10.1016/j.cam.2025.116588}
#' @param u A numeric vector of probabilities.
#' @param mu Location parameter
#' @param sigma Scale parameter (must be > 0)
#' @param delta Uniform noise parameter (must be > 0)
#'
#' @return Vector of quantiles values
#' @importFrom stats uniroot
#' @export
qEL <- function(u, mu, sigma, delta) {
  stopifnot(all(u >= 0 & u <= 1), sigma > 0, delta > 0)
  tau <- delta / sigma

  z_fun <- function(u) {
    out <- numeric(length(u))

    thresh <- (1 - exp(-2 * tau)) / (4 * tau)

    # Region 1: u <= thresh
    idx1 <- u <= thresh
    out[idx1] <- log(4 * tau * u[idx1]) - log(exp(tau) - exp(-tau))

    # Region 2: u in middle -> use numerical root finding
    idx2 <- (u > thresh) & (u < 1 - thresh)
    for (i in which(idx2)) {
      target_u <- u[i]
      fz <- function(z) {
        (1 / (4 * tau)) * (2 * (z + tau) - exp(-tau) * (exp(z) - exp(-z))) - target_u
      }
      out[i] <- uniroot(fz, lower = -tau, upper = tau)$root
    }

    # Region 3: u >= 1 - thresh
    idx3 <- u >= 1 - thresh
    out[idx3] <- -log(4 * tau * (1 - u[idx3])) + log(exp(tau) - exp(-tau))

    return(mu + sigma * out)
  }

  if (sigma == 0) {
    return(mu + delta * (2 * u - 1))
  } else {
    return(z_fun(u))
  }
}
