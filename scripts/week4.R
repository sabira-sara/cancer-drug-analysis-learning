library(dplyr)
library(ggplot2)
library(readr)

week4_data <- data.frame(
  model_id = c(
    "MOO1", "MOO1", "MOO2", "MOO2", "MOO3", "MOO3", "MOO4", "MOO4", "MOO5", "MOO5", "MOO6", "MOO6", "MOO7", "MOO7", "MOO8", "MOO8", "MOO9", "MOO9", "MOO2", NA
  ),
  
  cancer = c(
    "HCC", "HCC", "HCC", "HCC",
    "HCC", "HCC",
    "TNBC", "TNBC", "TNBC", "TNBC",
    "TNBC", "TNBC",
    "Pancreatic", "Pancreatic",
    "Pancreatic", "Pancreatic",
    "Pancreatic", "Pancreatic",
    "HCC", "HCC"
  ),
  
  drug = c(
    "Drug_A", "Drug_B", "Drug_A", "Drug_B",
    "Drug_A", "Drug_B", "Drug_A", "Drug_B",
    "Drug_A", "Drug_B", "Drug_A", "Drug_B",
    "Drug_A", "Drug_B", "Drug_A", "Drug_B",
    "Drug_A", "Drug_B", "Drug_A", "Drug_A"
  ),
  
  response = c(
    0.75, 0.62, 0.81, 0.70,
    0.55, 0.48, 0.66, 0.59,
    0.72, 0.64, 0.68, 0.57,
    0.83, 0.74, 0.61, 0.53,
    0.79, 0.69, 0.81, 0.69
  )
)
print(week4_data)

View(week4_data)

dim(week4_data)

names(week4_data)

str(week4_data)

duplicated(week4_data)

sum(duplicated(week4_data))

week4_nodup <- distinct(week4_data)
dim(week4_nodup)

is.na(week4_nodup$model_id)
sum(is.na(week4_nodup$model_id))
week4_nodup[is.na(week4_nodup$model_id),]

week4_clean <- week4_nodup %>%
  filter(!is.na(model_id))

models <- distinct(week4_clean, model_id, cancer)

dim(models)

nrow(models)

counts <- count(models, cancer)

print(counts)

count(week4_clean, cancer)
count(models, cancer)

install.packages("ggplot2")

ggplot(counts, aes(x = cancer, y = n)) +
  geom_col() +
  labs(
    title = "Number of Unique Models by Cancer Type",
    x = "Cancer Type",
    y = "Number of Models"
  ) +
  theme_minimal()

ggplot(counts, aes(x = cancer, y = n)) +
  geom_col() +
  geom_text(aes(label = n), vjust = -0.5) +
  labs(
    title = "Number of Unique Models by Cancer Type",
    x = "Cancer Type",
    y = "Number of Models"
  ) +
  theme_minimal()


ggplot(counts, aes(x = cancer, y = n)) +
  geom_col(fill = "steelblue") +
  geom_text(aes(label = n), vjust = -0.5) +
  labs(
    title = "Number of Unique Models by Cancer Type",
    x = "Cancer Type",
    y = "Number of Models"
  ) +
  theme_minimal()


write.csv(toy1, "data_practice/W4toy1.csv", row.names = FALSE)

write.csv(week4_data, "data_practice/week4_data.csv", row.names = FALSE)

write.csv(week4_clean, "data_practice/week4_clean.csv", row.names = FALSE)

write.csv(models, "data_practice/W4_models.csv", row.names = FALSE)

write.csv(counts, "data_practice/W4_counts.csv", row.names = FALSE)

write.csv(week4_nodup, "GitHub/R-learning/data_practice/W4_nodup.csv", row.names = FALSE)

dir.create("data_practice", showWarnings = FALSE)
list.files("data_practice")

