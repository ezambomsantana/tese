require("ggplot2")
require("reshape2")

data <- read.csv("c:/dev/experiment40.txt",header=FALSE,  sep=',', col.names = c("V1", "V2", "Memory", "CPU"), colClasses= c("integer","character","double","double"))


data$V1 <- NULL
data$V2 <- NULL
data$minute <- seq.int(nrow(data))

test_data_long <- melt(data, id="minute")

png('c:/dev/experiment40.png', width = 800, height = 400)
ggplot(data=test_data_long, aes(x=minute, y=value, colour=variable)) +
  geom_line() +
  labs(x="Simulation Time (m)", y = "Resourses Usage (%)")+
  scale_color_brewer(palette="Paired") +
  theme_minimal()
dev.off()
