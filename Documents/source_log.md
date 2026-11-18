# Data Source Log

This document records the sources, versions, measurement units, and selection criteria of datasets used in this computational oncology project.

## 1. DepMap Datasets

### 1.1 Gene Expression

- **Filename:** `OmicsExpressionProteinCodingGenesTPMLogp1.csv`
- **Source:** [DepMap Portal](https://depmap.org/portal/)
- **Release:** DepMap Public 26Q3
- **Date accessed:** 15 November 2026
- **Units:** Log2(TPM + 1), as indicated by the dataset documentation
- **Subset rules:** Selected GCLC, GPX4, and SLC7A11 expression columns for the ferroptosis-related analysis.

### 1.2 Model Metadata

- **Filename:** `Model.csv`
- **Source:** [DepMap Portal](https://depmap.org/portal/)
- **Release:** DepMap Public 26Q3
- **Date accessed:** 15 November 2026
- **Units:** Not applicable (metadata)
- **Subset rules:** Selected relevant model identifiers and cancer-type annotations for integration with PRISM response data.

## 2. PRISM Dataset

### 2.1 Primary Screen Drug Response

- **Filename:** [Insert exact filename]
- **Source:** [PRISM Repurposing](https://depmap.org/repurposing/)
- **Release:** Primary Screen (record exact release/version from README)
- **Date accessed:** 18 November 2026
- **Units:** Log-fold change (verify the exact definition in the README)
- **Subset rules:** Selected a manageable subset of compounds and cell lines for practice and integration with DepMap model metadata.

### 2.2 Cell Line Information

- **Filename:** [Insert exact filename]
- **Source:** [PRISM Repurposing](https://depmap.org/repurposing/)
- **Release:** Primary Screen (record exact release/version from README)
- **Date accessed:** 18 November 2026
- **Units:** Not applicable (metadata)
- **Subset rules:** Selected cell-line identifiers needed to understand and connect PRISM records with DepMap models.

### 2.3 Treatment Information

- **Filename:** [Insert exact filename]
- **Source:** [PRISM Repurposing](https://depmap.org/repurposing/)
- **Release:** Primary Screen (record exact release/version from README)
- **Date accessed:** 18 November 2026
- **Units:** Not applicable (compound and treatment metadata)
- **Subset rules:** Selected compound identifiers and corresponding treatment annotations relevant to the practice analysis.
