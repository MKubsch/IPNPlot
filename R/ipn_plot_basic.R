#' IPN theme uses IPN font, colors, and larger text size
#'
#'
#' @param fl set Forschungslinie, default set to "6" which is IPN blue
#' @param size set font size, default is 16
#' @param position set position for legend, default is "right"
#' @param grid show grid, default is 0 for no grid, set to 1 for grid
#' @keywords
#' @export
#' @examples
#' ipn_style_basic(fl = 6, size = 16, position = "right", grid = 0)
#'


ipn_style_basic <- function(fl = 6, size = 16, position = "right", grid = 0){
  if(fl > 6 | fl < 1){print("fl must be in range 1 to 6")}
  else{
    showtext::showtext_auto()

    sysfonts::font_add("linotype", regular = "LinotypeSyntaxCom-Regular.ttf", italic = "LinotypeSyntaxCom-Italic.ttf",
                       bold = "LinotypeSyntaxCom-Bold.ttf", bolditalic = "LinotypeSyntaxCom-BoldIt.ttf")
    font <- "linotype"
    #colors
    ipn <- "#032c69"
    grey <- "#808080"
    FL <- c("#bcb939", "#83334c", "#cc7119", "#32756b", "#485b7e","#032c69")
    grid_var <- ifelse(grid == 1, grey,"white")

    ggplot2::theme(


      #Legend format
      #This sets the position and alignment of the legend, removes a title and backround for it and sets the requirements for any text within the legend. The legend may often need some more manual tweaking when it comes to its exact position based on the plot coordinates.
      legend.position = position,
      legend.text.align = 0,
      legend.background = ggplot2::element_blank(),
      legend.title = element_text(family=font,
                                  size=size,
                                  color=FL[fl]),
      legend.text = ggplot2::element_text(family=font,
                                          size=size,
                                          color=grey),

      #Axis format
      #This sets the text font, size and colour for the axis test, as well as setting the margins and removes lines and ticks. In some cases, axis lines and axis ticks are things we would want to have in the chart - the cookbook shows examples of how to do so.
      axis.title = ggplot2::element_text(family=font,
                                         size=size,
                                         color=FL[fl]),
      axis.text = ggplot2::element_text(family=font,
                                        size=size,
                                        color=FL[fl]),
      axis.text.x = ggplot2::element_text(margin=ggplot2::margin(t = 5, b = 10)),
      axis.text.y = ggplot2::element_text(margin=ggplot2::margin(r = 5, l = 10)),
      axis.ticks = ggplot2::element_line(color = grey),
      axis.line = ggplot2::element_line(color = grey),

      #Grid lines
      #This removes all minor gridlines and adds major y gridlines. In many cases you will want to change this to remove y gridlines and add x gridlines. The cookbook shows you examples for doing so
      panel.grid.minor = ggplot2::element_line(color=grid_var),
      panel.grid.major = ggplot2::element_line(color=grid_var),
      #panel.grid.major.y = ggplot2::element_line(color=grey),
      #panel.grid.major.x = ggplot2::element_line(color=grey),

      #Blank background
      #This sets the panel background as blank, removing the standard grey ggplot background colour from the plot
      panel.background = ggplot2::element_rect(fill="white")

      #rect(fill = "#f2f2f2", colour = "#f2f2f2",
      #                                      size = 2, linetype = "dotted")


    )
  }
}
