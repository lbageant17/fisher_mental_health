## Liz Bageant
## Master file for fisher mental health project


## PACKAGES
#install.packages("tidyverse")
#install.packages("skimr")
#install.packages("ggpubr")
library(ggpubr) 
library(tidyverse) 
library(skimr)
library(tidyr)
library(infer)



## FILE PATHS

projectFolder  <- "~/github/fisher_mental_health"
data <- file.path(projectFolder, "data/csv")


## Related scripts, in order

# data_prep.Rmd
# explore_demographics
# explore_access
# explore_mh