require("ggplot2")
require(ggpubr)
data <- data.frame("Test" = c(20,40, 60, 80, 100), 
                   "Execution_Time" = c(82,243, 371,552,722), 
                   "SD" = c(10,22,30,55,60), 
                   "Memory" = c(22.4, 35.5, 49.7, 65.7,78),
                   "Memory_SD" = c(1, 1, 2, 2,3),
                   "CPU" = c(68, 65, 61, 54,50),
                   "CPU_SD" = c(0, 1, 2, 1,2),
                   "Cost" = c(0.472, 0.528, 0.59, 0.65,0.68),
                   "Total_Cost" = c(0.944, 2.6 , 4.13, 6.5,8.84),
                   "Output_Size" = c(82, 159, 241, 325, 392))


g1 <- ggplot(data=data, aes(x=Test, y=Execution_Time)) +
  geom_line() +
  geom_errorbar(aes(ymin=Execution_Time-SD, ymax=Execution_Time+SD), colour="black", width=.9) +
  labs(x="Test", y = "Execution Time")+
  scale_color_brewer(palette="Paired") +
  theme_minimal()+  theme(text = element_text(size=20))

g2 <- ggplot(data=data, aes(x=Test, y=Memory)) +
  geom_line() +
  geom_errorbar(aes(ymin=Memory-Memory_SD, ymax=Memory+Memory_SD), colour="black", width=.9) +
  labs(x="Test", y = "Memory")+
  scale_color_brewer(palette="Paired") +
  theme_minimal()+  theme(text = element_text(size=20))

g3 <- ggplot(data=data, aes(x=Test, y=CPU)) +
  geom_line() +
  geom_errorbar(aes(ymin=CPU-CPU_SD, ymax=CPU+CPU_SD), colour="black", width=.9) +
  labs(x="Test", y = "CPU (%)")+
  scale_color_brewer(palette="Paired") +
  theme_minimal()+  theme(text = element_text(size=20))


g4 <- ggplot(data=data, aes(x=Test, y=Output_Size)) +
  geom_line() +
  labs(x="Test", y = "Output Size (MB)")+
  scale_color_brewer(palette="Paired") +
  theme_minimal()+  theme(text = element_text(size=20))

g5 <- ggplot(data=data, aes(x=Test, y=Cost)) +
  geom_line() +
  labs(x="Test", y = "VM Cost (per Hour)")+
  scale_color_brewer(palette="Paired") +
  theme_minimal()+  theme(text = element_text(size=20))


g6 <- ggplot(data=data, aes(x=Test, y=Total_Cost)) +
  geom_line() +
  labs(x="Test", y = "Total Cost")+
  scale_color_brewer(palette="Paired") +
  theme_minimal()+  theme(text = element_text(size=20))


png('c:/dev/dados.png', width = 800, height = 800)
ggarrange(g1, g2,g3,g4,g5,g6,
          ncol = 2, nrow = 3)
dev.off()
