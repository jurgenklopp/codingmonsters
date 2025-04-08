##### Importing data #####
dataset <- read.csv("dataset.csv")
str(dataset)
summary(dataset)
# Also, import RSCH 620 data using File menu
# Then...
str(RSCH620data)
summary(RSCH620data)

##### Visualizations #####

# Histograms
table(RSCH620data$Ex)
hist(RSCH620data$Ex)
# The default breaks are often not ideal
?seq
x <- seq(1.5, 4.1, .2)
hist(RSCH620data$Ex,breaks=x)
# Better, but I'm still not a fan of
# the x-axis or main title
?hist
hist(RSCH620data$Ex,breaks=x,
     axes=F,main="",xlab="")
axis(1,seq(1.6, 4.0, .2))
axis(2)
title(main="Histogram: ABQ Exhaustion Subscale",
      xlab="Subscale Mean")
text(2.4, 32, "Mode = 2.8",cex=.7)

# Box plots
boxplot(RSCH620data$Ex)
title(main="Boxplot: ABQ Exhaustion Subscale",
      ylab="Subscale Mean")
# Let's look at sprints, comparing M and W
boxplot(dataset$sprints~dataset$gender)
boxplot(dataset$sprints~dataset$gender,
        horizontal=T)
boxplot(dataset$sprints~dataset$gender,
        horizontal=T,
        main="Boxplot: Sprints by Gender",
        ylab="Gender",
        xlab="Sprints",
        col=3:4) # Color!

# Bar graphs
table(RSCH620data$year)
barplot(table(RSCH620data$year))

# Building a plot from scratch
x <- 1999:2009
y1 <- c(110,102,102,98,85,95,96,98,122,94,101)
y2 <- c(2,2,2,3,1,1,2,3,4,1,4)
par(mar=c(4,4,2,4), cex = 0.7)
plot.new()
plot.window(range(x), c(0, 6))
lines(x, y2)
points(x, y2, pch=21, bg="black", cex=2)
axis(4)
par(new=TRUE)
plot.window(range(x), c(80,140))
lines(x, y1, col="red")
points(x, y1, pch=21, bg="red", col="red", cex=2)
mtext("Year", side=1, line=2, cex=0.8)
mtext("Swimming Pool Drownings", side=2, line=2, las=0, cex=0.8)
mtext("Nicholas Cage Films", side=4, line=2, las=0, cex=0.8)
axis(1,1999:2009)
axis(2)
mtext("Correlation between Drowning and N.C. Films",side=3)
legend(1999,140,
       c("Drownings","N.C. Films"),
       fill=c("red","black"),
       horiz = TRUE)

# Scatter plots (more next time)
cor(RSCH620data$AvgHR,RSCH620data$AvgTD)
plot(RSCH620data$AvgHR,RSCH620data$AvgTD)

##### Random assignment etc. #####
?sample
sample(1:50,size=25)
sample(c("Control","Intervention"),size=1)

# Next time...
# Descriptive and Inferential stats
# Visualizations for specific results
  # Scatter with regression line
  # Bar graph with error bars
# Exporting tables, e.g.,
  # Regression table
  # Descriptive statistics table