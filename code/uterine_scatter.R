here::i_am("code/uterine_scatter.R")
path_data <- here::here("raw_data", "SNL_Harvard.csv")
data <- read.csv(absolute_path_to_data, header = TRUE)

data <- readRDS(
  file = here::here("code/SNL_")
)

library(ggplot2)

scatterplot <- 
  ggplot(data, aes(x = Size_of_the_tumor, y = Lymph_node_Location)) +
  geom_point() +
  geom_smooth(method = lm) +
  theme_bw()

ggsave(
  here::here("figures/scatterplot_1.png"),
  plot = scatterplot,
  device = "png"
)
