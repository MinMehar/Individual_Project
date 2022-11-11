here::i_am("code/03_patient_age.R")

library(labelled)
library(gtsummary)

SNL_data_1 <- readRDS(file = here::here("output/uterine_data.rds"))


SNL_gtab3 <- SNL_data_1 |>
  select("SNL_number", "Patient_Age") |>
  tbl_summary(by = SNL_number) |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Tumor Size**") |>
  add_overall() |>
  add_p()

saveRDS(SNL_gtab3, file = here::here("output", "uterine_table_3.rds"))
