#install.packages('caret')
#install.packages('ellipse')
#install.packages('e1071')

# Here we import these installed libraries
library('caret')
library('ellipse')
library('e1071')

# We need a few packages for this exercise which we install above
# Now, we refer to another pre-loaded data table called iris
dt = iris
head(dt)

# We can inquire about the class in this tables
class(dt$class)

# Species is a factor here, but what about labels
levels(dt$Species)

# And to see how many entries in each
summary(dt$Species)

# For the probabilities that a row belongs to each factor
prop.table(table(dt$Species)) * 100

# Remember to check the other columns
summary(dt[,1:4])

# The good thing is this data is clean already
# We can go straight to visualisation then
featurePlot(x=dt[,1:4], y=dt$Species, plot="ellipse")

# Suppose we want to built a model to start making predictions with this data
# To do this, we need to split the data into test data and training data
index = createDataPartition(dt$Species, p = 0.66, list = FALSE)
train = dt[index,]
test = dt[-index,]

# Let's model. There are a lot of models to choose from, but here we do a nearest neighbour analysis
Fit <- train(Species ~ ., data = train, method = "knn")
Fit

# It is prudent to test the model now to see how well it makes predictions
Predict <- predict(Fit, newdata = test)

# And now we verify the accuracy of our productions
confusionMatrix(Predict, test$Species)
