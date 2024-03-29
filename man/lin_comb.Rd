% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lin_comb.R
\name{lin_comb}
\alias{lin_comb}
\title{Perform a linear combination of posterior samples}
\usage{
lin_comb(lin_comb, obj, ci = 0.9, rope = NULL, contrast = NULL)
}
\arguments{
\item{lin_comb}{A string specifying a linear combination of variables, or a list of variable names if using \code{contrast}.}

\item{obj}{An object of class \code{BGGM}, \code{bbcor}, or a \code{data.frame} of posterior samples.}

\item{ci}{The level for which a credible interval should be computed.}

\item{rope}{Specify a ROPE. Optional.}

\item{contrast}{A contrast matrix specifying which combinations to test.}
}
\value{
An object of class \code{lin_comb}
}
\description{
Perform a linear combination of posterior samples
}
\examples{
# data
if (require(BGGM)) library(BGGM)
Y <- ptsd

# names
colnames(Y) <- letters[1:20]

# estimate model
est <- estimate(Y)

# test
bggm_comb <- lin_comb("a--c + a--d > b--c + b--d",
                       obj = est,
                       ci = 0.90,
                       rope = c(-0.1, 0.1))

# print
bggm_comb

# Using a contrast matrix to test pairwise differences
vars <- c("a--c", "a--d", "b--c")

contrast_mat <- matrix(c(1, -1, 0,
                         1, 0, -1,
                         0, 1, -1), nrow = 3, byrow = TRUE)

bggm_comb <- lin_comb(vars,
                      obj = est,
                      ci = 0.90,
                      contrast = contrast_mat)
# print
bggm_comb

}
