ipn_theme <- function(fl = 6) {
  sysfonts::font_add("linotype", regular = "LinotypeSyntaxCom-Regular.ttf", italic = "LinotypeSyntaxCom-Italic.ttf",
                     bold = "LinotypeSyntaxCom-Bold.ttf", bolditalic = "LinotypeSyntaxCom-BoldIt.ttf")
  font <- "linotype"
  #colors
  ipn <- "#032c69"
  grey <- "#808080"
  FL <- c("#bcb939", "#83334c", "#cc7119", "#32756b", "#485b7e","#032c69")


  ggplot2::theme(

    #Text format:
    #This sets the font, size, type and colour of text for the chart's title
    plot.title = ggplot2::element_text(family=font,
                                       size=28,
                                       face="bold",
                                       color=ipn),
    #This sets the font, size, type and colour of text for the chart's subtitle, as well as setting a margin between the title and the subtitle
    plot.subtitle = ggplot2::element_text(family=font,
                                          size=22,
                                          color=FL[fl],
                                          margin=ggplot2::margin(9,0,9,0)),
    plot.caption = ggplot2::element_blank(),
    #This leaves the caption text element empty, because it is set elsewhere in the finalise plot function

    #Legend format
    #This sets the position and alignment of the legend, removes a title and backround for it and sets the requirements for any text within the legend. The legend may often need some more manual tweaking when it comes to its exact position based on the plot coordinates.
    legend.position = "top",
    legend.text.align = 0,
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_blank(),
    legend.key = ggplot2::element_blank(),
    legend.text = ggplot2::element_text(family=font,
                                        size=18,
                                        color=grey),

    #Axis format
    #This sets the text font, size and colour for the axis test, as well as setting the margins and removes lines and ticks. In some cases, axis lines and axis ticks are things we would want to have in the chart - the cookbook shows examples of how to do so.
    axis.title = ggplot2::element_text(family=font,
                                       size=18,
                                       color=ipn),
    axis.text = ggplot2::element_text(family=font,
                                      size=18,
                                      color=FL[fl]),
    axis.text.x = ggplot2::element_text(margin=ggplot2::margin(t = 5, b = 10)),
    axis.text.y = ggplot2::element_text(margin=ggplot2::margin(r = 5, l = 10)),
    axis.ticks = ggplot2::element_blank(),
    axis.line = ggplot2::element_blank(),

    #Grid lines
    #This removes all minor gridlines and adds major y gridlines. In many cases you will want to change this to remove y gridlines and add x gridlines. The cookbook shows you examples for doing so
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major = ggplot2::element_blank(),
    #panel.grid.major.y = ggplot2::element_line(color=grey),
    #panel.grid.major.x = ggplot2::element_line(color=grey),

    #Blank background
    #This sets the panel background as blank, removing the standard grey ggplot background colour from the plot
    panel.background = ggplot2::element_blank(),

    #Strip background (#This sets the panel background for facet-wrapped plots to white, removing the standard grey ggplot background colour and sets the title size of the facet-wrap title to font size 22)
    strip.background = ggplot2::element_rect(fill="white"),
    strip.text = ggplot2::element_text(size  = 22,  hjust = 0)
  )
  }

ipn_scale <- function(fl = 6){
  ifelse(fl == 6, c <-  7, c <-  6)
  ipn <- "#032c69"
  grey <- "#808080"
  FL <- c("#bcb939", "#83334c", "#cc7119", "#32756b", "#485b7e","#032c69","#808080")
  ggplot2::scale_colour_manual(values = FL[c(fl,c)])

}

ipn_style <- function(fl = 6){
  if(fl > 6 | fl < 1){print("fl must be in range 1 to 6")}
  else{
    showtext::showtext_auto()
    list(ipn_theme(fl = fl), ipn_scale(fl = fl))
    }
}


