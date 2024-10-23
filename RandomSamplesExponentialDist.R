# Clear the workspace
rm(list = ls())

# Load necessary libraries
library(tidyverse)
library(hrbrthemes)
library(viridis)

# Set seed for reproducibility
set.seed(2022)

# Define sample size
size = 500

# Simulate samples from exponential distributions with different rates
sample1 = rexp(size, 1.2)
sample2 = rexp(size, 0.5)
sample3 = rexp(size, 0.2)

# Combine samples into a data frame
data <- data.frame(
  name = c(rep("Rate = 1.2", size), rep("Rate = 0.5", size), rep("Rate = 0.2", size)),
  value = c(sample1, sample2, sample3)
)

# Create the boxplot
ggplot(data, aes(x = name, y = value, fill = name)) +
  geom_boxplot() +
  geom_jitter(color = "black", size = 0.4, alpha = 0.9) +
  scale_fill_viridis(discrete = TRUE, alpha = 1) +
  theme_minimal() +
  theme(legend.position = "none", plot.title = element_text(size = 11)) +
  xlab("") +
  ylab("") +
  ggtitle("Boxplot of Exponential Samples with Different Rates")
