# import ggplot2
require(ggplot2)

wd        <- "~/dev/r/exploring-data-visually-r"
setwd(wd)

# set variable for the diamond prices
dp <-  diamonds$price

# ========================================
# charts using rbase
hist(dp)
hist(dp, breaks = 10)
hist(dp, freq = F)

# ========================================
# charts with lattice
require(lattice)
lattice::histogram(~ price, diamonds)
lattice::histogram(~ price, diamonds, breaks = 30)
# histograms accross different categorical variables on top of price
lattice::histogram(~ price | cut, diamonds)

# plot density plots
# plot one graph for each category
lattice::densityplot(~ price | cut, 
                     data = diamonds,
                     plot.points = F,
                     ref = T)

# plot all categories in one plot
lattice::densityplot(~ price,
                     data   = diamonds,
                     groups = cut,
                     plot.points = F,
                     ref = T,
                     auto.key = list(columns = 3))


# ========================================
# plotting with ggplot2
# histogram
ggplot(diamonds, aes(x = price)) + 
    ggplot2::geom_histogram()

# density
ggplot(diamonds, aes(x = price)) + 
    ggplot2::geom_density()

# both combined
ggplot(diamonds, aes(x = price)) +
    ggplot2::geom_histogram(
        aes(y = ..density..),
        binwidth = 1000,
        colour   = "black",
        fill     = "white") +
    ggplot2::geom_density(
        alpha = .25,
        fill  = "#FF6666" )

