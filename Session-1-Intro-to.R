##### Preliminary stuff #####

# Commenting and uncommenting lines

# Basic math operations
2+2
10-18
15*4
100/2
2^3
2**3
13^2 ; 13**2 # Semicolon allows running two lines in one

# Parentheses matter (spaces, not so much)
7+1 / 4
(7+1) /     4

##### Object types in R #####
# Numeric
y <- 2
str(y) # Checks the structure of an object
5*y # Yep!
5y # Nope!

# Character strings
sentence <- "I live on Earth."
print(sentence)
str(sentence)
?sub
sub("Earth","Mercury",sentence)
sentence # Object 'sentence' still says "Earth"!
sentence <- sub("Earth","Mercury",sentence) # Overwrites sentence
sentence # Now we see it is saved with the word "Mercury"

# Lists (types: integer, numeric, character)
x1 <- 1:10
x2 <- 15:11
x3 <- c(9, 1, -10)
x4 <- c(y, sentence, x3)
str(x1) # Also look at x2, x3, x4 using 'str'
sort(x3)
sort(x3,decreasing=TRUE)
x1 + y  # Yep!
x1 + x2 # Yep, but let's unpack what happened here
x1 + x3 # Nah!
x1 + x4 # Not even close

# Logical operators
y > 2
y < 2
y == 2
if(y == 2){
  print(sentence)
} else {print("I live in the Springfield College Library.")}
x1 >= 5 # Greater or equal
x1 == 1 # Equal
x1 != 1 # Not equal

# Subsetting
x3 # Just to remind you
x3[3] # Third item in list x3
x3[x3 > 0] 
x3[!x3 > 0] # Exclamation point means "not"

##### Let's simulate some data #####
subject_id <- 1:100 # Later, we'll make this column 1

# Replicating values
?rep
rep("W",6) # Should return "W" six times
rep(c("W","M"),4)
rep(c("W","M"),each=4)
gender <- rep(c("W","M"),each=50) # This will be column 2

# Simulating normally distributed data
?rnorm
set.seed(01109)
w_sprints <- rnorm(50, mean=4.90, sd=4.17) # Based on De Lucia
m_sprints <- rnorm(50, mean=2.91, sd=2.88) # et al. (2024)

# Let's make them whole numbers,
# as in the number of sprints
w_sprints <- round(w_sprints)
m_sprints <- round(m_sprints)
table(w_sprints)
table(m_sprints)

# Let's make all of the sprint counts positive numbers
?abs
w_sprints <- abs(w_sprints)
m_sprints <- abs(m_sprints)

# Quick aside: next session will be
# all about visualizations
hist(w_sprints)
hist(m_sprints)

# Combine both lists of sprint observations into 
sprints <- c(w_sprints, m_sprints) # This will be column 3
dataset <- data.frame(subject_id=subject_id,
                      gender=gender,
                      sprints=sprints)
str(dataset)
summary(dataset)
table(dataset$gender)
head(dataset)
tail(dataset)
View(dataset)

# Exporting data to file
# First, set working directory
# (Show using Session menu)
write.csv(dataset,"dataset.csv",row.names=FALSE)
# Show how to import into SPSS
