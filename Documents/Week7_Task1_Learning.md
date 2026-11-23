# Week 7: Scatterplots, Spearman Correlation, and Association vs Causation

## Learning objectives

This week, I learned how to:
- Create and interpret scatterplots.
- Understand Spearman rank correlation.
- Identify paired complete observations.
- Calculate correlation using R.
- Distinguish association from causation.

## 1. Scatterplots

A scatterplot is a graph used to examine the relationship between two numerical variables.

In my practice:
- X-axis: GPX4 gene expression.
- Y-axis: BSO response.
- Each dot represents one cell line.

I used `ggplot2` to create the scatterplot.

```r
ggplot(bso_complete, aes(x = GPX4, y = BSO_response)) +
  geom_point() +
  labs(
    title = "GPX4 expression vs BSO response",
    x = "GPX4 expression",
    y = "BSO response (PRISM log2 fold-change)"
  ) +
  theme_minimal()
```

The scatterplot showed no obvious upward or downward trend.

## 2. Spearman Correlation

Spearman correlation measures the strength and direction of a monotonic association between two variables using their ranks.

The correlation coefficient (rho) ranges from -1 to +1.

- **+1:** Perfect positive association.
- **-1:** Perfect negative association.
- **0:** No monotonic association.

I calculated Spearman correlation using:

```r
cor.test(
  bso_complete$GPX4,
  bso_complete$BSO_response,
  method = "spearman",
  exact = FALSE
)
```

### My Results

| Measurement | Result |
|---|---:|
| Spearman rho | 0.0338 |
| p-value | 0.429 |
| Complete observations | 550 |

### Interpretation

The correlation coefficient (0.0338) indicates a very weak positive association between GPX4 expression and BSO response.

The p-value (0.429) is greater than 0.05. Therefore, the association is not statistically significant.

In this dataset, I did not find statistically significant evidence of a monotonic association between GPX4 expression and BSO response.

## 3. Paired Complete Observations

Paired complete observations are rows in which both variables have available values for the same cell line.

I started with 559 matched cell lines and identified 550 complete observations.

I used:

```r
sum(complete.cases(
  bso_data$GPX4,
  bso_data$BSO_response
))
```

Then I created a dataset containing only complete observations:

```r
bso_complete <- bso_data %>%
  filter(complete.cases(GPX4, BSO_response))
```

I checked the number of observations using:

```r
nrow(bso_complete)
```

The result was 550.

## 4. Association vs Causation

**Association** means that two variables show a relationship or pattern of variation.

**Causation** means that a change in one variable directly produces a change in another variable.

A correlation does not automatically establish causation. Other factors may influence both variables.

For example, even if GPX4 expression and BSO response showed a strong correlation, this would not prove that GPX4 expression causes changes in BSO response.

## 5. What I Learned

Through this practice, I learned:

1. How to visualize the relationship between two numerical variables using a scatterplot.
2. How to calculate Spearman correlation in R.
3. How to identify and count paired complete observations.
4. How to interpret correlation coefficients and p-values.
5. Why correlation does not establish causation.

## Conclusion

I completed a practice analysis using DepMap GPX4 expression data and PRISM BSO response data. Among 550 complete cell-line observations, I found a very weak positive correlation (rho = 0.0338, p = 0.429), which was not statistically significant.

This exercise helped me understand how to examine relationships between gene expression and drug response while avoiding causal conclusions from correlation analysis.

