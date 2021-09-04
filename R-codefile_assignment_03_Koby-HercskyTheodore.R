# Assignment: ASSIGNMENT 3
# Name: Koby-Hercsky, Theodore
# Date: 2021-04-18

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/home/downloads/DSC520/dsc520")

## Load the `data/r4ds/heights.csv` to
heights <- read_csv("Downloads/DSC520/dsc520/data/r4ds/heights.csv")

## Using `geom_point()` create three scatterplots for

## `height` vs. `earn`
ggplot(heights_df, aes(x=height, y=earn)) + geom_point(aes(color=sex))

## `age` vs. `earn`
ggplot(heights_df, aes(x=age, y=earn)) + geom_point(aes(color=race))

## `ed` vs. `earn`
ggplot(heights_df, aes(x=ed, y=earn)) + geom_point(aes(alpha=age))

## Re-create the three scatterplots and add a regression trend line using
## the `geom_smooth()` function

## `height` vs. `earn`
ggplot(heights_df, aes(x=height, y=earn)) + geom_point(aes(color=sex)) + geom_smooth(orientation = "x")

## `age` vs. `earn`
ggplot(heights_df, aes(x=age, y=earn)) + geom_point(aes(color=race)) + geom_smooth(span = 0.5)

## `ed` vs. `earn`
ggplot(heights_df, aes(x=ed, y=earn)) + geom_point(aes(alpha=age)) + geom_smooth(se = FALSE, method = lm)

## Create a scatterplot of `height`` vs. `earn`.  Use `sex` as the `col` (color) attribute
ggplot(heights_df, aes(x=height, y=earn, col=sex)) + geom_point(aes(alpha=age))

## Using `ggtitle()`, `xlab()`, and `ylab()` to add a title, x label, and y label to the previous plot
## Title: Height vs. Earnings
## X label: Height (Inches)
## Y Label: Earnings (Dollars)
ggplot(heights_df, aes(x=height, y=earn, col=sex)) + geom_point(aes(alpha=age)) + ggtitle("Height vs. Earnings") + xlab("Height (Inches)") + ylab("Earnings (Dollars)")


## Create a histogram of the `earn` variable using `geom_histogram()`
ggplot(heights_df, aes(earn)) + geom_histogram(binwidth = 50000)

## Create a histogram of the `earn` variable using `geom_histogram()`
## Use 10 bins
ggplot(heights_df, aes(earn)) + geom_histogram(bins = 10)


## Create a kernel density plot of `earn` using `geom_density()`
ggplot(heights_df, aes(earn)) + geom_density(kernel = "gaussian")

# Assignment: 2014 American Community Survey Data # Name: Koby-Hercsky, Theodore
# Date: 2021-04-18

#Please provide the output from the following functions: str(); nrow(); ncol() 

str(acs_14_1yr_s0201)

nrow(acs_14_1yr_s0201)
# [1] 136

ncol(acs_14_1yr_s0201) 
# [1] 8

# Create a Histogram of the HSDegree variable using the ggplot2 package.
# Set a bin size for the Histogram.
# Include a Title and appropriate X/Y axis labels on your Histogram Plot.

hist.HSDegree <- ggplot(acs_14_1yr_s0201, aes(HSDegree)) + geom_histogram(bins = 100) + ggtitle("High School Degree") + xlab("HSDegree (percent)")

# Include a normal curve to the Histogram that you plotted.
hist.HSDegree + stat_function(fun = dnorm, args = list(mean = mean(acs_14_1yr_s0201$HSDegree, na.rm = TRUE), sd = sd(acs_14_1yr_s0201$HSDegree, na.rm = TRUE)), colour = "black", size = 1)

# Create a Probability Plot of the HSDegree variable.
ggplot(acs_14_1yr_s0201, aes(HSDegree)) + geom_density(aes(HSDegree), fill="grey50") + ggtitle("High School Degree") + xlab("HSDegree (percent)")

# Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.
stat.desc(acs_14_1yr_s0201, basic=TRUE, desc=TRUE, norm=FALSE, p=0.95) 

stat.desc(acs_14_1yr_s0201$HSDegree, basic=FALSE, norm=TRUE)
