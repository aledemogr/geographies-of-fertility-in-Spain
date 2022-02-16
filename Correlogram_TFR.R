rm(list = ls())

library(tidyverse)

# setwd('mywd')
df <- read_csv("correlog.TFR.csv")

df$sig <- factor(!is.na(df$red.dots))

df$region <- factor(df$region,levels=c("Galicia","North-West","Basque Country","North-East","Catalonia","Valencian Comm.","Castile La Mancha","Castile and Leon","Urban Madrid","Extremadura","Andalusia","Canary Islands"))
cbbPalette <- c("#000000", "#009E73", "#e79f00", "#9ad0f3", "#0072B2", "#D55E00", "#CC79A7")
year.sel <- c(1981, 1991, 2001, 2011, 2018)

ggplot(df %>% filter(year %in% year.sel), aes(x=dist.class/1000, y=Moran.correlog)) +
  geom_line(aes(color=factor(year)),size = 1) +
  geom_point(aes(shape = sig, size = sig),shape="+",color="red") +
  geom_hline(yintercept=0,linetype=4,col="darkgrey")+
  labs(color = "Year", shape = "p < 0.05", size = "p < 0.05") +
  scale_color_manual(values = c("1981"="red","1991"="#49FF00FF", "2001"="#0092FFFF","2011"="darkgrey", "2018"="black"))+
  scale_size_manual(values = c(3, 6))+
  guides(guide=guide_legend(nrow=2,byrow=T))+
  xlab("Distance in km")+
  ylab("Moran's I")+
  scale_y_continuous(limits=c(-.5,.65),breaks=seq(-0.5,+0.5,0.25))+
  scale_x_continuous(limits=c(0,150))+
  theme.ale+
  facet_wrap(~region,scales="free_x")

ggsave('correlogram_TFR.png', dpi=400)


