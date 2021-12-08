#' ---
#' title: " Class 05 Data Visualization"
#' author: "Hayoung Park (PID A15531571)"
#' output: github_document
#' ---

#Class 05 Data Visualization

#starting w/ a scatterplot
#before we can use it, we have to load it up and make sure it is installed
#install.packages("ggplot2")
library(ggplot2)

#try making a scatterplot
ggplot(data=cars) + aes(x=speed, y=dist) + geom_point()

#every ggplot has a data + aes + geoms
ggplot(data=cars) + aes(x=speed, y=dist) + geom_point() + geom_smooth()

#change to a linear model
p <- ggplot(data=cars) + aes(x=speed, y=dist) + geom_point() + geom_smooth(method="lm")

p + labs(title="My best plot")

p + labs(title="My best plot", x="Speed (MPH)", y="Distance (ft)")

#Gene expression data
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt" 
genes <- read.delim(url) 
head(genes)

#Q how to access one state
table( genes$State)

#Making a scatterplot of the new data
p <- ggplot(genes) + aes(x=Condition1, y=Condition2, col=State) + geom_point()

#Adding colors
p + scale_colour_manual( values=c("blue","gray","red") )

#Adding Labels
p + scale_colour_manual( values=c("blue","gray","red") ) + labs(title="Gene Expression Changes Upon Drug Treatment", x="Control (no drug)", y="Drug Treatment")

p + scale_colour_manual( values=c("light blue","gray","pink") ) + labs(title="Gene Expression Changes Upon Drug Treatment", x="Control (no drug)", y="Drug Treatment")

#optional stuff
install.packages("gapminder")
library(gapminder)

# File location online
url <- "https://raw.githubusercontent.com/jennybc/gapminder/master/inst/extdata/gapminder.tsv"

gapminder <- read.delim(url)

install.packages("dplyr")
library(dplyr)

gapminder_2007 <- gapminder %>% filter(year==2007)

#making another scatterplot
ggplot(gapminder_2007) + aes(x=gdpPercap, y=lifeExp) + geom_point()

#make points slightly transparent
ggplot(gapminder_2007) + aes(x=gdpPercap, y=lifeExp) + geom_point(alpha=0.5)

#color by continent/pop for #s
ggplot(gapminder_2007) + aes(x=gdpPercap, y=lifeExp, color=continent, size=pop) + geom_point(alpha=0.5)

#color by numbers
ggplot(gapminder_2007) + aes(x=gdpPercap, y=lifeExp, size=pop) + geom_point(alpha=0.8)

