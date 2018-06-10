require("ggplot2")

data <- read.csv("/home/eduardo/esta/events.xml", header=FALSE, sep=';', colClasses= c("integer","integer","integer","character","character","integer","integer","integer"),)

simulated <- read.csv("/home/eduardo/esta/trips_walk.csv", header=FALSE, sep=';', colClasses= c("integer"),)



data$type = "Real"
simulated$type = "Simulated"


simulated$V1 <- simulated$V1 * 60
real <- data.frame(data$V7, data$type)

colnames(simulated) <- c("time", "type")
colnames(real) <- c("time", "type")

total <- rbind(simulated, real) 


p10 <- ggplot(total, aes(x = type, y = time)) +
  geom_boxplot(outlier.shape = NA)
p10 <- p10 + scale_x_discrete(name = "Travel Time") +
  scale_y_continuous(name = "Real X Simulated",limits = quantile(total$time, c(0.1, 0.9)))
p10
