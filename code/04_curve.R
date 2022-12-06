here::i_am("code/04_curve.R")

library(labelled)
library(gtsummary)

SNL_data_1 <- readRDS(file = here::here("output/uterine_data.rds"))

library(ggplot2)
log_curve <- ggplot(SNL_data_1, aes(x=Tumor_Size, y=Risk)) + geom_point() +
  stat_smooth(method="glm", color="orange", lty=7, se=FALSE,
              method.args = list(family=binomial)) +
  xlab("Tumor Size") + ylab("Probability of Risk") +
  geom_point(aes(colour = factor(Risk)))

log_curve

ggsave(
  here::here("output/bin_curve.png"),
  plot = log_curve,
  device = "png"
)
