require("ggplot2")
require("reshape")

data <- read.csv("/home/eduardo/buses.txt", header=TRUE, sep=';', colClasses= c("integer","character","character","character","character","character","character"
                                                                                 ,"character","character","character","character","character","character"
                                                                                 ,"character","character","character","character","character","character"
                                                                                 ,"character","character"))

buses <- aggregate(data.frame(count = data$trip_id), list(value = data$trip_id), length)

mean(buses$count)
min(buses$count)
max(buses$count)

stops <- aggregate(data.frame(count = data$stop_id), list(value = data$stop_id), length)
mean(stops$count)
min(stops$count)
max(stops$count)
