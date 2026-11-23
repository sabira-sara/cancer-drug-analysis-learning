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

library(dplyr)

response <- data.frame(
  model_id = c("ACH-001", "ACH-002", "ACH-003"),
  response = c(-0.45, -0.80, -0.25)
)

models <- data.frame(
  model_id = c("ACH-001", "ACH-002", "ACH-004"),
  cancer_type = c("TNBC", "HCC", "Lung")
)
joined_data <- left_join(
  response,
  models,
  by = "model_id"
)

print(joined_data)

# Count matched IDs
sum(response$model_id %in% models$model_id)

# Count unmatched IDs in response
sum(!response$model_id %in% models$model_id)

anti_join(response, models, by = "model_id")

# Check duplicate IDs in response
response %>%
  count(model_id) %>%
  filter(n > 1)

# Check duplicate IDs in models
models %>%
  count(model_id) %>%
  filter(n > 1)

library(ggplot2)

ggplot(response, aes(x = response)) +
  geom_histogram(
    bins = 5,
    fill = "steelblue",
    color = "black"
  ) +
  labs(
    title = "Distribution of Drug Response",
    x = "Drug Response",
    y = "Frequency"
  ) +
  theme_minimal()


library(readr)
library(dplyr)
library(ggplot2)
getwd()
prism_models <- read_csv(
  "C:/Users/msibb/Downloads/OneDrive/Documents/Github/Prism/primary-screen-cell-line-info.csv"
)

head(prism_models)
dim(prism_models)
glimpse(prism_models)

prism_models %>%
  count(depmap_id) %>%
  filter(n > 1)

sum(is.na(prism_models$depmap_id))

n_distinct(prism_models$depmap_id)

prism_models %>%
  filter(!is.na(depmap_id)) %>%
  count(depmap_id) %>%
  filter(n > 1)



prism_models %>%
  filter(is.na(depmap_id)) %>%
  select(row_name, ccle_name, primary_tissue)

prism_models_clean <- prism_models %>%
  filter(!is.na(depmap_id))

dim(prism_models_clean)
anyDuplicated(prism_models_clean$depmap_id)

prism_response <- read_csv(
  "C:/Users/msibb/Downloads/OneDrive/Documents/Github/Prism/primary-screen-replicate-collapsed-logfold-change.csv"
)
dim(prism_response)
head(prism_response)
glimpse(prism_response)

names(prism_response)[1:10]

head(prism_response[[1]], 10)

names(prism_response)[1]

prism_response <- prism_response %>%
  rename(row_name = `...1`)


names(prism_response)[1:5]

anti_join(
  prism_response %>% select(row_name),
  prism_models %>% select(row_name),
  by = "row_name"
)

anti_join(
  prism_models %>% select(row_name),
  prism_response %>% select(row_name),
  by = "row_name"
)

prism_joined <- prism_response %>%
  left_join(
    prism_models,
    by = "row_name"
  )

dim(prism_joined)
glimpse(prism_joined)
prism_joined %>%
  count(primary_tissue, sort = TRUE)

prism_joined %>%
  count(primary_tissue, sort = TRUE) %>%
  filter(grepl("liver", primary_tissue, ignore.case = TRUE))

liver_models <- prism_joined %>%
  filter(grepl("liver", primary_tissue, ignore.case = TRUE))

liver_models %>%
  select(row_name, ccle_name, primary_tissue, secondary_tissue)


liver_models %>%
  select(row_name, ccle_name) %>%
  print(n = 25)

names(model)
dim(model)
model %>%
  count(cancer_type, sort = TRUE)

model %>%
  filter(grepl("hepatocellular carcinoma",
               OncotreePrimaryDisease,
               ignore.case = TRUE)) %>%
  select(ModelID, CCLEName,
         OncotreePrimaryDisease, OncotreeSubtype)

hcc_models <- model %>%
  filter(OncotreePrimaryDisease == "Hepatocellular Carcinoma") %>%
  select(ModelID, CCLEName, OncotreeSubtype)

hcc_prism <- prism_joined %>%
  inner_join(
    hcc_models,
    by = c("row_name" = "ModelID")
  )

dim(hcc_prism)

anti_join(
  hcc_models,
  prism_response %>% select(row_name),
  by = c("ModelID" = "row_name")
)
Q
hcc_prism %>%
  select(row_name, `BRD-A00077618-236-07-6::2.5::HTS`)

hcc_prism %>%
  summarise(
    mean_response = mean(
      `BRD-A00077618-236-07-6::2.5::HTS`,
      na.rm = TRUE
    ),
    median_response = median(
      `BRD-A00077618-236-07-6::2.5::HTS`,
      na.rm = TRUE
    ),
    min_response = min(
      `BRD-A00077618-236-07-6::2.5::HTS`,
      na.rm = TRUE
    ),
    max_response = max(
      `BRD-A00077618-236-07-6::2.5::HTS`,
      na.rm = TRUE
    )
  )
sum(is.na(
  hcc_prism$`BRD-A00077618-236-07-6::2.5::HTS`
))

drug_columns <- names(hcc_prism)[2:6]

hcc_prism %>%
  summarise(
    across(
      all_of(drug_columns),
      ~ mean(.x, na.rm = TRUE)
    )
  )

install.packages("tidyr")
library(tidyr)

drug_means <- hcc_prism %>%
  summarise(
    across(
      all_of(drug_columns),
      ~ mean(.x, na.rm = TRUE)
    )
  ) %>%
  pivot_longer(
    cols = everything(),
    names_to = "drug",
    values_to = "mean_response"
  ) %>%
  arrange(mean_response)

