# Exponential Smoothing and Change Detection for Weather Data
 Exponential Smoothing using Holt-Winters Model to detect changes in weather data


Analyzing Atlanta's "End of Summer" with Exponential Smoothing
This project investigates whether the unofficial end of summer in Atlanta has shifted later over the past 20 years using daily high-temperature data (July through October) and an exponential smoothing model.

Data:

20 years of daily high-temperature data for Atlanta (July through October) stored in temps.txt.

Exponential Smoothing:

Employed the HoltWinters function in R to implement triple exponential smoothing (Holt-Winters method) with an additive trend and multiplicative seasonality (model = "AAM"). This model accounts for both trend and seasonality in the time series data.


Seasonality Analysis:

Extracted the fitted seasonal values from the exponential smoothing model.
Calculated the mean and standard deviation of high temperatures for the baseline period (July 1 to August 31).
Established a buffer (C) equal to the average standard deviation and a threshold (T) of 5 standard deviations.
CUSUM Analysis:

Performed a CUSUM analysis on the seasonal factors to detect shifts in the timing of the end of summer. This involved accumulating deviations from the mean and comparing them to the threshold.


Repository Contents:


temps.txt: Raw temperature data.

Holt Winters.R: R script for data processing, model fitting, and analysis.

smoothed.csv (renamed CUSUM Calculations in Excel.xlsx for readability) : Output file containing seasonal factors and calculated CUSUM results.
