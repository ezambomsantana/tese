require("ggplot2")

library(ggpubr)

data <- read.csv("c:/dev/events.xml", header=FALSE, sep=';', colClasses= c("integer","integer","integer","character","character","integer","integer","integer","integer","character"),)
data$V9 <- data$V9 * 60

data$type = "Real"
data$type2 = "Simulated"

real <- data.frame(data$V9, data$type, data$V10)
simulated <- data.frame(data$V7, data$type2,  data$V10)

colnames(simulated) <- c("time", "type", "mode")
colnames(real) <- c("time", "type", "mode")

total <- rbind(simulated, real) 

png('c:/dev/total.png')
p1 <- ggplot(total, aes(x = type, y = time)) +
  geom_boxplot(outlier.shape = NA)
p1 <- p1 + scale_x_discrete(name = "Travel Time") +
  scale_y_continuous(name = "Real X Simulated (All Travels)",limits = quantile(total$time, c(0.1, 0.9)))
p1
dev.off()

median(real$time)
median(simulated$time)


total_car <- total[total$mode == "car", ]
png('c:/dev/total_car.png')
p2 <- ggplot(total_car, aes(x = type, y = time)) +
  geom_boxplot(outlier.shape = NA)
p2 <- p2 + scale_x_discrete(name = "Travel Time") +
  scale_y_continuous(name = "Real X Simulated (Car Travels)",limits = quantile(total$time, c(0.1, 0.9)))
p2
dev.off()


median(total_car[total_car$type == "Simulated",]$time)
median(total_car[total_car$type == "Real",]$time)


total_walk <- total[total$mode == "walk", ]
png('c:/dev/total_walk.png')
p3 <- ggplot(total_walk, aes(x = type, y = time)) +
  geom_boxplot(outlier.shape = NA)
p3 <- p3 + scale_x_discrete(name = "Travel Time") +
  scale_y_continuous(name = "Real X Simulated (Walk Travels)",limits = quantile(total$time, c(0.1, 0.9)))
p3
dev.off()

mean(total_walk[total_walk$type == "Simulated",]$time)
mean(total_walk[total_walk$type == "Real",]$time)

total_subway <- total[total$mode == "metro", ]
png('c:/dev/total_subway.png')
p4 <- ggplot(total_subway, aes(x = type, y = time)) +
  geom_boxplot(outlier.shape = NA)
p4 <- p4 + scale_x_discrete(name = "Travel Time") +
  scale_y_continuous(name = "Real X Simulated (Subway Travels)",limits = quantile(total$time, c(0.1, 0.9)))
p4
dev.off()


mean(total_subway[total_subway$type == "Simulated",]$time)
mean(total_subway[total_subway$type == "Real",]$time)

total_bus <- total[total$mode == "bus", ]
png('c:/dev/total_bus.png')
p5 <- ggplot(total_bus, aes(x = type, y = time)) +
  geom_boxplot(outlier.shape = NA)
p5 <- p5 + scale_x_discrete(name = "Travel Time") +
  scale_y_continuous(name = "Real X Simulated (Bus Travels)",limits = quantile(total$time, c(0.1, 0.9)))
p5
dev.off()

theme_set(theme_gray(base_size = 18))
png('c:/dev/total_car_walk.png', width = 800, height = 400)

ggarrange(p2, p3,
          labels = c("a)", "b)"),
          ncol = 2, nrow = 1)
dev.off()

theme_set(theme_gray(base_size = 18))
png('c:/dev/total_bus_sybway.png', width = 800, height = 400)

ggarrange(p4, p5,
          labels = c("a)", "b)"),
          ncol = 2, nrow = 1)
dev.off()
