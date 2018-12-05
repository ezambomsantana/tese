require("ggplot2")
require(ggpubr)
data <- data.frame("Test" = c(20,40, 60, 80, 100), 
                   "Execution_Time" = c(82,243, 371,746,0), 
                   "SD" = c(4,10,25,0,0), 
                   "Memory" = c(0, 0, 0, 0,0),
                   "CPU" = c(0, 0, 0, 0,0),
                   "Cost" = c(0.472, 0.528, 0.59, 0.65,0.68),
                   "Total_Cost" = c(0.944, 1 , 2.64, 4.13,1),
                   "Output_Size" = c(82, 159, 241, 325, 392))


g1 <- ggplot(data=data, aes(x=Test, y=Execution_Time)) +
  geom_line() +
  geom_errorbar(aes(ymin=Execution_Time-SD, ymax=Execution_Time+SD), colour="black", width=.9) +
  labs(x="Test", y = "Execution Time")+
  scale_color_brewer(palette="Paired") +
  theme_minimal()+  theme(text = element_text(size=20))

g2 <- ggplot(data=data, aes(x=Test, y=Cost)) +
  geom_line() +
  labs(x="Test", y = "VM Cost")+
  scale_color_brewer(palette="Paired") +
  theme_minimal()+  theme(text = element_text(size=20))

g3 <- ggplot(data=data, aes(x=Test, y=Output_Size)) +
  geom_line() +
  labs(x="Test", y = "VM Cost")+
  scale_color_brewer(palette="Paired") +
  theme_minimal()+  theme(text = element_text(size=20))

png('/home/eduardo/dados.png', width = 800, height = 400)
ggarrange(g1, g2,g3,
          ncol = 2, nrow = 2)
dev.off()
