library(tidyverse)


theme_jen<- function () {
  
  font <- "Helvetica"
  
  theme_bw() %+replace% 
    
    theme(
      
      #get rid of grid lines/borders
      
      panel.border = element_blank(), 
      panel.grid.major = element_blank(), 
      panel.grid.minor = element_blank(), 
      
      plot.margin = unit(c(1, 1, 1, 1), "cm"), # add white space top, right, bottom, left
      
      # custom axis text/lines
      axis.title = element_text(             #axis titles
        family = font,                      #font family
        size = 14),               
      
      axis.text = element_text(              #axis text
        family = font,                       #axis family
        size = 12),   
      
      axis.text.x = element_text(            #margin for axis text, pulls text away from axis
        margin=margin(5, b = 10)),
      
      
      axis.line = element_line(colour = "black", size = rel(1)), # black lines
      
      
      # titles, subtitles, captions
      
      plot.title = element_text(             #title
        family = font,               #set font family
        size = 18,
        hjust = 0,
        vjust = 4),
      
      plot.subtitle = element_text(          #subtitle
        family = font,                   #font family
        size = 14, 
        hjust = 0,
        vjust = 3),
      
      plot.caption = element_text(           #caption
        family = font,                   #font family
        size = 10,
        hjust = 1,
        vjust = 2),        
      
      
      # legend and background
      
      legend.title = element_text(           #legend title
        family = font,            #font family
        size = 10,                 #font size
        hjust = 0), 
      
      legend.text = element_text(           #legend text
        family = font,               #font family
        size = 8,                      #font size
        hjust = 0), 
      
      legend.key = element_blank(),   #no background on legend
      
      strip.background = element_rect(fill = "white",  # white background on plot
                                      colour = "black", size = rel(2)), complete = TRUE)
}
