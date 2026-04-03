## ----include = FALSE----------------------------------------------------------
# knitr::opts_chunk$set(
#   collapse = TRUE,
#   comment = "#>"
# )

## ----echo=FALSE---------------------------------------------------------------
library(ILSAstats)

## -----------------------------------------------------------------------------
autoILSA()

## -----------------------------------------------------------------------------
# Only math
leaguetable(df = timss99, study = "TIMSS", year = 1999, subject = "math")

# Only math
leaguetable(df = timss99, study = "TIMSS", year = 1999, subject = "science")

# Both subjects
leaguetable(df = timss99, study = "TIMSS", year = 1999)


## -----------------------------------------------------------------------------
leaguetable(df = timss99, study = "TIMSS", year = 1999, method = "TIMSS")

## -----------------------------------------------------------------------------
leaguetable(df = timss99, study = "TIMSS", year = 1999)|>
  repmeandif()

