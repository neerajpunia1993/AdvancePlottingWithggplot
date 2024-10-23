# Mean ozone level across the months
# Clear the workspace
rm(list = ls())

# Load necessary libraries
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

# Create a boxplot of Ozone levels by month
data %>%
  mutate(new.col = fct_relevel(new.col,
                               "May 1973",
                               "June 1973",
                               "July 1973",
                               "Aug 1973",
                               "Sep 1973")) %>%
  ggplot(aes(x = new.col, y = Ozone, fill = new.col)) +
  geom_boxplot(alpha = 1) +
  theme_bw() +
  theme(legend.position = "none") +
  labs(y = "Mean Ozone (ppb)", x = "Months") +
  theme(panel.border = element_rect(color = "black", fill = NA, size = 0.5)) +
  scale_fill_manual(values = heat.colors(5))
