import pandas as pd
import matplotlib.pyplot as plt

test = [20,40, 60, 80, 100,120] 
execution_time = [82,243, 371,552,722,920]
execution_time_sd = [10,22,30,55,60, 67]
memory = [22.4, 35.5, 49.7, 65.7,78,98]
memory_sd = [1, 1, 2, 2,3, 3]
cpu = [68, 65, 61, 54,50, 46]
cpu_sd = [0, 1, 2, 1,2,3]
total_cost = [0.944, 2.6 , 4.13, 6.5,8.84,13]

df = pd.DataFrame(list(zip(test, execution_time, execution_time_sd, memory, memory_sd, cpu, cpu_sd, total_cost)),  
                columns =['test', 'execution_time', 'execution_time_sd','memory','memory_sd','cpu', 'cpu_sd', 'total_cost']) 

fig, axes = plt.subplots(nrows=2, ncols=2)

df.plot.line(ax=axes[0, 0], x = "test", y = "execution_time", yerr = "execution_time_sd")
axes[0, 0].set_xlabel('Test', fontsize=13)
axes[0, 0].set_ylabel('Execution Time (min)', fontsize=13)

df.plot.line(ax=axes[0, 1], x = "test", y = "memory", yerr = "memory_sd")
axes[0, 1].set_xlabel('Test', fontsize=13)
axes[0, 1].set_ylabel('Memory used (GB)', fontsize=13)


df.plot.line(ax=axes[1, 0], x = "test", y = "cpu", yerr = "cpu_sd")
axes[1, 0].set_xlabel('Test', fontsize=13)
axes[1, 0].set_ylabel('CPU (%)', fontsize=13)


df.plot.line(ax=axes[1, 1], x = "test", y = "total_cost")
axes[1, 1].set_xlabel('Test', fontsize=13)
axes[1, 1].set_ylabel('Cost (USD)', fontsize=13)

plt.show()
plt.close()