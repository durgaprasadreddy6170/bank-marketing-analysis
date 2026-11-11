
import pandas as pd
import numpy as np

# Load original dataset
df = pd.read_csv(
    "data/raw/bank-full.csv",
    sep=";"
)

# Create a working copy
clean_df = df.copy()

print("Original dataset shape:", clean_df.shape)

# Check column names
print("\nColumn names:")
print(clean_df.columns.tolist())

# Check categorical columns
categorical_columns = clean_df.select_dtypes(
    include="object"
).columns

print("\nCategorical columns:")
print(categorical_columns.tolist())

# Remove unwanted spaces and standardize text
for col in categorical_columns:
    clean_df[col] = (
        clean_df[col]
        .str.strip()
        .str.lower()
    )

print("Categorical values standardized.")

# Check unique values in important columns
for col in ["job", "education", "contact", "poutcome"]:
    print(f"\n{col.upper()}:")
    print(clean_df[col].value_counts())

# Count unknown values in each categorical column
unknown_counts = {}

for col in categorical_columns:
    unknown_counts[col] = (
        clean_df[col]
        .eq("unknown")
        .sum()
    )

unknown_summary = pd.Series(
    unknown_counts,
    name="Unknown_Count"
)

print("\nUNKNOWN VALUE SUMMARY")
print(unknown_summary)

# Calculate unknown percentages
unknown_percentage = (
    unknown_summary / len(clean_df) * 100
)

print("\nUNKNOWN VALUE PERCENTAGE")
print(unknown_percentage.round(2))

# Count unknown values in each categorical column
unknown_counts = {}

for col in categorical_columns:
    unknown_counts[col] = (
        clean_df[col]
        .eq("unknown")
        .sum()
    )

unknown_summary = pd.Series(
    unknown_counts,
    name="Unknown_Count"
)

print("\nUNKNOWN VALUE SUMMARY")
print(unknown_summary)

# Calculate unknown percentages
unknown_percentage = (
    unknown_summary / len(clean_df) * 100
)

print("\nUNKNOWN VALUE PERCENTAGE")
print(unknown_percentage.round(2))

# Identify whether a customer was previously contacted
clean_df["previously_contacted"] = np.where(
    clean_df["pdays"] == -1,
    0,
    1
)

# Create a meaningful previous contact days column
clean_df["previous_contact_days"] = (
    clean_df["pdays"].replace(-1, np.nan)
)

# Check results
print("\nPREVIOUS CONTACT STATUS")
print(
    clean_df["previously_contacted"]
    .value_counts()
)

print("\nPREVIOUS CONTACT DAYS")
print(
    clean_df["previous_contact_days"]
    .describe()
)

# Check numerical variables
print("\nNUMERICAL DATA SUMMARY")

numerical_columns = [
    "age",
    "balance",
    "day",
    "duration",
    "campaign",
    "pdays",
    "previous"
]

print(clean_df[numerical_columns].describe().T)

# Check invalid values
print("\nVALIDATION CHECKS")

print("Invalid age:",
      ((clean_df["age"] < 18) |
       (clean_df["age"] > 100)).sum())

print("Invalid day:",
      ((clean_df["day"] < 1) |
       (clean_df["day"] > 31)).sum())

print("Negative campaign contacts:",
      (clean_df["campaign"] < 1).sum())

print("Negative previous contacts:",
      (clean_df["previous"] < 0).sum())

print("Negative duration:",
      (clean_df["duration"] < 0).sum())

# Verify missing values
print("\nMissing values:")
print(clean_df.isnull().sum())

# Verify duplicate rows
print("\nDuplicate rows:")
print(clean_df.duplicated().sum())

# Verify target values
print("\nTarget distribution:")
print(clean_df["y"].value_counts())

# Save processed dataset
clean_df.to_csv(
    "data/processed/bank_marketing_cleaned.csv",
    index=False
)

print("\nProcessed dataset saved successfully!")

print("Final dataset shape:", clean_df.shape)
