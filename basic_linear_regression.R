# cars is another pre-loaded data table
dt = cars
head(dt)

# To find properties like the mean and standard deviation, refer to these functions
mean(dt$speed)
sd(dt$speed)

# The $ references specific columns in a data table
# With :, you can refer to items in columns by index
dt[1:5,1]

# It's simple to plot a data table like this
plot(dt)
# If we want to fit this data with a model, we do this for a linear fit
fit = lm(dist~speed, dt)
abline(fit)

# We can retrieve stats for our model fit, like the r squared value, like this
summary(fit)$r.squared

# To improve our fit, we can do an outlier removal
residuals = abs(fit$residuals)

# Now establish a while loop that can remove values iteratively until our r squared value improves to 0.75
n = 0
while((summary(fit)$r.squared)<0.75)
  {
  dt = dt[which(residuals != max(residuals)),]
  fit = lm(dist~speed, data = dt)
  residuals = abs(fit$residuals)
  n=n+1
  }

# We we replot the line and new r squared
plot(dt)
abline(fit, col = 'red')

# And lastly, printing our results
cat("Number of outliers removed = ",n, "\nNew r squared value = ",summary(fit)$r.squared)


