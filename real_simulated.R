require("ggplot2")

data <- read.csv("/home/eduardo/esta/events.xml", header=FALSE, sep=';', colClasses= c("integer","integer","integer","character","character","integer","integer","integer","integer","character"),)
data$V9 <- data$V9 * 60

data$type = "Real"
data$type2 = "Simulated"

real <- data.frame(data$V9, data$type, data$V10)
simulated <- data.frame(data$V7, data$type2,  data$V10)

colnames(simulated) <- c("time", "type", "mode")
colnames(real) <- c("time", "type", "mode")

total <- rbind(simulated, real) 

png('total.png')
  p10 <- ggplot(total, aes(x = type, y = time)) +
    geom_boxplot(outlier.shape = NA)
  p10 <- p10 + scale_x_discrete(name = "Travel Time") +
    scale_y_continuous(name = "Real X Simulated (All Travels)",limits = quantile(total$time, c(0.1, 0.9)))
  p10
dev.off()


total_car <- total[total$mode == "car", ]
png('total_car.png')
  p10 <- ggplot(total_car, aes(x = type, y = time)) +
    geom_boxplot(outlier.shape = NA)
  p10 <- p10 + scale_x_discrete(name = "Travel Time") +
    scale_y_continuous(name = "Real X Simulated (Car Travels)",limits = quantile(total$time, c(0.1, 0.9)))
  p10
dev.off()


total_walk <- total[total$mode == "walk", ]
png('total_walk.png')
  p10 <- ggplot(total_walk, aes(x = type, y = time)) +
    geom_boxplot(outlier.shape = NA)
  p10 <- p10 + scale_x_discrete(name = "Travel Time") +
    scale_y_continuous(name = "Real X Simulated (Walk Travels)",limits = quantile(total$time, c(0.1, 0.9)))
  p10
dev.off()

total_subway <- total[total$mode == "metro", ]
png('total_subway.png')
  p10 <- ggplot(total_subway, aes(x = type, y = time)) +
    geom_boxplot(outlier.shape = NA)
  p10 <- p10 + scale_x_discrete(name = "Travel Time") +
    scale_y_continuous(name = "Real X Simulated (Subway Travels)",limits = quantile(total$time, c(0.1, 0.9)))
  p10
dev.off()

total_bus <- total[total$mode == "bus", ]
png('total_bus.png')
  p10 <- ggplot(total_bus, aes(x = type, y = time)) +
    geom_boxplot(outlier.shape = NA)
  p10 <- p10 + scale_x_discrete(name = "Travel Time") +
    scale_y_continuous(name = "Real X Simulated (Bus Travels)",limits = quantile(total$time, c(0.1, 0.9)))
  p10
dev.off()

