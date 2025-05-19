#' Quantile-Quantile Plot for the Extended Laplace Distribution
#'
#' @param sample_data A numeric vector of sample data
#' @param mu Location parameter
#' @param sigma Scale parameter (must be > 0)
#' @param delta Uniform noise parameter (must be > 0)
#'
#' @return A Q-Q plot comparing sample data to the theoretical Extended Laplace distribution
#' @importFrom stats quantile ppoints
#' @importFrom graphics abline
#' @export
#'
#' @examples
#' sample <- rEL(1000, mu = 0, sigma = 1, delta = 1)
#' qqplotEL(sample, mu = 0, sigma = 1, delta = 1)
qqplotEL <- function(sample_data, mu, sigma, delta) {
  stopifnot(is.numeric(sample_data), sigma > 0, delta > 0)

  n <- length(sample_data)
  sample_quantiles <- quantile(sample_data, probs = ppoints(n))
  theoretical_quantiles <- sapply(ppoints(n), function(p) qEL(p, mu, sigma, delta))

  plot(theoretical_quantiles, sample_quantiles,
       xlab = "Theoretical Quantiles",
       ylab = "Sample Quantiles",
       main = "Q-Q Plot: Extended Laplace",
       pch = 19)

  abline(0, 1, col = "red", lwd = 2)
}
