here::i_am("code/01_uterine_lnl.R")

#read in original data
SNL_data_1 <-read.csv("orig_data/SNL_Harvard_1.csv", header=TRUE)

library(labelled)
library(gtsummary)

#create table
SNL_table1 <-
  var_label(SNL_data_1) <- list(
    No = "ID",
    Size_of_the_tumor = "Tumor Size",
    Patient_Age = "Patient Age",
    Lymph_node_Location = "Location of Lymph Node",
    Final_resection_Dx = "Grade of Uterine Cancer"
    
  )

SNL_data_1$SNL_number <- ifelse(SNL_data_1$Size_of_the_tumor < 2, "< 2", ">= 2")

SNL_gtab <- SNL_data_1 |>
  select("Lymph_node_Location", "SNL_number") |>
  tbl_summary(by = SNL_number) |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Tumor Size**") |>
  add_overall() |>
  add_p()


saveRDS(SNL_data_1, file = here::here("output", "uterine_data.rds"))
saveRDS(SNL_gtab, file = here::here("output", "uterine_table.rds"))

