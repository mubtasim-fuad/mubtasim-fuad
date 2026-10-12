from pathlib import Path
import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "output"
OUT.mkdir(exist_ok=True)
df = pd.read_csv(ROOT / "data" / "messy_candidates.csv")
print("Input rows:", len(df))

for col in ["Country", "Status", "Recruiter"]:
    if col in df.columns:
        df[col] = df[col].astype("string").str.strip()

df["ApplicationDate"] = pd.to_datetime(df["ApplicationDate"], errors="coerce")
df["ProcessingDays"] = pd.to_numeric(df["ProcessingDays"], errors="coerce")
dup = df.loc[df.duplicated("CandidateID", keep=False)]
dup.to_csv(OUT / "duplicate_rows_for_review.csv", index=False)
required = ["CandidateID", "Country", "Status", "ApplicationDate"]
invalid = df.loc[df[required].isna().any(axis=1)]
invalid.to_csv(OUT / "invalid_rows_for_review.csv", index=False)
clean = df.dropna(subset=required).drop_duplicates(subset="CandidateID")
clean.to_csv(OUT / "clean_candidates.csv", index=False)
summary = clean.groupby(["Country", "Status"], dropna=False).size().reset_index(name="Count")
summary.to_csv(OUT / "country_status_summary.csv", index=False)
with pd.ExcelWriter(OUT / "cleaning_report.xlsx") as x:
    clean.to_excel(x, sheet_name="Clean Data", index=False)
    summary.to_excel(x, sheet_name="Summary", index=False)
print("Clean rows:", len(clean))
