
import pandas as pd
import numpy as np

# Load dataset
df = pd.read_csv(
    "data/raw/bank-full.csv",
    sep=";"
)

# Display first five records
print("FIRST FIVE RECORDS")
print(df.head())

# Dataset dimensions
print("\nDATASET SHAPE")
print(df.shape)

# Column information
print("\nDATA TYPES")
print(df.info())

# Statistical summary
print("\nSTATISTICAL SUMMARY")
print(df.describe(include="all").T)

# Missing values
print("\nMISSING VALUES")
print(df.isnull().sum())

# Duplicate records
print("\nDUPLICATE RECORDS")
print(df.duplicated().sum())

# Target distribution
print("\nCAMPAIGN RESPONSE DISTRIBUTION")
print(df["y"].value_counts())

# Target percentage
print("\nRESPONSE PERCENTAGE")
print(df["y"].value_counts(normalize=True) * 100)
