# Install necessary packages
install.packages("tidyverse")
install.packages("readr")

# Load necessary libraries
library(tidyverse)
library(readr)

# Loading the Sample Dataset
data <- data.frame(
  name = c('Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank', 'Grace'),
  age = c(24, NA, 22, 29, 25, NA, 30),
  city = c('New York', 'Los Angeles', 'Chicago', NA, 'San Francisco', 'Seattle', 'Austin'),
  income = c(50000, 48000, NA, 53000, 45000, 55000, NA)
)

print(data)

# Removing Missing Data
## Exercise 1: Remove rows with missing data
data_cleaned <- na.omit(data)
print(data_cleaned)

## Exercise 2: Remove columns with missing data
data_cleaned <- data[, colSums(is.na(data)) == 0]
print(data_cleaned)

# Replacing Missing Data with Constructed Values
## Exercise 3: Replace missing values with a constant
data_filled <- data
data_filled[is.na(data_filled)] <- 0
print(data_filled)

## Exercise 4: Replace missing values using forward fill
data_filled <- data %>% fill(age:income, .direction = "down")
print(data_filled)

## Exercise 5: Replace missing values using backward fill
data_filled <- data %>% fill(age:income, .direction = "up")
print(data_filled)

## Exercise 6: Replace missing values with the mean
data_filled <- data
data_filled$age <- ifelse(is.na(data_filled$age), mean(data_filled$age, na.rm = TRUE), data_filled$age)
data_filled$income <- ifelse(is.na(data_filled$income), mean(data_filled$income, na.rm = TRUE), data_filled$income)
print(data_filled)

## Exercise 7: Replace missing values with the median
data_filled <- data
data_filled$age <- ifelse(is.na(data_filled$age), median(data_filled$age, na.rm = TRUE), data_filled$age)
data_filled$income <- ifelse(is.na(data_filled$income), median(data_filled$income, na.rm = TRUE), data_filled$income)
print(data_filled)

## Exercise 8: Replace missing values with the mode
mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

data_filled <- data
data_filled$age <- ifelse(is.na(data_filled$age), mode(data_filled$age), data_filled$age)
data_filled$income <- ifelse(is.na(data_filled$income), mode(data_filled$income), data_filled$income)
print(data_filled)
