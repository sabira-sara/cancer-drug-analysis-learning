library(readr)

model <- read_csv(
  "C:/Users/msibb/Downloads/OneDrive/Documents/GitHub/CSV files/Model.csv"
)

head(model)
getwd()

dim(model)
head(model$ModelID)
head(model$Stage)
head(model$PatientID)
names(model)
nrow(model)

summary(model)

library(dplyr)

breast_models <- model %>%
  filter(OncotreeLineage == "Breast")

nrow(breast_models)

breast_models %>%
  count(OncotreePrimaryDisease, OncotreeSubtype)


breast_models %>%
  filter(grepl("triple-negative", OncotreeSubtype,
               ignore.case = TRUE))

breast_models %>%
  count(OncotreeSubtype, sort = TRUE)

breast_models %>%
  count(OncotreeSubtype, sort = TRUE) %>%
  print(n = Inf)

names(breast_models)

grep(
  "ER|PR|HER2|receptor",
  names(breast_models),
  value = TRUE,
  ignore.case = TRUE
)

##search for column using keywords 
grep("Oncotree", names(model), value = TRUE)

library(readr)

expression <- read_csv(
  "C:/Users/msibb/Downloads/OneDrive/Documents/GitHub/CSV files/OmicsExpressionProteinCodingGenesTPMLogp1.csv"
)
head(expression)
names(expression)[1:10]

dim(expression)
str(expression)

head(expression[, 1:6])

summary(expression$`TSPAN6 (7105)`)

summary(expression$`GCLC (2729)`)

library(ggplot2)

ggplot(expression, aes(x = `GCLC (2729)`)) +
  geom_histogram(bins = 30, fill = "steelblue", color = "black") +
  labs(
    title = "Distribution of GCLC Expression",
    x = "GCLC expression",
    y = "Number of samples"
  ) +
  theme_minimal()

mean(expression$`GCLC (2729)`)
median(expression$`GCLC (2729)`)

skew <- mean((expression$`GCLC (2729)` -
                mean(expression$`GCLC (2729)`))^3) /
  sd(expression$`GCLC (2729)`)^3

skew

sd(expression$`GCLC (2729)`)

ggplot(expression, aes(y = `GCLC (2729)`)) +
  geom_boxplot(fill = "skyblue") +
  labs(
    title = "GCLC Expression in TNBC Samples",
    y = "GCLC Expression"
  ) +
  theme_minimal()

print(expression)

quantile(expression$`GCLC (2729)`)
IQR(expression$`GCLC (2729)`)

Q1 <- quantile(expression$`GCLC (2729)`, 0.25)

Q3 <- quantile(expression$`GCLC (2729)`, 0.75)

IQR_value <- IQR(expression$`GCLC (2729)`)

lower_limit <- Q1 - 1.5 * IQR_value

upper_limit <- Q3 + 1.5 * IQR_value

lower_limit
upper_limit

sum(expression$`GCLC (2729)` < lower_limit)

sum(expression$`GCLC (2729)` > upper_limit)

nrow(expression)

sum(expression$`GCLC (2729)` < lower_limit |
      expression$`GCLC (2729)` > upper_limit)

mean(expression$`GCLC (2729)` < lower_limit |
       expression$`GCLC (2729)` > upper_limit) * 100

high_GCLC <- expression %>%
  filter(`GCLC (2729)` > upper_limit)

head(high_GCLC)
nrow(high_GCLC)

high_GCLC %>%
  select(model_id, `GCLC (2729)`) %>%
  arrange(desc(`GCLC (2729)`))

colnames(expression)[1:5]
class(expression)
str(expression)
head(expression)
ls()
Q
ls()
class(expression)

colnames(expression)

grep("GCLC|GPX4|SLC7A11", colnames(expression), value = TRUE)

library(dplyr)

ferroptosis_genes <- expression %>%
  select(
    `GCLC (2729)`,
    `GPX4 (2879)`,
    `SLC7A11 (23657)`
  )


head(ferroptosis_genes)

colMeans(ferroptosis_genes, na.rm = TRUE)

library(ggplot2)

gene_means <- data.frame(
  Gene = names(colMeans(ferroptosis_genes)),
  Mean_Expression = as.numeric(colMeans(ferroptosis_genes))
)

ggplot(gene_means, aes(x = Gene, y = Mean_Expression)) +
  geom_col(fill = "steelblue") +
  labs(
    title = "Average Expression of Ferroptosis-related Genes",
    x = "Genes",
    y = "Mean Expression"
  ) +
  theme_minimal()



