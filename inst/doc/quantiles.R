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
repquant(x = "SES", setup = STNG, qtl = c(.25, .50, .75))

# With groups
repquant(x = "SES", setup = STGR, qtl = c(.25, .50, .75))

# With groups and exclusions
repquant(x = "SES", setup = STGE, qtl = c(.25, .50, .75))

## -----------------------------------------------------------------------------
# No groups
repquant(x = paste0("Math",1:5), setup = STNG, qtl = c(.25, .50, .75))

# With groups
repquant(x = paste0("Math",1:5), setup = STGR, qtl = c(.25, .50, .75))

