require("ggplot2")
require("reshape")

data <- read.csv("C:/dev/trips/trips.csv", header=FALSE, sep=';', colClasses= c("integer","integer","character"))

data_car <- data[data$V3 == 'car', ]
data_subway <- data[data$V3 == 'subway', ]
data_walk <- data[data$V3 == 'walk', ]
data_bus <- data[data$V3 == 'bus', ]

hours <- c()
val <- 0
interval <- 3600
n <- 25
for (x in 1:n) {
  hours <- c(hours, val)
  val <- val + interval
}

time <- aggregate(data_car$V1, list(cut(data_car$V2, breaks=hours)), sum)
time$minute <- seq.int(nrow(time))
timeBus <- aggregate(data_bus$V1, list(cut(data_bus$V2, breaks=hours)), sum)
timeWalk <- aggregate(data_walk$V1, list(cut(data_walk$V2, breaks=hours)), sum)
timeSubway <- aggregate(data_walk$V1, list(cut(data_walk$V2, breaks=hours)), sum)
time$bus <- timeBus$x
time$walk <- timeWalk$x
time$subway <- timeSubway$x

drops <- c("Group.1", "minute")
time <- time[ , !(names(time) %in% drops)]

colnames(time) <- c("Car", "Bus", "Walk", "Subway")

# first we need to get Full.Time, PT.16, etc. into one column
df <- melt(time, .measure.vars=.(x,bus,walk))
df$minute <- seq.int(nrow(time))


df['value'] <- sapply(df['value'], function(x) as.numeric(x) / 1000)

png('C:/dev/trips/mode.png', width = 800, height = 800)
ggplot(df, aes(x = minute, y = value, fill = factor(variable))) +
  geom_bar(stat = "identity") + labs(x = "Hour", y="Trip Count (x1000)") +
  guides(fill=guide_legend(title="Travel Mode")) + scale_fill_brewer(palette="Set1")
  
dev.off()
