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

mr   <- movies$Rating
mrun <- movies$Runtime
plot(mr)       
pie(table(mr))

plot(x    = mrun,
     y    = rep(0, nrow(movies)),
     ylab = '',
     yaxt ='n')

boxplot(x    = mrun,
        xlab = 'Runtime (minutes)',
        horizontal = TRUE)

hist(mrun)
hist(mrun, xlab = 'Runtime (minutes)')
hist(mrun, 
     xlab = 'Runtime (minutes)',
     breaks = 30)


plot(density(mrun))
points(x=mrun,
       y=rep(-0.0005, nrow(movies)))


gg <- genres$Genre
gr <-  genres$Rating
spineplot(
    x = gg,
    y = gr,
    xlab = 'Genres',
    ylab = 'Ratings'
)

mosaicplot(
    x = table(gg, gr),
    las = 3
)

mbo <- movies$Box.Office
mcs <- movies$Critic.Score
plot(
    x=mrun,
    y=mbo
)

plot(
    x=mcs,
    y=mbo
)


plot(
    x = table(movies$Year),
    type = 'l'
)

tm <- tapply(mbo, mr, mean)
barplot(tm)

gbo <-  genres$Box.Office
gg  <-  genres$Genre
gm <- tapply(gbo, gg, mean)
barplot(gm)
barplot(gm, las = 3)
barplot(sort(gm,decreasing = TRUE), las=3)
plot(x=mr, y=mbo)
plot(movies)

plot(
    x = mr,
    main = 'Count of movies by Rating',
    xlab = 'Ratings',
    ylab = 'Count of Movies',
    col = '#b3e3e3'
)
