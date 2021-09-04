# Assignment: Housing Data Set
# Name: Koby-Hercsky, Theodore
# Date: 2021-04-07

#Use the apply function on a variable in your dataset
apply(Housing_data, 2, median)
#Answer: I used the apply function for my data frame Housing_data to extract each column as a vector that goes to the median that goes by the column.

#Use the aggregate function on a variable in your dataset
aggregate(Housing_data$Sale.Price ~ Housing_data$bedrooms , Housing_data, mean)
#Answer: used the aggregated function to find the mean price by the amount of bedrooms

#Use the plyr function on a variable in your dataset – more specifically, I want to see you split some data, perform a modification to the data, and then bring it back together
# Used the ddply function to split the housing data by the zip code and calculating the useless square feet of the lot that can not be lived in for each address. 
# Then combined the results back into the data set in order by each zip code
housing_unused_square_feet_by_zip <- ddply(Housing_data, .(zip5), transform,useless_sq_ft = sq_ft_lot - square_feet_total_living)
# As seen in this subset we have 40 observations for the zip code 98052
subset(housing_unused_square_feet_by_zip, zip5 == "98052")

#Check distributions of the data
ggplot(housing_unused_square_feet_by_zip, aes(x = square_feet_total_living, y = Sale.Price, shape = 'color'))+geom_point(aes(color = zip5))+theme(legend.position = "bottomright")+labs(title = "Legend")+labs(title = "Sale Price by Square Foot")
# The distribution in this plot suggests that most houses on this data set stayed in the square feet of 1,000 to 6,000 in square feet of living space and proceeded in a 90 degree angle. 
# Meaning the distribution of this data set shows an upward momentum that states as the square feet increases the sales price goes up

#Identify if there are any outliers
ggplot(housing_unused_square_feet_by_zip, aes(x = square_feet_total_living, y = Sale.Price, shape = 'color'))+geom_point(aes(color = zip5))+theme(legend.position = "bottomright")+labs(title = "Legend")+labs(title = "Sale Price by Square Foot")
# In this plot we see that we do have outliers that are located to the left and right of our plots as the square feet of total living goes up so should the price.
# Which the outliers are seen to be when the square feet goes up the price stays low or if the square feet is low the price sky rockets.
# These outliers are due to smaller houses being more expencive and in better areas or bigger houses that are in bad areas and need alot of work being why they are so cheap and an outlier. 

#Create at least 2 new variables
# added new variable to calculate the price per square foot by using the mutate function
mutate(Housing_data, price_per_square_foot = Sale.Price / square_feet_total_living)
# added new variable to calculate the price per bedroom by using the mutate function
mutate(Housing_data, price_per_bedroom = Sale.Price / bedrooms)