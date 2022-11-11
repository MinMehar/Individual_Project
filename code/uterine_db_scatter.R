here::i_am("code/uterine_db_scatter.R")

#load ggplot
library(ggplot2)
library(labelled)
library(gtsummary)

#read in data
SNL_data_1 <- readRDS(file = here::here("output/uterine_data.rds"))

#create scatterplot with decision boundary among risk prediction for 
#uterine cancer patients
db_scatter <- 
  ggplot(SNL_data_1, aes(Patient_Age, Tumor_Size)) +
  geom_point(aes(colour = factor(Risk))) + 
  labs(colour = 'Risk Prediction') +
  xlab("Patient Age") + ylab("Tumor Size") +
  geom_smooth(method = "lm", se = FALSE, col = "green") +
  scale_color_manual(values=c('purple', 'red'))


db_scatter


ggsave(
  here::here("output/scp_db.png"),
  plot = db_scatter,
  device = "png"
)
