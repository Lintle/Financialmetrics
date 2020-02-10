
Reits_graph <- function(N=1) {
    
  g2 <- 
    ggplot(data = dlog) +
    geom_line(aes(x = date, y = dlogret, color = Name), size = 1.3, alpha = 0.4) + 
    theme_bw() + theme(legend.position = "right") + labs(title = "REITS Return Plot", caption = "Data was downloaded from Bloomberg") + scale_color_npg()
  
  print(g2)
  
}