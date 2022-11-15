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

## ----daily_activity_wrap_plot-------------------------------------------------
activity_alias <- 'Motion Index'
start <- "2020-08-25" #year-month-day
end <- "2020-10-11" #year-month-day
sampling_rate <- 15
ncols <- 3 #number of columns
#save <- 'sample_results/daily_wrap_plot' #if Null, doesn't save the image
my_daily_wrap_plot <- daily_activity_wrap_plot(data, activity, activity_alias, start, end, sampling_rate, ncols, save = Null)

