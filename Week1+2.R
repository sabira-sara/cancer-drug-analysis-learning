8+8
2*10
x<- c(2,3,4,5,6,7,8,9)
Weights <- c (98,34,65,78,77,86,75)
mean (Weights)
length (Weights)
colonies <- c(23,34,65,7,5,4,7,89,12,54,56,76,87,9)
mean (colonies)
length(colonies)
print (colonies)
total <-sum (colonies)
print (total)
sum (colonies)
samples <- data.frame(
  sample_id = c("KS1","KS2", "KS3"),
  bacteria = c("Klebsiella", "Vibrio", "Pseudomonas"),
  colony_count = c(34, 67,88)
)
print (samples)
samples <- data.frame(
  sample_id = c("S1", "S2", "S3", "S4"),
  bacteria = c("Vibrio", "Klebsiella", "Vibrio", "Pseudomonas"),
  colony_count = c(25, 40, 30, 15)
)
print(samples)
head (samples)
str (samples)
names (samples)
write.csv(samples, "my_samples.csv", row.names = FALSE)
getwd()
learning_log <- data.frame(
  date = "2026-10-30",
  hours = 1,
  topic = "R basics",
  learned = "Vectors and data frames"
)
print (learning_log)
write.csv(learning_log, "learning_log.csv", row.names = FALSE)
values <- c(10, 20, NA, 40)

mean(values)
mean(values, na.rm = TRUE)
learning_track <- data.frame(
  data = "2026-10-17", "2026-10-18", "2026-10-19", "2026-10-20", "2026-10-21", "2026-10-22", "2026-10-23", "2026-10-24", "2026-10-25", "2026-10-26", "2026-10-27", "2026-10-28", "2026-10-29", "2026-10-30", "2026-10-31",
  hours = 1,1,1,2,2,1,2,2,1,1,1,2,2,1,1,
  topic = " R basics", "Script", "Console", "Row", "Column", "CSV files", "Installed library","Simple math", "Vectors", "Mean", "Length", "Print", "data frame", "Terminology", "Practice",
)
learning_track <- data.frame(
  date = c(
    "2026-10-17", "2026-10-18", "2026-10-19",
    "2026-10-20", "2026-10-21", "2026-10-22",
    "2026-10-23", "2026-10-24", "2026-10-25",
    "2026-10-26", "2026-10-27", "2026-10-28",
    "2026-10-29", "2026-10-30", "2026-10-31"
  ),
  hours = c(1, 1, 1, 2, 2, 1, 2, 2, 1, 1, 1, 2, 2, 1, 1),
  topic = c(
    "R basics", "Script", "Console", "Row", "Column",
    "CSV files", "Installed library", "Simple math",
    "Vectors", "Mean", "Length", "Print",
    "Data frame", "Terminology", "Practice"
  )
)

print(learning_track)
write.csv(learning_track, "learning_track.csv", row.names = FALSE)


getwd()
list.files()
learning_track <- read.csv("learning_track.csv")
head (learning_track)

setwd("C:/Users/msibb/Documents/GitHub/R-learning")

normalizePath("~/Documents", mustWork = FALSE)
dir.exists("~/Documents/GitHub")
list.files("~/Documents/GitHub")
list.files("~/Documents", full.names = TRUE)
file.exists("C:/Users/msibb/OneDrive/Documents/GitHub")
getwd()
Sys.getenv("USERPROFILE")
path.expand("~")
dir.exists("C:/Users/msibb/Downloads/OneDrive/Documents/GitHub")
dir.exists("C:/Users/msibb/Downloads/OneDrive/Documents/GitHub/R-learning")
dir.create("C:/Users/msibb/Downloads/OneDrive/Documents/GitHub/R-learning")
setwd("C:/Users/msibb/Downloads/OneDrive/Documents/GitHub/R-learning")
getwd()
write.csv(learning_log, "learning_log.csv", row.names = FALSE)
install.packages(c("readr", "dplyr", "ggplot2"))

library(readr)
library(dplyr)
library(ggplot2)

dir.create("data_practice", showWarnings = FALSE)
dir.create("outputs", showWarnings = FALSE)

toy <- data.frame(
  model_id = paste0("TRAIN_", 1:9),
  cancer = rep(c("HCC", "Pancreatic", "TNBC"), each = 3),
  compound = rep("Fictional_A", 9),
  toy_response = c(0.9,0.7,0.6,0.8,0.5,0.4,0.9,0.6,0.3),
  toy_expression = c(2,4,3,5,6,4,1,7,8)
)
write_csv(toy, "data_practice/toy_response.csv")
x <- read_csv("data_practice/toy_response.csv")
toy$toy_expression[4] <- 24
write_csv(toy, "data_practice/toy_response.csv")
x_new <- read_csv("data_practice/toy_response.csv")
head(x_new)
x$toy_expression[4]
x_new$toy_expression[4]

sara <- data.frame(
  sample_id = paste0("Klebsiella_", 1:6),
  type = rep(c("soil", "water"), each = 3),
  response = c(2,3,4,5,6,7),
  expression = c (9,8,7,6,5,4)
)
print (sara)
write_csv(sara, "data_practice/sara.csv")


