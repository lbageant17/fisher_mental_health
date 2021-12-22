CONTENTS OF THIS FILE HAVE BEEN MOVED TO Initial.Rmd


## Liz Bageant
## 2021-12-21

## First explorations of fisher MH data
#install.packages("tidyverse")
#install.packages("skimr")
library(tidyverse) 
library(skimr)


#--------------#
# Folder paths #
#--------------#

projectFolder  <- "~/github/fisher_mental_health"
data <- file.path(projectFolder, "data/csv")

## Bring in fish access file
access <- read.csv(file.path(data, "tbl_I_FisheryAccess.csv"), na.strings=c("", "NA"))

## Bring in morbidity file

morbidity <- read.csv(file.path(data, "tbl_L_Morbidity.csv"))

#-------------------------------------------------------------#
# Explore fishing access
#-------------------------------------------------------------#

# There is a skip pattern in the questionnaire. 
# "Access Limitations" questions differ slightly between fisher and non-fishers 
# depending on whether they answer yes or no to I1: "Have you fished or hired 
# labor to fish in the last 3 months". If "no", answer questions in I2. If yes, 
# answer questions in I3. 

# Create a dataset for fishing behavior and motivation for those who did not fish in the past 3 months
fishing_behavior_nf <- access %>% 
  mutate(fished_or_hired_3months = as.numeric(I1_FishedOrHiredLaborLastThreeMosYN),
         fished_hiredever = as.numeric(I21_HireLabor),
         fished_leasedever = as.numeric(I21_GoFishingUnderLease),
         fished_selfever = as.numeric(I21_GoFishingSelfEmployed),
         fished_forpayever = as.numeric(I21_WorkAsHiredLabor),
         last_fished = as.character(I22_LastTimeFished), 
         reason_stopped_fishing = as.character(I231_ReasonsStoppedFishing), 
         reason_stopped_fishing = as.character(I232_MostImportantReasonStoppedFishing),
         stop_decision_money = as.numeric(I241_MoneyReceivedYN),
         stop_decision_money_why = as.character(I241_MoneyReceivedHow), 
         stop_decision_time = as.numeric(I242_TimeSpentFishingYN),
         stop_decision_time_why = as.character(I242_TimeSpentFishingHow),
         stop_decision_difficulty = as.numeric(I243_DifficultyFishingYN), 
         stop_decision_difficulty_why = as.character(I243_DifficultyFishingHow), 
         stop_decision_regulation = as.numeric(I244_RegulationsYN),
         stop_decison_regulation_why = as.character(I244_RegulationsHow), 
         stop_decision_enviro = as.numeric(I245_EnvironChangesYN), 
         stop_decision_enviro_why = as.character(I245_EnvironChangesHow)) %>% 
  select(TimePoint, ParticipantID, fished_or_hired_3months, fished_hiredever, 
         fished_selfever, fished_forpayever, fished_forpayever, last_fished, 
         reason_stopped_fishing, stop_decision_money, stop_decision_money_why, 
         stop_decision_difficulty, stop_decision_difficulty_why, 
         stop_decision_regulation, stop_decison_regulation_why, stop_decision_enviro, 
         stop_decision_enviro_why)

# The above data frame should contain information for only those that answered "Yes" 
# though there are some 0s that should be missing.

colSums(!is.na(fishing_behavior_nf))
colSums(is.na(fishing_behavior_nf))

# TimePoint                ParticipantID      fished_or_hired_3months             fished_hiredever 
# 0                            0                            0                            0 
# fished_selfever            fished_forpayever                  last_fished       reason_stopped_fishing 
# 0                            0                          884                          885 
# stop_decision_money      stop_decision_money_why     stop_decision_difficulty stop_decision_difficulty_why 
# 0                         1139                            0                         1250 
# stop_decision_regulation  stop_decison_regulation_why         stop_decision_enviro     stop_decision_enviro_why 
# 0                         1306                            0                         1286 

# fished_hiredever, fished_selfever, fished_forpayever should be NA where fished_or_hired3months == 1


fishing_behavior_f <- access %>% 
  mutate(fished_or_hired_3months = as.numeric(I1_FishedOrHiredLaborLastThreeMosYN), 
         fished_hiredever = as.numeric(I31_HireLabor),
         fished_leasedever = as.numeric(I31_GoFishingUnderLease),
         fished_selfever = as.numeric(I31_GoFishingSelfEmployed),
         fished_forpayever = as.numeric(I31_WorkAsHiredLabor))














accessclean <- access %>% 
  mutate(fished_or_hired = as.numeric(I1_FishedOrHiredLaborLastThreeMosYN))

head(accessclean$fished_or_hired)

accessclean <- access %>% 
  mutate(fished_or_hired = as.numeric(I1_FishedOrHiredLaborLastThreeMosYN),
         fished_hired = as.numeric(I21_HireLabor),
         fished_leased = as.numeric(I21_GoFishingUnderLease),
         fished_self = as.numeric(I21_GoFishingSelfEmployed))








# Have you fished, or hired labor to fish, in the last three months? 

time <- (access$TimePoint)

table(access$TimePoint)
table(access$TimePoint, access$I1_FishedOrHiredLaborLastThreeMosYN)

summary(access$TimePoint)
skim(access$TimePoint)

## subset the data and extract key variables
access2 <- tibble(access) %>% 
  select(TimePoint, ParticipantID, I1_FishedOrHiredLaborLastThreeMosYN)
dim(access2)
head(access2)

access3 <- access2 %>% 
  mutate(fished_or_hired = as.numeric(fished),
         fished_hired = as.numeric(I21_HireLabor),
         fished_leased = as.numeric(I21_GoFishingUnderLease),
         fished_self = as.numeric(I21_GoFishingSelfEmployed))


%>% 
  rename(fished = I1_FishedOrHiredLaborLastThreeMosYN,
         everfished = I21_HireLabor,
  )


access3 %>% 
  
  
  head(access3)
