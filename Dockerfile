FROM rocker/r-ubuntu

RUN apt-get update && apt-get install -y pandoc
RUN Rscript -e "install.packages('here')"
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('config')"
RUN Rscript -e "install.packages('knitr')"
RUN Rscript -e "install.packages('here')"
RUN Rscript -e "install.packages('labelled')"
RUN Rscript -e "install.packages('gtsummary')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('dplyr')"

RUN mkdir project
workdir /project

COPY Makefile .
COPY .gitignore . 
COPY renv.lock .
COPY README.md .
RUN mkdir code
RUN mkdir graphics
RUN mkdir orig_data
RUN mkdir output 
COPY orig_data orig_data 
COPY code code 
COPY SLN_Final.rmd .
RUN mkdir -p renv
COPY .Rprofile .Rprofile

COPY code/01_uterine_lnl.R code
COPY code/02_fico_grade.R code
COPY code/03_patient_age.R code
COPY code/04_curve.R code
COPY code/decision_boundary.R code
COPY code/render_report.R code
COPY code/uterine_db_scatter.R

COPY orig_data/SNL_Harvard_1.csv orig_data

RUN mkdir final_project
CMD make && mv SLN_Final.html final_report