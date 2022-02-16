library(tidyverse)

setwd('set_your_working_directory')

# 


df <- read_csv('BoxPlotTFR.csv')

year.list <- c(1981, 1986, 1991, 1996, 2001, 2006, 2011, 2018)
ggplot(df, 
       aes(fill= factor(regions), y= value, x=factor(year)))+
  geom_boxplot()+
  scale_color_viridis_d()+
  # theme.ale+
  theme( legend.title  = element_blank(), legend.position = 'none')+
  labs(title = 'Total fertility rate')+
  # geom_jitter(width=0.1,alpha=0.2)
  facet_wrap(~regions)
