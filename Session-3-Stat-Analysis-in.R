##### Importing data #####
dataset <- read.csv("dataset.csv")
str(dataset)
summary(dataset)
# Also, import RSCH 620 data using File menu
# Then...
str(RSCH620data)

##### Descriptive Stats #####
summary(RSCH620data) # 5-number summaries, means
table(RSCH620data$sex1f2m) # Very basic frequency table
quantile(RSCH620data$AvgHR,.9) # 90th percentile
mean(RSCH620data$AvgHR); sd(RSCH620data$AvgHR) # M, SD
N <- length(RSCH620data$AvgHR) # Sample size saved as N
sum(RSCH620data$AvgHR) # Sum
sum(RSCH620data$AvgHR^2)-(sum(RSCH620data$AvgHR)^2)/N # Sum of Squares
22085.34/(N-1) # SS/(N-1) should equal the variance
var(RSCH620data$AvgHR) # Yep!

##### Inferential Stats #####

# I.S. t-test of sprints, comparing M and W
boxplot(dataset$sprints~dataset$gender,
        horizontal=T,
        main="Boxplot: Sprints by Gender",
        ylab="Gender",
        xlab="Sprints",
        col=5:6) # Color!

mean(dataset$sprints[1:50])   # women mean
sd(dataset$sprints[1:50])     # women SD
mean(dataset$sprints[51:100]) # men mean
sd(dataset$sprints[51:100])   # men SD

t.test(dataset$sprints~dataset$gender, var.equal=T)
barplot(c(mean(dataset$sprints[1:50]),
          mean(dataset$sprints[51:100])),
        ylim=c(0,9))
axis(1,at=c(.7,1.9),labels=c("Women","Men"), tick=F)
title("Sprints")
errorBars(.7,mean(dataset$sprints[1:50])-sd(dataset$sprints[1:50]),
          mean(dataset$sprints[1:50])+sd(dataset$sprints[1:50]))
errorBars(1.9,mean(dataset$sprints[51:100])-sd(dataset$sprints[51:100]),
          mean(dataset$sprints[51:100])+sd(dataset$sprints[51:100]))

# R.M. t-test of vertical jump pre vs. post intervention
boxplot(RSCH620data$VJ_pre_int,RSCH620data$VJ_post_int)

mean(RSCH620data$VJ_pre_int); sd(RSCH620data$VJ_pre_int)
mean(RSCH620data$VJ_post_int); sd(RSCH620data$VJ_post_int)

t.test(RSCH620data$VJ_post_int,RSCH620data$VJ_pre_int, paired=T)

# Correlation and regression
plot(RSCH620data$AvgTD,RSCH620data$AvgHR)
cor(RSCH620data$AvgTD,RSCH620data$AvgHR)
cor.test(RSCH620data$AvgTD,RSCH620data$AvgHR)

model1 <- lm(AvgHR~AvgTD, data=RSCH620data)
summary(model1)
abline(model1,col="red") # Adds line of best fit to scatterplot
hist(model1$residuals) # Are residuals normally distributed?

names(RSCH620data)
model2 <- lm(AvgHR~AvgTD+AvgSRPE, data=RSCH620data)
summary(model2) # Find model1 and model2 objects in Environment
str(model2)
hist(model2$residuals)

# Export regression coefficients table
summary(model2)$coefficients
round(summary(model2)$coefficients,3)
coeftable <- round(summary(model2)$coefficients,3)
write.csv(coeftable,"coeftable.csv")

# make a 3D scatterplot
install.packages("scatterplot3d") # Install
library("scatterplot3d") # Load
scatterplot3d(RSCH620data[,c(27:25)],
              pch = 16, color="steelblue")

##### Make and export descriptive stats table #####
names(RSCH620data) # Columns 28, 29, 30 are sprint speeds
m <- matrix(NA,nrow=3,ncol=5) # makes an empty 3x5 matrix
apply(RSCH620data[,28:30], 2, mean) # applies the function 'mean' to those columns
m[,1] <- apply(RSCH620data[,28:30],2,median)
m[,2] <- apply(RSCH620data[,28:30],2,mean)
m[,3] <- apply(RSCH620data[,28:30],2,sd)
m[,4] <- apply(RSCH620data[,28:30],2,min)
m[,5] <- apply(RSCH620data[,28:30],2,max)
n <- c("Preseason sprint speed (m/s)",
       "Midseason sprint speed (m/s)",
       "Postseason sprint speed (m/s)")
desctable <- as.data.frame(round(m,3),row.names=n)
names(desctable) <- c("Mdn","M","SD","Min","Max")
View(desctable)
write.csv(desctable,"desctable.csv")
