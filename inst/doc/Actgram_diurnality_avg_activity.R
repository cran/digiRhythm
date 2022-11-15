## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", fig.width = 7
)

## ----loading------------------------------------------------------------------
library(digiRhythm)
data <- digiRhythm::df691b_1
data <- remove_activity_outliers(data)
data <- resample_dgm(data, 15)
activity = names(data)[2]
head(data)

## ----actogram-----------------------------------------------------------------
start <- "2020-08-25" #year-month-day
end <- "2020-10-11" #year-month-day -->
activity_alias <- 'Motion Index'
#save <- 'sample_results/actogram' #if NULL, don't save the image
my_actogram <- actogram(data, activity, activity_alias , start, end, save = NULL)

## ----daily_average_activity---------------------------------------------------
start <- "2020-08-25" #year-month-day
end <- "2020-10-11" #year-month-day -->
activity_alias <- 'Motion Index'
#save <- 'sample_results/actogram' #if NULL, don't save the image
my_daa <- daily_average_activity(data, activity, activity_alias , start, end, save = NULL)

## ----diurnality---------------------------------------------------------------
day_time = c("06:30:00", "16:30:00")
night_time = c("18:00:00", "T05:00:00")
my_di <- diurnality(data, activity, day_time, night_time, save = NULL)

