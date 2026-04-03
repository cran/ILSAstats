## ----include = FALSE----------------------------------------------------------
# knitr::opts_chunk$set(
#   collapse = TRUE,
#   comment = "#>"
# )

## ----echo=FALSE---------------------------------------------------------------
library(ILSAstats)

## -----------------------------------------------------------------------------
RW <- repcreate(df = repdata,
                wt = "wt",
                jkzone = "jkzones",
                jkrep = "jkrep",
                method = "LANA")

## -----------------------------------------------------------------------------
# No groups
STNG <- repsetup(repwt = RW, wt = "wt", df = repdata, method = "LANA")

# With groups
STGR <- repsetup(repwt = RW, wt = "wt", df = repdata, method = "LANA",
                 group = "GROUP")

# With groups and exclusions
STGE <- repsetup(repwt = RW, wt = "wt", df = repdata, method = "LANA",
                 group = "GROUP", exclude = "GR2")


## -----------------------------------------------------------------------------
# No groups
reprho(x = c("SES","item01"), setup = STNG)

# With groups
reprho(x = c("item01","SES","item01"), setup = STGR, rho = "pearson")

# With groups and exclusions
reprho(x = c("SES","item01"), setup = STGE, rho = "pearson")

## -----------------------------------------------------------------------------
# Pearson
reprho(x = c("item02","item01"), setup = STGR, rho = "pearson")

# Spearman
reprho(x = c("item02","item01"), setup = STGR, rho = "spearman")

# Polychoric
reprho(x = c("item02","item01"), setup = STGR, rho = "polychoric")

## -----------------------------------------------------------------------------
reprho(x = c("SES","item01","item02"), setup = STGR, rho = "pearson")

## -----------------------------------------------------------------------------
# One variable
reprho(x = c("SES"),
       pv = c(paste0("Math",1:5)),
       setup = STGR, rho = "pearson")

# More than one variable
reprho(x = c("SES","item01"),
       pv = c(paste0("Math",1:5)),
       setup = STGR, rho = "pearson")

## -----------------------------------------------------------------------------
reprho(pv = c(paste0("Math",1:5)),
       pv2 = c(paste0("Reading",1:5)),
       setup = STGR, rho = "pearson")

## -----------------------------------------------------------------------------
reprho(pv = c(paste0("Math",1:5)),
       pv2 = c(paste0("Reading",1:5)),
       relatedpvs = FALSE,
       setup = STGR, rho = "pearson")

## -----------------------------------------------------------------------------
# Default
reprho(pv = paste0("Math",1:5), 
       pv2 = c(paste0("Reading",1:5)), 
       setup = STGR, rho = "pearson")

# Only pooled
reprho(pv = paste0("Math",1:5), 
       pv2 = c(paste0("Reading",1:5)), 
       setup = STGR, rho = "pearson",
       aggregates = "pooled")

# Only composite
reprho(pv = paste0("Math",1:5), 
       pv2 = c(paste0("Reading",1:5)), 
       setup = STGR, rho = "pearson",
       aggregates = "composite")

# No aggregates
reprho(pv = paste0("Math",1:5), 
       pv2 = c(paste0("Reading",1:5)), 
       setup = STGR, rho = "pearson",
       aggregates = NULL)

