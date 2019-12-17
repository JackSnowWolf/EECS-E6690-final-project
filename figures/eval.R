library(dplyr)
library(tidyr)
library(caret)
library(ggplot2)
library(reshape2)

eval.df <- read.csv("figures/eval.csv", header = TRUE)
eval.m <- melt(eval.df)

p <- ggplot(eval.m, aes(x= reorder(type, -value), y=value))+
  geom_bar(aes(fill=variable),  position="dodge",stat="identity", width = 0.5)+
  theme(legend.position="left")+                                                                  
  labs(y="accuracy", 
       x="Different methods evaluations on convensional features and  social media features", 
       fill = "methods")+
  theme(axis.text.y = element_text(size = 18),
        axis.text.x = element_text(angle = 30, hjust = 1, size = 18),
        legend.text = element_text(size = 16),
        axis.title.x= element_text(size = 18),
        axis.title.y= element_text(size = 18),
        legend.title = element_text(size = 18))
ggsave("figures/eval_comparsion.jpg", p, width = 12, height = 6)
