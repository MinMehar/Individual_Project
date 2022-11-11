
SLN_Final.html: SLN_Final.Rmd code/render_report.R graphics/Lymph_Drainage.png \
graphics/SLN_procedure.png graphics/Location_freq_SLN.png output/uterine_table.rds \
output/uterine_table_2.rds output/uterine_table_3.rds output/scp_db.png output/uterine_data.rds
	Rscript code/render_report.R
	
output/uterine_data.rds output/uterine_table.rds: code/01_uterine_lnl.R
	Rscript code/01_uterine_lnl.R	
	
output/uterine_table_2.rds: output/uterine_data.rds code/02_fico_grade.R
	Rscript code/02_fico_grade.R

output/uterine_table_3.rds: output/uterine_data.rds code/03_patient_age.R
	Rscript code/03_patient_age.R

output/scp_db: output/uterine_data.rds code/uterine_db_scatter.R
	Rscript code/uterine_db_scatter.R

.PHONY: clean
clean:
	rm -f output/*.* && rm -f SLN_Final.html