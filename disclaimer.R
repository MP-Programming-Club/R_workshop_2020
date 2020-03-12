# Sample is your rangom range generator
# Here it gives 6 random numbers between 1 and 50

n = sample(1:50, 6)

# R has loads of in built data tables, like USArrests. Here we only take a sample of it based on n
dt = USArrests[n,]
dt

# For a summary of the data table (in terms of statistics)
summary(dt)

# For arithmetic across columns we reference a new column with $
dt$MurderPop = dt$Murder / dt$UrbanPop
dt$MurderPop

# Now, we plot a barchart
barplot(dt[,5])
# Putting a ? before a function gives you a help menu for the function
?barplot
barplot(dt[,1], names.arg = row.names(dt), main = 'Murders per Population by US State')
