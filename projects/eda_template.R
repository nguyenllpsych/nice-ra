#### META ####

# load packages
library(rio)          # for importing data files
library(summarytools) # descriptive stats
library(dplyr)        # data wrangling
library(ggplot2)      # plots
library(forcats)      # fct_reorder for barplots

# import the data
data <- rio::import(file = "data-name.sav")

#### DESCRIPTIVE STATISTICS ####

# summary of continuous variables
data %>% select(variable1, variable2, variable3) %>% 
  descr(stats = "common", order = "p")

# frequency of categorical variables
freq(data$variable1)

# correlation matrix
cormat <- round(x = cor(select(data_frame, c("variable1", "variable2",
                                             "variable3", "variable4"))),
                digits = 2)
cormat[lower.tri(cormat)] <- NA
cormat <- melt(cormat, na.rm = TRUE) %>%
  # delete the perfect correlations
  filter(value != 1.00)

# correlation heatmap
ggplot(data = cormat, aes(Var2, Var1, fill = value)) +
  geom_tile(color = "white" ) +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name = "Pearson\nCorrelation") +
  theme_minimal()+ 
  labs(x = NULL, y = NULL) +
  coord_fixed() +
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 4) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.4, 0.7),
    legend.direction = "horizontal")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))

#### EXPLORATORY PLOTS ####

# plots of binary variables
ggplot(data = dataframe, 
       aes(factor(variable1,
                  levels = c(0, 1),
                  labels = c("Label for 0", "Label for 1")))) + 
  geom_bar(fill = c("#f1c232", "#710c0c")) + 
  geom_text(stat='count', aes(label=..count..), vjust = -1) + 
  labs(
    title = "Count of binary variable",
    x = NULL
  ) +
  ylim(0, 100) +
  theme_classic()

# boxplot of continuous variables
ggplot(data = dataframe, aes(variable1)) +
  geom_boxplot(fill = "#710c0c", color = "#f1c232") + 
  annotate("text", 
           label = paste0("Median = ", 
                          median(dataframe$variable1, na.rm = TRUE),
                          " units"),
           x = x_coordinate, y = y_coordinate) + 
  labs(
    title = "Distribution of variable",
    x = "Variable name",
    y = NULL
  ) +
  theme_classic()

# histogram of continuous variable
ggplot(data = dataframe, aes(variable1)) +
  geom_histogram(binwidth = 0.1, fill = "#710c0c") + 
  geom_vline(xintercept = mean(dataframe$variable1, na.rm = T),
             color = "#f1c232", size = 1) +
  annotate("text", 
           label = paste0("Mean = ", round(mean(dataframe$variable1, na.rm = T), 
                                           2),
                          ", SD = ",round(sd(dataframe$variable1, na.rm = T), 
                                          2)),
           x = x_coordinate, y = y_coordinate) + 
  labs(
    title = "Distribution of variable",
    x = "Variable name",
    y = NULL
  ) +
  theme_classic()