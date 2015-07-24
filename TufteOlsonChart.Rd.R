require(ggplot2) # plotting package
require(Cairo) # for saving plot

# Helper function for x axis labels
addline_format <- function(x,...){
  gsub('\\s','\n',x)
}

# read in data
dat <- read.csv("{YOUR LOCATION}/us-weather-history/KPHL.csv")
city <- "Philadelphia"
# create an index
dat$day <- seq(1,365,1)
# find temp records
new_max_records = dat[which(dat$actual_max_temp >= dat$record_max_temp),]
new_min_records = dat[which(dat$actual_min_temp <= dat$record_min_temp),]
# set breaks and label for x axis
# this is rather static and could be redone dynamically using the date field
month_breaks = round(c(seq(1,365,(365/11)),365))
month_labels = c("July '14","August","September","October","November", "December",
                 "January '15", "February", "March", "April", "May", "June")
# set range and lables for y axis
min_temp <- round(range(dat$record_min_temp)[1],-1)
max_temp <- round(range(dat$record_max_temp)[2],-1)
temp_range <- seq(min_temp, max_temp, by=10)
degree_lables <- parse(text = paste(temp_range, "*degree", sep = ""))

# build plot
p <- ggplot() +
  geom_rect(data = dat, aes(xmin = day - 1, xmax = day, 
                            ymin = record_min_temp, ymax = record_max_temp),
                            fill = '#C3BBA4', color = '#C3BBA4') +
  geom_rect(data = dat, aes(xmin = day - 1, xmax = day, 
                            ymin = average_min_temp, ymax = average_max_temp),
                            fill = '#9A9180', color = '#9A9180') +
  geom_rect(data = dat, aes(xmin = day - 1, xmax = day, 
                            ymin = actual_min_temp, ymax = actual_max_temp),
                            fill = '#5A3B49', color = 'black') +
  geom_point(data = new_max_records, aes(x = day - 0.5, y = actual_max_temp + 2), 
                            color='#d62728', alpha=0.75, size = 3) +
  geom_point(data = new_min_records, aes(x = day - 0.5, y = actual_min_temp - 2), 
                            color='#1f77b4', alpha=0.75, size = 3) +
  scale_x_discrete(breaks = month_breaks, labels = addline_format(month_labels)) +
  scale_y_continuous(breaks = temp_range, labels = degree_lables) +
  labs(y=expression(paste("Temperature ( ", degree ~ F, " )")), title = city) +
  theme(
    rect = element_rect(fill="white", linetype=0, colour=NA),
    text = element_text(family = "sans", face = "bold", color = "black", size = 14),
    plot.title = element_text(size = rel(2)),
    axis.text.x = element_text(vjust = 1, colou = "black", size = rel(1.25), face = "bold"),
    axis.text.y = element_text(hjust = 1, color = "black", size = rel(1.25), face = "bold"),
    axis.title.y = element_text(hjust = 0.5, vjust = 2, angle = 90, size = rel(1.25), face="bold"),
    axis.title.x = element_blank(),
    axis.ticks = element_line(colour="gray"),
    panel.grid = element_line(colour=NULL, linetype = 1),
    panel.grid.major = element_line(linetype = "dashed", colour = "gray"),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "white"))

# save plot
plotName <- paste(c("PHL_temp.png"), collapse='')
CairoPNG(filename = plotName, width = 1220, height = 689, pointsize = 20, res=NA)
p
dev.off()