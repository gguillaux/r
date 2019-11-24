# **********************************************
# UNIVARIATE ANALYSIS

# set working directory
cwd <- "~/dev/r/plst-eda-with-r"
setwd(cwd)

# load data
movies <- read.csv('Movies.csv', 
                   quote = "\"")

genres <- read.csv('Genres.csv', 
                   quote = "\"")

# inspect and validate
head(movies)
head(genres)

# create a frequency table
table(movies$Rating)
mr <- movies$Runtime
mean(mr)
median(mr)
summary(mr) # summary min mean median an max for the data

# get the mode for the most repeated runtime
which.max(table(mr))   # returns 90 min, index 27

min(mr)        # minimum value of the runtimes
max(mr)        # maximum value of the runtimes
range(mr)      # range with min and max
diff(range(mr)) # difference within min and max
quantile(mr)   # get quartiles of the series 
quantile(mr, 0.7) # get the interval that covers 70% of the data
IQR(mr)        # interquartile intervale. diff from 0.75 and 0.25 quartiles
var(mr)
sd(mr)


# install package moments
install.packages('moments')

# load package
library(moments)
moments::skewness(mr)  # check skeness . 0 = simetric, 1 = to right, -1 = to left
moments::kurtosis((mr))# check fatness of the skewness. 3 = normal, < 3 = flatter than normal, >3 = steeper than normal

# plot data
hist(mr)
plot(table(mr))
density((mr))
plot(density(mr))
# **********************************************

# BIVARIATE ANALYSIS

# create a sort of pivot table checking genres against rating
gr <- genres$Rating
gg <- genres$Genre

table(gg, gr)

# check covariance
mbo <- movies$Box.Office
mcs <- movies$Critic.Score
cov(mr, mbo)  # returns 381
cov(mcs, mbo) # returns 289, however we cannot say that runtime correlates better than critic score

# we need to obtain a correlation coefficient
# 1 = strong correlation, 0 = no correlation, -1 = inverse correlation
# CORRELATION DOESN'T MEANS CAUSATION
cor(mr, mbo)
cor(mcs, mbo)

# in bivariate analysis, to analyse a qualitative with a quantitative measure we can use tapply
mra <- movies$Rating
gbo <- genres$Box.Office
tapply(mbo, mra, mean) # will return average box office for each rating
tapply(gbo, gg, mean)

# summaries
summary(movies)
summary(genres)

