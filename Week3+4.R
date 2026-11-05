library(readr)
library(dplyr)
library(ggplot2)
toy <- read_csv("data_practice/toy_response.csv")
names(toy)
dim(toy)
toy_selected <- select(toy, model_id, cancer)

print(toy_selected)

toy_filtered <- filter(toy, cancer == "HCC")

print(toy_filtered)

toy_mutated <- mutate(toy, response_percent = response * 100)

print(toy_mutated)

toy_arranged_desc <- arrange(toy, desc(model_id))

print(toy_arranged_desc)

cancer_counts <- count(toy, cancer, sort = TRUE)

print(cancer_counts)

practice_data <- data.frame(
  model_id = c(
    "M01", "M02", "M03", "M04", "M05",
    "M06", "M07", "M08", "M09", "M10",
    "M01", "M02", "M03", "M04", "M05",
    "M06", "M07", "M08", "M09", "M10",
    "M11", "M12", "M13", "M14", "M15",
    "M11", "M12", "M13", "M14", "M15"
  ),
  
  cancer = c(
    "HCC", "HCC", "TNBC", "TNBC", "Pancreatic",
    "Pancreatic", "HCC", "TNBC", "HCC", "Pancreatic",
    "HCC", "HCC", "TNBC", "TNBC", "Pancreatic",
    "Pancreatic", "HCC", "TNBC", "HCC", "Pancreatic",
    "TNBC", "HCC", "Pancreatic", "TNBC", "HCC",
    "TNBC", "HCC", "Pancreatic", "TNBC", "HCC"
  ),
  
  drug = rep(
    c("Drug_A", "Drug_B", "Drug_C"),
    10
  ),
  
  dose_uM = rep(
    c(1, 5, 10, 20, 5, 10),
    5
  ),
  
  response = c(
    0.75, 0.62, 0.45, 0.80, 0.55,
    0.70, 0.88, 0.35, 0.67, 0.50,
    0.72, 0.60, 0.40, 0.78, 0.58,
    0.68, 0.85, 0.38, 0.65, 0.48,
    0.55, 0.90, 0.42, 0.73, 0.60,
    0.50, 0.87, 0.45, 0.70, 0.58
  )
)

print(practice_data)
write_csv(practice_data, "data_practice/practice_cancer.csv")
cancer_data <- read_csv("data_practice/practice_cancer.csv")

print(cancer_data)

head(cancer_data)
dim (cancer_data)
names(cancer_data)
str(cancer_data)
select(cancer_data, -drug)
select(cancer_data, response)
filter(cancer_data, cancer == "HCC")
filter(cancer_data, drug == "Drug_A")
mutate(cancer_data, high_dose = dose_uM > 5)
mutate(cancer_data, response_percent = response * 100)
mutate(cancer_data, high_dose = dose_uM > 5, response_percent = response * 100)
write.csv(cancer_data, "data_practice/week3_data.csv")





