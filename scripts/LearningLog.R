##learning_log Week3 and Week4
 
learninglog_W3W4 <- data.frame(
  date = c(
    "2026-11-01", "2026-11-02", "2026-11-03",
    "2026-11-04", "2026-11-05", "2026-11-06",
    "2026-11-07", "2026-11-08", "2026-11-09",
    "2026-11-10", "2026-11-11", "2026-11-12",
    "2026-11-13", "2026-11-14"
  ),
  hours = c(2, 2, 1, 2, 2, 3, 2, 2, 1, 1, 1, 4, 2, 1),
  topic = c(
    topic = c(
      "Understanding R packages readr, dplyr, ggplot2",
      "Import and export CSV",
      "str, glimpse, dim",
      "names, select, filter, mutate",
      "Practice: Previous topics 1",
      "Practice: Previous topics 2",
      "count, NA, distinct",
      "Data cleaning and manipulation practice",
      "ggplot2: data visualization, creating a simple plot",
      "Reading and understanding a published research paper",
      "Identifying datasets and variables from a published paper",
      "Reproducing figures and plots from a published paper",
      "Scientific terminology and research glossary",
      "Integrated R practice and revision"
    )
  )
)

print(learninglog_W3W4)


write.csv(
  learninglog_W3W4,
  "GitHub/R-learning/data_practice/LearningLog_week3_4.csv",
  row.names = FALSE
)

