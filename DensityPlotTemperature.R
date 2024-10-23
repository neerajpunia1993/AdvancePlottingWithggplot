#Temperature variation across the months
# Clear the workspace
rm(list = ls())

# Load necessary libraries
library(ggridges)
library(ggplot2)
library(tidyverse)

# Create a new column for months
new.col = c(rep("May 1973", 31),
            rep("June 1973", 30),
            rep("July 1973", 31),
            rep("Aug 1973", 31),
            rep("Sep 1973", 30))

# Add the new column to the airquality dataset
airquality["new.col"] = new.col
data = airquality

# Create a ridge plot for temperature variation by month
data %>%
  mutate(new.col = fct_relevel(new.col,
                               "Sep 1973",
                               "Aug 1973",
                               "July 1973",
                               "June 1973",
                               "May 1973")) %>%
  ggplot(aes(x = Temp, y = new.col, fill = new.col)) +
  geom_density_ridges(alpha = 1) +
  theme_bw() +
  theme(legend.position = "none") +
  labs(x = "Temperature (°F)", y = "Months") +
  theme(panel.border = element_rect(color = "black", fill = NA, size = 0.5)) +
  scale_fill_manual(values = c("#0000FF", "#6600FF", "#CC00FF", "#FF00CC", "#FF0066"))
