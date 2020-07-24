#' LCensMeans: Replaces left censored data with estimate of expected value.
#'
#' The LCensMeans package provides functions to replace left censored data with
#' estimated values based on fitting a censored lognormal distribution to the
#' data using maximum likelihood.
#'
#' The goal of this package is to offer a simple interface to replace
#' non-detects with a maximum likelihood-derived estimator of the mean of
#' unobserved (censored) observations.
#'
#' The idea is to fit a maximum likelihood distribution to the data assuming we
#' are looking at a censored lognormal distribution.
#'
#' With a lognormal density in hand, we can estimate a conditional mean of
#' "unobserved" observations below a detection or reporting limit by sampling
#' from the implied lognormal distribution and calculating an estimated mean for
#' values that were censored.
#'
#' #' See the R notebook "Conditional Means of Censored Distributions" in the
#' PortlandHarborToxics Git Repository for additional description of the
#' rationale for the functions. The package can handle different levels of
#' censoring for different observations.
#'
#' @section Data Convention:
#' Data should be organized as a numeric vector and a logical vector.  The
#' contents of the numerical vector include both the observed value (when values
#' are above detection limits) and the specific detection limit (when
#' observations are censored).  The logical vector indicates which observations
#' are censored (TRUE) and therefore contain detection limits
#'
#' @section LCensMeans functions:
#' \code{left_censored_loglik()} provides a likelihood function for a
#' left-censored lognormal distribution. The parameters consist of a vector of
#' concentrations and a vector of flags indicating which observations were
#' censored, and therefore represent the applicable detection limit.
#'
#' \code{simulate_mean_censored()} estimates the conditional mean for a truncated
#' lognormal distribution, given parameters of the lognormal distribution
#' and a cutoff value (here, the detection limit). The third function
#' vectorizes the second, allowing us to pass a vector of detection ' limits,
#' rather than calculating this for each sample.
#'
#' \code{sub_conditional_means()} manages the process of combining the other
#' functions to generate a "corrected" vector of estimated concentrations, where
#' censored values are replaced by conditional means.
#'
#'@docType package
#'@name LCensMeans
NULL
#> NULL