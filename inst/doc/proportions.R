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
repprop(x = "GENDER", setup = STNG)

# With groups
repprop(x = "GENDER", setup = STGR)

# With groups and exclusions
repprop(x = "GENDER", setup = STGE)

## -----------------------------------------------------------------------------
p1 <- repprop(x = "GENDER", setup = STGR)

repprop.table(x = p1)

## -----------------------------------------------------------------------------
# Groups by rows, separate SE
repprop.table(x = p1, type = "wide1")

# Groups by rows, non-separate SE
repprop.table(x = p1, type = "wide1", separateSE = FALSE)

# Groups by columns, separate SE
repprop.table(x = p1, type = "wide2")

# Groups by columns, non-separate SE
repprop.table(x = p1, type = "wide2", separateSE = FALSE)



## -----------------------------------------------------------------------------
# No groups
repprop(x = paste0("CatMath",1:5), setup = STNG)|>
repprop.table(type = "wide2")

# With groups
repprop(x = paste0("CatMath",1:5), setup = STGR)|>
repprop.table(type = "wide2")

## -----------------------------------------------------------------------------
# Default
repprop(x = paste0("CatMath",1:5), setup = STGR)|>
repprop.table(type = "wide2",separateSE = FALSE)

# Only pooled
repprop(x = paste0("CatMath",1:5), setup = STGR, aggregates = "pooled")|>
repprop.table(type = "wide2",separateSE = FALSE)

# Only composite
repprop(x = paste0("CatMath",1:5), setup = STGR, aggregates = "composite")|>
repprop.table(type = "wide2",separateSE = FALSE)

# No aggregates
repprop(x = paste0("CatMath",1:5), setup = STGR, aggregates = NULL)|>
repprop.table(type = "wide2",separateSE = FALSE)

