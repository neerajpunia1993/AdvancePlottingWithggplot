#Pairplot

rm(list = ls())
# Load necessary libraries
library(GGally)
library(tidyverse)
library(ggplot2)

# Create a new column for months
new.col = c(rep("May", 31),
            rep("June", 30),
            rep("July", 31),
            rep("Aug", 31),
            rep("Sep", 30))

# Add the new column to the airquality dataset and remove rows with missing values
airquality["new.col"] = new.col
data = na.omit(airquality)

# Create a pairwise plot
ggpairs(data,
        columns = c(1, 3, 4),
        ggplot2::aes(colour = as.character(new.col), alpha = 0.5),
        upper = list(continuous = wrap("cor", size = 7.5))) +
  theme_bw()