drug_means

library(ggplot2)

ggplot(drug_means,
       aes(x = reorder(drug, mean_response),
           y = mean_response)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Mean PRISM Drug Response in HCC Cell Lines",
    x = "Drug",
    y = "Mean log-fold change"
  ) +
  theme_minimal()

prism_joined %>%
  filter(!is.na(primary_tissue)) %>%
  ggplot(aes(
    x = primary_tissue,
    y = `BRD-A00077618-236-07-6::2.5::HTS`
  )) +
  geom_boxplot() +
  coord_flip() +
  labs(
    title = "PRISM Drug Response Across Cancer Types",
    x = "Primary tissue",
    y = "Log-fold change"
  ) +
  theme_minimal()


library(readr)
library(dplyr)
library(ggplot2)

# DepMap model information
model <- read_csv(
  "CSV files/Model.csv"
)

# DepMap gene expression
expression <- read_csv(
  "CSV files/OmicsExpressionProteinCodingGenesTPMLogp1.csv"
)

# PRISM cell-line information
prism_models <- read_csv(
  "Prism/primary-screen-cell-line-info.csv"
)

# PRISM drug response
prism_response <- read_csv(
  "Prism/primary-screen-replicate-collapsed-logfold-change.csv"
)

# Check imported datasets
ls()


dim(model)
dim(expression)
dim(prism_models)
dim(prism_response)


names(model)[1:10]

names(expression)[1:10]

names(prism_models)

names(prism_response)[1:10]

# DepMap model IDs
head(model$ModelID)

# Expression dataset IDs
head(expression$...1)

# PRISM model IDs
head(prism_models$depmap_id)

# PRISM response row identifiers
head(prism_response$...1)



dim(expression)

names(expression)[1:10]

head(expression[[1]], 10)

"GPX4 (2879)" %in% names(expression)


gpx4_data <- expression %>%
  select(...1, `GPX4 (2879)`)

head(gpx4_data)

gpx4_data <- gpx4_data %>%
  rename(
    depmap_id = `...1`,
    GPX4 = `GPX4 (2879)`
  )

head(gpx4_data)


gpx4_data %>%
  count(depmap_id) %>%
  filter(n > 1)

sum(is.na(gpx4_data$GPX4))

ls()

dim(prism_response)

names(prism_response)[1:15]
head(prism_response[[1]], 10)


prism_response <- prism_response %>%
  rename(depmap_id = `...1`)

head(prism_response$depmap_id, 10)

names(prism_response)[1:3]


prism_response <- prism_response %>%
  rename(depmap_id = `...1`)

names(prism_response)[1:3]



prism_response %>%
  count(depmap_id) %>%
  filter(n > 1)

sum(gpx4_data$depmap_id %in% prism_response$depmap_id)

unmatched_gpx4 <- gpx4_data %>%
  filter(!depmap_id %in% prism_response$depmap_id)

nrow(unmatched_gpx4)

sum(grepl("FAILED_STR", prism_response$depmap_id))

sum(gpx4_data$depmap_id %in% prism_response$depmap_id)

nrow(unmatched_gpx4)

gpx4_prism <- inner_join(
  gpx4_data,
  prism_response,
  by = "depmap_id"
)

dim(gpx4_prism)

gpx4_prism[1:6, 1:5]

names(gpx4_prism)[3:22]

dim(prism_models)

names(prism_models)

readLines(file.choose(), n = 40)
readLines(
  "C:/Users/msibb/Downloads/OneDrive/Documents/Github/Prism/primary-screen-readme.txt",
  n = 40
)

treatment_info <- read_csv(
  "C:/Users/msibb/Downloads/OneDrive/Documents/Github/Prism/primary-screen-replicate-collapsed-treatment-info.csv"
)
dim(treatment_info)

head(treatment_info)

sum(names(gpx4_prism)[-(1:2)] %in% treatment_info$column_name)

treatment_info_small <- treatment_info %>%
  select(column_name, broad_id, name, moa, target)

head(treatment_info_small)

compound_info <- treatment_info_small %>%
  filter(column_name %in% names(gpx4_prism)[-(1:2)])

dim(compound_info)


compound_info %>%
  filter(
    grepl("ferroptosis|oxidative stress|glutathione|lipid peroxidation",
          paste(moa, target, name),
          ignore.case = TRUE)
  ) %>%
  select(name, broad_id, moa, target)

compound_info %>%
  filter(name == "buthionine-sulfoximine") %>%
  select(column_name, broad_id, name, moa, target)

bso_data <- gpx4_prism %>%
  select(
    depmap_id,
    GPX4,
    `BRD-A47706533-001-02-6::2.5::HTS`
  ) %>%
  rename(
    BSO_response = `BRD-A47706533-001-02-6::2.5::HTS`
  )

head(bso_data)

sum(complete.cases(bso_data$GPX4, bso_data$BSO_response))

bso_complete <- bso_data %>%
  filter(complete.cases(GPX4, BSO_response))
nrow(bso_complete)

ggplot(bso_complete, aes(x = GPX4, y = BSO_response)) +
  geom_point() +
  labs(
    title = "GPX4 expression vs BSO response",
    x = "GPX4 expression",
    y = "BSO response (PRISM log2 fold-change)"
  ) +
  theme_minimal()

cor.test(
  bso_complete$GPX4,
  bso_complete$BSO_response,
  method = "spearman",
  exact = FALSE
)

ls()

class(model)
dim(model)
names(model)[1:10]

class(prism_models)
dim(prism_models)
names(prism_models)[1:10]




