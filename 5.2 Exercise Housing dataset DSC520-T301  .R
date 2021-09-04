# Assignment: 5.2 Exercise Housing dataset
# Name: Koby-Hercsky, Theodore
# Date: 2021-04-13

# Using the dplyr package, use the 6 different operations to analyze/transform the data - GroupBy, Summarize, Mutate, Filter, Select, and Arrange – Remember this isn’t just modifying data, you are learning about your data also – so play around and start to understand your dataset in more detail
# 1. GroupBy
Updated_Housing_Dataset %>% group_by(zip5) %>% tally()
# 2. Summarize
Updated_Housing_Dataset %>% group_by(zip5) %>% summarize(Mean_Price = mean(Sale.Price, na.rm = TRUE))
# 3. Mutate 
Price_Per_square_feet_housingdata <- mutate(Updated_Housing_Dataset, price_per_square_foot = Sale.Price / square_feet_total_living)
# 4. Filter
zipcode_Housing_Data <- filter(Updated_Housing_Dataset, zip5 == 98053)
# 5. Select 
Updated_Housing_Dataset <- select(Housing_dataset, Sale.Price, zip5, square_feet_total_living, bedrooms, bath_full_count, bath_half_count, sq_ft_lot)
# 6. Arrange
Housing_Data_By_Price <- Updated_Housing_Dataset %>% arrange(desc(Sale.Price), .by_group = FALSE)

# Using the purrr package – perform 2 functions on your dataset.  You could use zip_n, keep, discard, compact, etc.
# 1. Keep 
Mean_Keep_Housing_data_set <- Updated_Housing_Dataset %>% keep(~ mean(.x) > 600)
# 2. Discard
Discard_Housingdata <- Updated_Housing_Dataset %>% discard(~ sum(.x) > 1000000)
# Use the cbind and rbind function on your dataset
# cbind
Cbind_Housing <- cbind(zipcode_house, Price_Housing_Dataset, Discard_Housingdata)
# rbind
rbind_ZipHousing <- rbind(zipcode_98052_Housing_Data, zipcode_98053_Housing_Data)

# Split a string, then concatenate the results back together
Year_sold <- str_split(string = Housing_data$Sale.Date, pattern = "-")

