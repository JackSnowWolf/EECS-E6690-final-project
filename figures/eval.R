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
  labs(y="accuracy [%]", 
       x="different methods evaluations on convensional features and  social media features", 
       fill = "methods")+
  theme(axis.text.x = element_text(angle = 30, hjust = 1))
ggsave("figures/eval_comparsion.jpg", p, width = 10, height = 6)
