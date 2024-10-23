# Bubble plot Lincoln weather data 4D view
# Clear the workspace
rm(list = ls())

# Load the necessary library
library(ggplot2)

# Remove rows with missing values from the dataset
data = na.omit(lincoln_weather)

# Create a scatter plot
ggplot(data, aes(x = `Mean Temperature [F]`,
                 y = `Mean Dew Point [F]`,
                 size = CloudCover,
                 color = Events)) +
  geom_point(alpha = 1) +
  labs(title = "",
       y = "Mean Dew Point (°F)",
       x = "Mean Temperature (°F)") +
  theme_bw() +
  scale_size(name = "Cloud Cover (Okta)") +
  theme_classic() +
  theme(legend.position = c(0.12, 0.65),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        plot.title = element_text(size = 6, face = "bold"),
        legend.title = element_text(size = 6),
        legend.text = element_text(size = 6),
        axis.text = element_text(size = 8),
        axis.title = element_text(size = 8))
