# Tidy Tuesday: Edible Plants Database

## Team

- Eric Lee
- Neha

## Dataset

This project uses the **Edible Plant Database** from TidyTuesday (2026-02-03).

The dataset contains information about edible plant species and their growing conditions, including factors such as temperature, sunlight, water requirements, growing season, and harvest information.

## Research Question

**What cultivation classes require the most water?**

## Analysis

We explore the water requirements of edible plants across different cultivation classes.

We:

1. Clean and prepare the data.
2. Examine water requirements by cultivation class.
3. Calculate the percentage of plants requiring high water within each cultivation class.
4. Visualize the cultivation classes with high water requirements.
5. Summarize the main findings.

## Results

The **Salad** cultivation class has the highest percentage of plants requiring high water, at **66.7%**.

This is followed by:

- Brassica: 38.1%
- Cucurbit: 37.5%
- Lamiaceae: 25.0%
- Umbelliferae: 25.0%
- Miscellaneous: 12.3%
- Legume: 10.0%

## Website

A website presenting our analysis and results will be created using **Quarto** and deployed using **GitHub Pages**.

## Reproducibility

The analysis code and data used for this project are included in this repository.

The main files are:

- `2026-02-03/cleaning.R` — data cleaning and analysis
- `2026-02-03/edible_plants.csv` — dataset
- `2026-02-03/edible_plants.md` — dataset documentation
- `2026-02-03/meta.yaml` — dataset metadata
- `2026-02-03/high_water.png` — visualization of high water requirements

## Acknowledgments

Data provided through the TidyTuesday project and the Edible Plant Database.
