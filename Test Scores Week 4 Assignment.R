# Assignment: Test Scores
# Name: Koby-Hercsky, Theodore
# Date: 2021-04-07

# Use the appropriate R functions to answer the following questions:
View(scores)

# 1. What are the observational units in this study?
summary(Test_Score)
Test_Score
# Answer: observational units in this study are the course grades and the total points to compare them to the two sections to determine the students performance.

# 2. Identify the variables mentioned in the narrative paragraph and determine which are categorical and quantitative?
# Answer: The two variables Count and Section are known as categorical and Score is quantitative

# 3. Create one variable to hold a subset of your data set that contains only the Regular Section and one variable for the Sports Section.

Regular_Section <- scores[scores$Section == "Regular",]

Sports_Section <- scores[scores$Section == "Sports",]

# 4. Use the Plot function to plot each Sections scores and the number of students achieving that score. Use additional Plot Arguments to label the graph and give each axis an appropriate label. Once you have produced your Plots answer the following questions:
#Answer: plot function shows both regular and sports class section in different colors

ggplot(scores, aes(x = Count, y = Score, shape = 'color'))+geom_point(aes(color = Section))+theme(legend.position = "bottomright")+labs(title = "Legend")+labs(title = "Test Score Analysis")

# a. Comparing and contrasting the point distributions between the two section, looking at both tendency and consistency: Can you say that one section tended to score more points than the other? Justify and explain your answer.
# Answer: I will say that in the comparison in our plot function we see that in the Sports class we have higher scores with a lower count of student than we are seeing with the Regular class section. As we see a higher count in the 20s of students that received higher scores. 
# Answer: In conclusion Regular students had higher count of students that received higher scores than the Sports section.

# b. Did every student in one section score more points than every student in the other section? If not, explain what a statistical tendency means in this context.
# Answer: No every student in either section did not score more points than every student in the other section. As the mean in the regular section is 327.6 and the mean in sports is 307.4.

# c. What could be one additional variable that was not mentioned in the narrative that could be influencing the point distributions between the two sections? 
# Answer: Another variable that could influence the point between the two sections would be the time frame of the courses as one semester for the Regular section could have had one additional week while the Sports Section had one less week which would cause a difference in scores