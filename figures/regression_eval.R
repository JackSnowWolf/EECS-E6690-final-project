library(dplyr)
library(tidyr)
library(caret)
library(ggplot2)
library(reshape2)

# evaluation for conventional features
conventional_eval.df <- data.frame(soft_acc = c(0.7857143, 0.7678571,  0.7321429), 
                              classification_acc = c(0.3571429, 0.3471429,  0.3928571),  
                              mse = c(0.7017915, 0.704498, 0.7079963),
                              type = c("linear regression", "generalised linear regression", "generalized additive model"))
conventional.m <- melt(conventional_eval.df)

conventional.m$type <- factor(conventional.m$type, levels = c("linear regression", 
                                                              "generalised linear regression", 
                                                              "generalized additive model"))


socialmedia_eval.df <- data.frame(soft_acc = c(0.75, 0.743, 0.7056806), 
                                  classification_acc = c(0.4464286, 0.4285714, 0.4107143),  
                                  mse = c(0.7167638,  0.7156921, 0.7321429),
                                  type = c("linear regression", "generalised linear regression", "generalized additive model"))
socialmedia_eval.m <- melt(socialmedia_eval.df)
socialmedia_eval.m$type <- factor(socialmedia_eval.m$type, levels = c("linear regression", 
                                                                      "generalised linear regression", 
                                                                      "generalized additive model"))

p1 <- ggplot(conventional.m, aes(x=type, y=value))+
geom_bar(aes(fill=variable),  position="dodge",stat="identity", width = 0.5)+
theme(legend.position="left")+
labs(y="accuracy or mse score", 
     x="different methods evaluations on conventional featurea", 
     fill = "methods")+
theme(axis.text.x = element_text(angle = 30, hjust = 1))
p1
p2 <- ggplot(socialmedia_eval.m, aes(x=type, y=value))+
  geom_bar(aes(fill=variable),  position="dodge",stat="identity", width = 0.5)+
  theme(legend.position="left")+
  labs(y="accuracy or mse score", 
       x="different methods evaluations on social media feature", 
       fill = "methods")+
  theme(axis.text.x = element_text(angle = 30, hjust = 1))
p2
library(patchwork)
regression_p<- p1 + p2 + plot_layout(nrow = 2, heights = c(1, 1))
ggsave("figures/regression_comparsion.jpg")
