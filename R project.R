# Step 1: Install and load necessary libraries
install.packages("ggplot2")  # For data visualization
install.packages("dplyr")    # For data manipulation
install.packages("corrplot") # For correlation plot

library(ggplot2)
library(dplyr)
library(corrplot)

# Step 2: Load the dataset
# You can replace this with your dataset from Kaggle or UCI
data(iris)  # Loading the Iris dataset

# Step 3: View basic information and summary of the dataset
head(iris)           # First few rows of the dataset
summary(iris)        # Summary statistics for each variable
str(iris)            # Structure of the dataset (data types)

# Step 4: Check for missing values
sum(is.na(iris))     # Check if there are any missing values

# Step 5: Visualize the distribution of variables

# Histogram for each numeric variable
ggplot(iris, aes(x = Sepal.Length)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  ggtitle("Distribution of Sepal Length")

ggplot(iris, aes(x = Sepal.Width)) +
  geom_histogram(bins = 30, fill = "green", color = "black") +
  ggtitle("Distribution of Sepal Width")

ggplot(iris, aes(x = Petal.Length)) +
  geom_histogram(bins = 30, fill = "orange", color = "black") +
  ggtitle("Distribution of Petal Length")

ggplot(iris, aes(x = Petal.Width)) +
  geom_histogram(bins = 30, fill = "purple", color = "black") +
  ggtitle("Distribution of Petal Width")

# Step 6: Check for outliers using boxplots

# Boxplot for each numeric variable
ggplot(iris, aes(x = "", y = Sepal.Length)) +
  geom_boxplot(fill = "lightblue") +
  ggtitle("Boxplot of Sepal Length")

ggplot(iris, aes(x = "", y = Sepal.Width)) +
  geom_boxplot(fill = "lightgreen") +
  ggtitle("Boxplot of Sepal Width")

ggplot(iris, aes(x = "", y = Petal.Length)) +
  geom_boxplot(fill = "lightcoral") +
  ggtitle("Boxplot of Petal Length")

ggplot(iris, aes(x = "", y = Petal.Width)) +
  geom_boxplot(fill = "lightpink") +
  ggtitle("Boxplot of Petal Width")

# Step 7: Scatter plot to visualize relationships between variables

# Scatter plot between Sepal.Length and Sepal.Width
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3) +
  ggtitle("Sepal Length vs Sepal Width") +
  theme_minimal()

# Scatter plot between Petal.Length and Petal.Width
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(size = 3) +
  ggtitle("Petal Length vs Petal Width") +
  theme_minimal()

# Step 8: Visualize correlation between numeric variables
cor_matrix <- cor(iris[,1:4])  # Correlation matrix (exclude Species, which is non-numeric)
corrplot(cor_matrix, method = "circle")

# Step 9: Pair plot for visualizing relationships between all numeric variables
pairs(iris[1:4], main = "Pair plot of Iris dataset", pch = 21, bg = c("red", "green3", "blue")[unclass(iris$Species)])

# Step 10: Interpretation and conclusion
# From the visualizations:
# 1. Petal.Length and Petal.Width are strongly correlated.
# 2. The Sepal.Length variable has a fairly normal distribution, but Sepal.Width shows a slight skew.
# 3. Outliers can be seen in Sepal.Width from the boxplot.
