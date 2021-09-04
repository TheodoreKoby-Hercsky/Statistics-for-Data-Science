# Assignment: 2014 American Community Survey Data
# Name: Koby-Hercsky, Theodore
# Date: 2021-03-31

# What are the elements in your data (including the categories and data types)?

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

#Answer the following questions based on the Histogram produced:
#  Based on what you see in this histogram, is the data distribution unimodal? 
# answer: Yes from what is seen on this Histogram we see a single peak which justifies a unimodal distribution
#  Is it approximately symmetrical?
# answer: No this is not approximately symmetrical as if a line is drawn at the peak it would not mirror the right and left side
#  Is it approximately bell-shaped?
# answer: Yes it can be considered bell-shaped as it has a prominent mound but is skewed to the left and is unimodal
#  Is it approximately normal?
# answer: No this histogram is left-skewed 
#  If not normal, is the distribution skewed? If so, in which direction?
# answer: Yes the distribution is skewed to the left as this indicates the peak is to the right of the center.
#  Include a normal curve to the Histogram that you plotted.
hist.HSDegree + stat_function(fun = dnorm, args = list(mean = mean(acs_14_1yr_s0201$HSDegree, na.rm = TRUE), sd = sd(acs_14_1yr_s0201$HSDegree, na.rm = TRUE)), colour = "black", size = 1)
#Explain whether a normal distribution can accurately be used as a model for this data.
# answer: No a normal distribution could not be used to model this data accurately as our data is skewes to the left.

# Create a Probability Plot of the HSDegree variable.
ggplot(acs_14_1yr_s0201, aes(HSDegree)) + geom_density(aes(HSDegree), fill="grey50") + ggtitle("High School Degree") + xlab("HSDegree (percent)")
# Answer the following questions based on the Probability Plot:
#Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
# Answer: No the distribution is not normal as it is skewed to the left and a normal plot indicates that this probability plot is not normally distributed.
#If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
# Answer: Yes this distribution is skewed to the left due to the peak being to the right of the center

# Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.
stat.desc(acs_14_1yr_s0201, basic=TRUE, desc=TRUE, norm=FALSE, p=0.95)
stat.desc(acs_14_1yr_s0201$HSDegree, basic=FALSE, norm=TRUE)
# In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. In addition, explain how a change in the sample size may change your explanation?
# Answer: Seen in the results produced for the skew of the HSDegree we see that the skewness is at -1.674767e+00 and skew.2SE is -4.030254e+00 that shows the measurement of the asymmetry of the distribution of the HSDegree data set that is negatively skewed and with the majority of data values greater than mean.
# Answer: Seen in the results produced for the kurtosis of the HSDegree we see that it is 4.352856e+00 and kurt. 2SE is 5.273885e+00 that measures the sharpness of the peak in the data distribution as the HSDegree is Leptokurtic as it is greater than 3 so it shows a sharp peak on the graph.
# Answer: The Z-Score is calculated by subtracting the mean of the distribution and then divide by the standard deviation of the distribution such as the standard error. This is calculated by -1.674767e+00 - 0 / 5.117941e+00 = -0.327234 meaning that the z-score is negative so its' corresponding raw score is below the mean. 