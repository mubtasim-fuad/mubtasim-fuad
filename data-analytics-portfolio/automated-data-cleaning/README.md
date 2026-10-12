# Data Cleaning & Automated Reporting

**Tools:** Python, Pandas, openpyxl and Excel.

Takes an intentionally messy synthetic recruitment dataset, standardizes text, checks missing fields, identifies duplicate candidate IDs, and generates review files and Excel summaries.

## Run
```bash
pip install -r requirements.txt
python src/clean_and_report.py
```
Run from this project directory after placing `data/messy_candidates.csv` from the project archive.

## Outputs
`output/clean_candidates.csv`, `output/duplicates_for_review.csv`, `output/invalid_rows_for_review.csv` and `output/cleaning_report.xlsx`.

This is a fictional demonstration, not real candidate data.
