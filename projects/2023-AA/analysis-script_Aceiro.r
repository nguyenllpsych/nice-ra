library(ggplot2)

# create a scatterplot of "assert" and "pil" columns
ggplot(data, aes(x = assert, y = pil)) +
  geom_point(alpha = 0.5, size = 3) +  # add transparency and adjust point size
  
  # add correlation coefficient with custom formatting
  annotate("text", x = 4, y = 5.5, 
           label = paste0("r = ", round(cor(data$assert, data$pil, use = "complete.obs"), 2)),
           fontface = "bold", size = 4) +
  
  # customize axes and labels
  labs(x = "Assertiveness", y = "PIL") +  # set axis labels
  scale_y_continuous(limits = c(0, 6), expand = c(0, 0.05)) +  # adjust y-axis limits and spacing
  theme_bw() # use a white background theme

# regression analysis
simple_regression <- lm(pil ~ assert, data)

# see model results
summary(simple_regression)

# run a correlation test
cor.test(data$assert, data$pil, use = "pairwise")

# visualize model results
ggplot(data = data, 
       # first tell R what variables to plot:
       aes(x = assert, y = pil)) +
  
  # add a scatterplot:
  geom_point() +
  
  # add a regression line:
  geom_smooth(method = "lm") +
  
  # add correlation coefficient with custom formatting
  annotate("text", x = 3.5, y = 5.5, 
           label = paste0("r = ", round(cor(data$assert, data$pil, 
                                            use = "complete.obs"), 2)),
           fontface = "bold", size = 4) +
  
  # customize axes and labels
  labs(x = "Assertiveness", y = "PIL") +
  
  # add a white background theme:
  theme_classic()

# add gender_f as moderator
moderator <- lm(pil ~ assert * gender_f, data = data)
summary(moderator)

# interpret coefficients
# assert: relationship between assertiveness and pil, after controlling for gender
#         this remains significant, b = 0.265, p = .009
# assert:gender_f: interaction effect/moderation effect
#         this is not significant, p = .928
#.        gender does not moderate the relationship between assertiveness and purpose in life


