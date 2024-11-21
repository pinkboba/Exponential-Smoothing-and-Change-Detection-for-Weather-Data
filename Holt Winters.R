rm(list = ls())

data <- read.table("C:\\Users\\rache\\OneDrive - iaarc\\Documents\\Gatech MM\\ISYE Introduction to Analytics Modeling\\Homework 4\\hw4-SP22\\data 7.2\\temps.txt", header = TRUE)

View(data)

# convert to a time series object
# flattening using unlist
# ?unlist()
b <- as.vector(unlist(data[,2:21]))
b


# frequency: what is the pattern of data collection
# frequency is 123 because there are 123 days of data per year
data_ts <- ts(b, start=1996, frequency = 123)

# plot(data_ts)
# what does the raw data look like over time
# observed data is broken down into trends, seasonal, and noise
## plot(decompose(data_ts))
# does NOT replace exponential smoothing. only averaging for each time unit over all periods

# Holt-Winters: level(alpha), trend(beta), seasonality(gamma)
# multiplicative or additive? (a+b+seasonal) OR (a+b) * seasonal
# Triple exponential smoothing: 

data_hw <- HoltWinters(data_ts, alpha = NULL, beta = NULL, gamma = NULL, seasonal = "multiplicative")

## data_hw
## data_hw$SSE


# alpha, beta, and gamma form x hat
# it still looks very noisy. Where is the noise coming from?
# noise is coming from level and season
# instead of just looking at fitted values, check the micro components driving the behavior

## plot(data_hw$fitted)
## plot(data_hw)

# extract the specific columns..such as level or seasonality 
# less columns since first columns were used to smooth/fit
# export fitted values into excel, plug into cusum and do analysis with c and t 
# at this point the data is broken into smoother pieces but no change detection has occured 
# assess the end result based on this smoother dataset

# d <- data_hw$fitted[,1]
d <- data_hw$fitted
View(d)

View(data_hw)

smooth_data <- matrix(data_hw$fitted[,4], nrow=123)
View(smooth_data)

## write.csv(smooth_data, file = "smoothed.csv", fileEncoding = "UTF-16LE")
## getwd()
