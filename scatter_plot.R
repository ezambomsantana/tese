require("ggplot2")

data <- read.csv("/home/eduardo/esta/events.xml", header=FALSE, sep=';', colClasses= c("integer","integer","integer","character","character","integer","integer","integer","integer","character"),)

car_data <- data[data$V10 == "car", ]
car_data$velocidade <- (car_data$V8/car_data$V7) * 3.6
car_data <- data.frame(car_data$V7, car_data$V8,  car_data$V3, car_data$V10,car_data$velocidade )

colnames(car_data) <- c("Time", "Distance", "Hour","Mode", "Speed")
png(file = "scatterplot_matrices.png")

pairs(~tempo+distancia+hora,data = car_data, main = "Scatterplot Matrix")

dev.off()


library(car)
library(RColorBrewer)

# Make the plot
png('scatter_car.png')
  pairs(~Time+Distance+Hour+Speed, data=car_data,main="Vehicles Travels Variables")
dev.off()

walk_data <- data[data$V10 == "walk", ]
walk_data <- data.frame(walk_data$V7, walk_data$V8,  walk_data$V3, walk_data$V10 )
colnames(walk_data) <- c("Time", "Distance", "Hour","Mode" )

# Make the plot
png('scatter_walk.png')
pairs(~Time+Hour+Distance, data=walk_data,main="Walk Travels Variables")
dev.off()


bus_data <- data[data$V10 == "bus", ]
bus_data <- data.frame(bus_data$V7, bus_data$V8,  bus_data$V3, bus_data$V10 )
colnames(bus_data) <- c("Time", "Distance", "Hour","Mode" )

# Make the plot
png('scatter_bus.png')
pairs(~Time+Hour, data=bus_data,main="Bus Travels Variables")
dev.off()


subway_data <- data[data$V10 == "subway", ]
subway_data <- data.frame(subway_data$V7, subway_data$V8,  subway_data$V3, subway_data$V10 )
colnames(subway_data) <- c("Time", "Distance", "Hour","Mode" )

# Make the plot
png('scatter_subway.png')
pairs(~Time+Hour, data=subway_data,main="Subway Travels Variables")
dev.off()
