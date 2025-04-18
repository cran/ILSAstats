% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/WeMixPV.R
\name{WeMixPV}
\alias{WeMixPV}
\title{Survey Weighted Mixed-Effects Models with Plausible Values}
\usage{
WeMixPV(formula, data = NULL, weights = NULL, pvs, relatedpvs = TRUE, ...)
}
\arguments{
\item{formula}{a formula object in the style of \code{lme4} that creates the model.}

\item{data}{a data frame containing the raw data for the model.}

\item{weights}{a character vector of names of weight variables found in the data frame starts with units (level 1) and increasing (larger groups).}

\item{pvs}{a list indicating which variables from \code{formula}
should be replaced by which plausible values variables. For more details
check the examples.}

\item{relatedpvs}{a logical value indicating if \code{pvs} are drawn
from the same model, and have the same number of plausible values.
If \code{TRUE} (default), a total of \eqn{n} estimations will be done,
where \eqn{n} is the number of plausible values for each plausible value variable.
If \code{FALSE}, a total of \eqn{n_1 \times n_2 \times n_...}
estimations will be done, where \eqn{n_i} is the number of plausible values
in each plausible value variable.}

\item{...}{
  Arguments passed on to \code{\link[WeMix:mix]{WeMix::mix}}
  \describe{
    \item{\code{cWeights}}{logical, set to \code{TRUE} to use conditional weights. Otherwise, \code{mix} expects unconditional weights.}
    \item{\code{center_group}}{a list where the name of each element is the name of the aggregation level, and the element is a formula of
variable names to be group mean centered; for example to group mean center gender and age within the group student:
 \code{list("student"= ~gender+age)}, default value of NULL does not perform any group mean centering.}
    \item{\code{center_grand}}{a formula of variable names  to be grand mean centered, for example to center the variable education by overall mean of 
education: \code{~education}. Default is NULL which does no centering.}
    \item{\code{max_iteration}}{a optional integer, for non-linear models fit by adaptive quadrature which limits number of iterations allowed
before quitting. Defaults  to 10. This is used because if the likelihood surface is flat, 
models may run for a very  long time without converging.}
    \item{\code{nQuad}}{an optional integer  number of quadrature points to evaluate models solved by adaptive quadrature.
Only non-linear models are evaluated with adaptive quadrature. See notes for additional guidelines.}
    \item{\code{run}}{logical; \code{TRUE} runs the model while \code{FALSE} provides partial output for debugging or testing. Only applies to non-linear
models evaluated by adaptive quadrature.}
    \item{\code{verbose}}{logical, default \code{FALSE}; set to \code{TRUE} to print results of intermediate steps of adaptive quadrature. Only applies to non-linear models.}
    \item{\code{acc0}}{deprecated; ignored.}
    \item{\code{keepAdapting}}{logical, set to \code{TRUE} when the adaptive quadrature should adapt after every Newton step. Defaults to \code{FALSE}. 
\code{FALSE} should be used for faster (but less accurate) results. Only applies to non-linear models.}
    \item{\code{start}}{optional numeric vector representing the point at which the model should start optimization; takes the shape of c(coef, vars) 
from results (see help).}
    \item{\code{fast}}{logical; deprecated}
    \item{\code{family}}{the family; optionally used to specify generalized linear mixed models. Currently only \code{binomial()} 
and \code{poisson()} are supported.}
  }}
}
\value{
a list.
}
\description{
Fits a linear mixed-effects model using \link[WeMix]{mix} and plausible values.
}
\examples{
# Prepare data weights
repdata2 <- repdata
repdata2$wt1 <- repdata2$wt # weight level 1
repdata2$wt2 <- 1 # weight level 2


# Null model - with PVs
## Named list, with element names matching formula variables
pvs = list(MATH = paste0("Math",1:5))


m1 <- WeMixPV(formula = MATH ~ 1 + (1|GROUP), # Intercept varies across GROUP
             pvs = pvs, # Named list
             data = repdata2, # Data frame
             weights = c("wt1","wt2")) # Weights vector
m1

## Fixed effects
m1$fixef

## Random effects
m1$ranef

## Models for each PV
summary(m1$models)

# Multiple regression
## Named list, with element names matching formula variables
pvs = list(MATH = paste0("Math",1:5))


m2 <- WeMixPV(formula = MATH ~ 1 + GENDER + SES + schoolSES + (1|GROUP),
             pvs = pvs, # Named list
             data = repdata2, # Data frame
             weights = c("wt1","wt2")) # Weights vector
m2




}
