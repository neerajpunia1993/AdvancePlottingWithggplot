# Bar graph of simulation for number of earthquakes using Poisson distribution in 30
years.
# Clear the workspace
rm(list = ls())

# Set seed for reproducibility
set.seed(2022)

# Create a data frame with years and random earthquake counts
df <- data.frame(year = 1:30, count = rpois(30, lambda = 2))

# Display the first few rows of the data frame
head(df)

# Load the ggplot2 library
library(ggplot2)

# Create the bar plot
bars <- ggplot(df, aes(year, count, fill = as.character(year))) +
  geom_bar(stat = "identity") +
  labs(x = "Years", y = "Number of Earthquakes") +
  theme(legend.position = "none")

# Add colors and labels to the bars
bars +
  scale_fill_hue() +
  geom_text(aes(label = count), vjust = -0.3, size = 3.5)
