
# ExtendedLaplace

## ExtendedLaplace: Extended Laplace Distribution

The **ExtendedLaplace** R package provides functions for the probability density function (`dEL()`), cumulative distribution function (`pEL()`), quantile function (`qEL()`), random number generation (`rEL()`) and QQ-plot for the **Extended Laplace distribution**, developed to model contaminated Laplace data with additional uniform errors.

This distribution generalizes the classical Laplace distribution by convolving it with a uniform distribution, which allows for modeling error-prone data in a more robust way.

Developed by: 

> Saah, D. K., & Kozubowski, T. J. (2025).  
> *A new class of extended Laplace distributions with applications to modeling contaminated Laplace data*.  
> Journal of Computational and Applied Mathematics.  
> [https://doi.org/10.1016/j.cam.2025.116588](https://doi.org/10.1016/j.cam.2025.116588)


## Installation

You can install the development version from GitHub:

```r
# install.packages("devtools")
devtools::install_github("saahdavid/ExtendedLaplace")
```

Once submitted to CRAN, you can install it using:

```r
install.packages("ExtendedLaplace")
```

## Functions

* `dEL(y, mu, sigma, delta)`: Density function
* `pEL(y, mu, sigma, delta)`: Cumulative distribution function
* `qEL(u, mu, sigma, delta)`: Quantile function
* `rEL(n, mu, sigma, delta)`: Random number generation
* `qqplotEL(samples, mu, sigma, delta)`: Quantile-Quantile Plot

## Example

```r
library(ExtendedLaplace)

# PDF at y = 0
mu <- 0; sigma <- 1; delta <- 1
dEL(0, mu, sigma, delta)

# CDF at y = 0
pEL(0, mu, sigma, delta)

# Quantile at 0.5 (median)
qEL(0.5, mu, sigma, delta)

# Generate 1000 samples
set.seed(123)
samples <- rEL(1000, mu, sigma, delta)
hist(samples, breaks = 50, freq = FALSE)
curve(dEL(x, mu, sigma, delta), add = TRUE, col = "blue", lwd = 2)

# QQ-Plot 
qqplotEL(samples, mu, sigma, delta)
```

## Authors

David K. Saah
ORCID: 0009-0006-8049-3627
Email: [saahdavidkofi@gmail.com](mailto:saahdavidkofi@gmail.com)


Tomasz J. Kozubowski
Email: [tkozubow@unr.edu](mailto:tkozubow@unr.edu)


## License

MIT License (see LICENSE file)

