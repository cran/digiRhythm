## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", fig.width = 7
)

## ----setup--------------------------------------------------------------------
library(digiRhythm)
data <- digiRhythm::df691b_1
data <- resample_dgm(data, 15)
data <- remove_activity_outliers(data)
activity <- names(data)[3]
head(activity)

## ----lsp----------------------------------------------------------------------
df <- data[1:672, c("datetime", activity)]
my_lsp <- lomb_scargle_periodogram(df, alpha = 0.01, plot = TRUE)

## ----dfc_hp-------------------------------------------------------------------
my_dfc <- dfc(data, # The dataset
  activity = activity, # the name of the activity column
  sampling = 15, # the sampling frequency of my dataset is 15
  alpha = 0, 5, # significance level
  harm_cutoff = 12, # up till the harmonic 24/12 which is two hours
  plot = FALSE, verbose = FALSE
)
# Setting plot to TRUE will visualize all the LSP plots (like the one above)
# during each sliding window. Rather used for deeper investigation and
# debugging.
print(my_dfc)

## ----type_dfc-----------------------------------------------------------------
class(my_dfc)

## ----return_data--------------------------------------------------------------
head(my_dfc$data)

## ----og_plot------------------------------------------------------------------
print(my_dfc)

## ----change_aes---------------------------------------------------------------
library(ggplot2)
new_plot <- my_dfc +
  theme(
    text = element_text(family = "Times", size = 14),
    axis.text.y = element_text(size = 15, colour = "black")
  )
print(new_plot)

