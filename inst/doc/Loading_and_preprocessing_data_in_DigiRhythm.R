## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", fig.width = 8
)

## ----setup--------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(digiRhythm)

#A sample dataset could be found here
url <- 'https://raw.githubusercontent.com/nasserdr/digiRhythm_sample_datasets/main/516b_2.csv'
destination <- file.path(tempdir(), '516b_2.csv')
download.file(url, destfile = destination)

# system(paste("head -n 15",  filename)) #Run it only on linux
# IceTag ID:,,50001962,,,,
# Site ID:,,n/a,,,,
# Animal ID:,,n/a,,,,
# First Record:,,30.04.2020,11:54:20,,,
# Last Record:,,15.06.2020,11:06:55,,,
# File Time Zone:,,W. Europe Standard Time,,,,
# 
# Date,Time,Motion Index,Standing,Lying,Steps,Lying Bouts
# 30.04.2020,11:54:20,0,0:00.0,0:40.0,0,0
# 30.04.2020,11:55:00,0,0:00.0,1:00.0,0,0
# 30.04.2020,11:56:00,0,0:00.0,1:00.0,0,0
# 30.04.2020,11:57:00,0,0:00.0,1:00.0,0,0
# 30.04.2020,11:58:00,0,0:00.0,1:00.0,0,0
# 30.04.2020,11:59:00,0,0:00.0,1:00.0,0,0
# 30.04.2020,12:00:00,0,0:00.0,1:00.0,0,0


## ----Importing----------------------------------------------------------------
data <- import_raw_activity_data(destination,
                                   skipLines = 7,
                                   act.cols.names = c("Date", "Time", "Motion Index", 'Steps'),
                                   date_format = "%d.%m.%Y",
                                   time_format = "%H:%M:%S",
                                   sep = ',',
                                   original_tz = 'CET',
                                   target_tz = 'CET',
                                   sampling = 15,
                                   trim_first_day = TRUE,
                                   trim_middle_days = TRUE,
                                   trim_last_day = TRUE,
                                   verbose = TRUE)


## ----dgm_friendly-------------------------------------------------------------
is_dgm_friendly(data, verbose = TRUE)

## ----outliers-----------------------------------------------------------------
data_without_outliers <- remove_activity_outliers(data)
head(data_without_outliers)

## ----resampling---------------------------------------------------------------
resampled_data <- resample_dgm(data, new_sampling = 15)
head(resampled_data)

## ----periodicity--------------------------------------------------------------
s <- dgm_periodicity(data)

