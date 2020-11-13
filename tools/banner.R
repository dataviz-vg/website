library(ggplot2)
library(emoGG)
x = seq(0, 2*pi, length=10)
y = sin(x)
b = cos(x)
c = cospi(x)
ggplot() +
  geom_emoji(
    data = data.frame(x = x, y = y), 
    aes(x, y),
    emoji="1f331"
  ) + 
  geom_emoji(
    data = data.frame(x = x, y = b), 
    aes(x, y),
    emoji="1f4c8"
  ) + 
  geom_emoji(
    data = data.frame(x = x, y = c), 
    aes(x, y),
    emoji="1f951"
  ) + 
  vegviz::ggtheme() +
  theme_minimal() +
  labs(x = "", y = "")