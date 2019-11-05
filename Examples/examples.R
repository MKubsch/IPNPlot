# installation, run once to install
#install.packages(c("devtools","tidyverse"))
#library(devtools)
#install_github("MKubsch/IPNPlot")

#examples 
library(tidyverse)
library(ipnplot)
# example data frame
df <-  data.frame(s = rnorm(20, 1, .5), x = c(1:20), y = c(1:20), z = c(rep(1,10),rep(0,10)))

# plot only with ipn theme
plot0 <-
df %>%
  ggplot(aes(x = x, y = y, color = as.factor(z))) + geom_point() +
   ipn_style_basic(fl = 3)
ggsave("plot0.pdf", plot0, device = "pdf")

# plot only with ipn theme and label, to change the text colour use colour argument, see colour codes at bottom of document, currently set to IPN blue 
plot1 <-
  df %>%
  ggplot(aes(x = x, y = y, color = as.factor(z))) + geom_point() + geom_label(aes(x=1,y=1, label = "a label"), family = "linotype", colour = "#032c69") +
  ipn_style_basic(fl = 3)
ggsave("plot1.pdf", plot1, device = "pdf")


# plot with theme and color scale
plot2 <-
  df %>%
  ggplot(aes(x = x, y = y, color = as.factor(z))) + geom_point() +
  ipn_scale_color_basic(fl = 3, name = "Z", labels = c("A","B"))
  ipn_style_basic(fl = 3)
ggsave("plot2.pdf", plot2, device = "pdf")


# plot with theme and fill scale
plot3 <-
  df %>%
  ggplot(aes(x = x, y = s, fill = as.factor(z))) + geom_boxplot() +
  ipn_scale_fill_basic(fl = 3, name = "Z", labels = c("A","B"))
ipn_style_basic(fl = 3)
ggsave("plot3.pdf", plot3, device = "pdf")

# IPN Forschungslinien colours

FL 1 "#bcb939" 
FL 2 "#83334c"
FL 3 "#cc7119"
FL 4 "#32756b"
FL 5 "#485b7e"

IPN Blue "#032c69"

Grey "#808080"
