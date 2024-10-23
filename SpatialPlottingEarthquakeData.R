# Here we will use "quakes" data set that is inbuilt in R. The data set give the locations of 1000
#seismic events of MB > 4.0. The events occurred in a cube near Fiji since 1964.

library(ggplot2)

# Create a scatter plot of seismic events
ggplot(data = quakes, aes(x = long, y = lat, color = depth)) +
  geom_point() +
  theme_bw() +
  xlab("Longitude") +
  ylab("Latitude") +
  scale_color_gradientn(name = "Depth (KM)",
                        breaks = seq(min(quakes$depth), max(quakes$depth), by = 64),
                        colors = rainbow(5)) +
  coord_fixed() +
  theme(legend.key.height = unit(1.9, 'cm'),
        legend.key.width = unit(0.5, 'cm'))
