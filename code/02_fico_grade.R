here::i_am("code/02_fico_grade.R")



SNL_data_1 <- readRDS(file = here::here("output/uterine_data.rds"))



SNL_gtab2 <- SNL_data_1 |>
  select("SNL_number", "Final_resection_Dx") |>
  tbl_summary(by = SNL_number) |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Tumor Size**") |>
  add_overall() |>
  add_p()

saveRDS(SNL_gtab2, file = here::here("output", "uterine_table_2.rds"))
