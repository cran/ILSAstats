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
repmean(x = "SES", setup = STNG)

# With groups
repmean(x = "SES", setup = STGR)

# With groups and exclusions
repmean(x = "SES", setup = STGE)

## -----------------------------------------------------------------------------
# No groups
repmean(x = c("SES","Math1"), setup = STNG)

# With groups
repmean(x = c("SES","Math1"), setup = STGR)

## -----------------------------------------------------------------------------
# No groups
repmean(x = paste0("Math",1:5), PV = TRUE, setup = STNG)

# With groups
repmean(x = paste0("Math",1:5), PV = TRUE, setup = STGR)

## -----------------------------------------------------------------------------
# Default
repmean(x = paste0("Math",1:5), PV = TRUE, setup = STGR)

# Only pooled
repmean(x = paste0("Math",1:5), PV = TRUE, setup = STGR, aggregates = "pooled")

# Only composite
repmean(x = paste0("Math",1:5), PV = TRUE, setup = STGR, aggregates = "composite")

# No aggregates
repmean(x = paste0("Math",1:5), PV = TRUE, setup = STGR, aggregates = NULL)

## -----------------------------------------------------------------------------
repmean(x = paste0("Math",1:5), PV = TRUE, setup = STNG,by = "GENDER")

## -----------------------------------------------------------------------------
repmean(x = paste0("Math",1:5), PV = TRUE, setup = STGR, aggregates = NULL,
        by = "GENDER")

## -----------------------------------------------------------------------------
m1 <- repmean(x = paste0("Math",1:5), PV = TRUE, setup = STGR, aggregates = NULL,
        by = NULL)

m2 <- repmean(x = paste0("Math",1:5), PV = TRUE, setup = STGR, aggregates = NULL,
        by = "GENDER")



## -----------------------------------------------------------------------------
repmeandif(m1)

repmeandif(m2)

## -----------------------------------------------------------------------------
repmeanCI(m1, alpha = 0.05)

repmeanCI(m2, alpha = 0.05)

## -----------------------------------------------------------------------------
repmeanCI(m1, alpha = 0.05, add = FALSE)

