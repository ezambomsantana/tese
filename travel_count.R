require("ggplot2")

viagens <- c()
viagens$tipo <- c("Car",5058,"Bus",4029)
viagens$count <- c("Subway",3030,"Walk",6287)

df <- data.frame(matrix(unlist(viagens), nrow=4, byrow=T),stringsAsFactors=FALSE)

df['X2'] <- sapply(df['X2'], function(x) as.numeric(x))

png('c:/dev/travel_count.png')
theme_set(theme_gray(base_size = 18))
ggplot(data=df, aes(x=X1, y=X2, group=1)) +
  geom_bar(stat="identity", fill="#56B4E9") +
  xlab("Travel Mode") + ylab("Trips Count (x1000)")
dev.off()
