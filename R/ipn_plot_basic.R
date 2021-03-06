#' IPN theme uses IPN font, colors, and larger text size
#'
#'
#' @param fl set Forschungslinie, default set to "6" which is IPN blue
#' @param size set font size, default is 16
#' @param position set position for legend, default is "right"
#' @param grid show grid, default is 0 for no grid, set to 1 for grid
#' @param transparent transparent background, default is 0 for white background, set to 1 for transparent background
#' @param black color of text, default is 0 for grey, set to 1 for black
#' @param line_size specify line size, default is one
#' @keywords
#' @export
#' @examples
#' ipn_style(fl = 5, size = 16, position = "right", grid = 0, transparent = 0, black = 0)
#'


ipn_style <- function(fl = 5, size = 16, position = "right", grid = 0, transparent = 0, black = 0, line_size = 1){
  if(fl > 6 | fl < 1){print("fl must be in range 1 to 5")}
  else{
    showtext::showtext_auto()

    sysfonts::font_add("linotype", regular = "LinotypeSyntaxCom-Regular.ttf", italic = "LinotypeSyntaxCom-Italic.ttf",
                       bold = "LinotypeSyntaxCom-Bold.ttf", bolditalic = "LinotypeSyntaxCom-BoldIt.ttf")
    font <- "linotype"
    #colors
    ipn <- "#032c69"
    color_black <- ifelse(black == 0, "#808080", "black")
    FL <- c("#83334c", "#cc7119", "#32756b", "#485b7e","#032c69") # FL1 color "#bcb939"
    color_FL <- ifelse(black == 0, FL[fl], "black")
    grid_var <- ifelse(transparent == 1 & grid == 0, "transparent", ifelse(grid == 1, grey,"white"))
    trans <- ifelse(transparent == 1, "transparent", "white")

    ggplot2::theme(
      #Legend format
      #This sets the position and alignment of the legend, removes a title and backround for it and sets the requirements for any text within the legend. The legend may often need some more manual tweaking when it comes to its exact position based on the plot coordinates.
      legend.position = position,
      legend.text.align = 0,
      legend.background = ggplot2::element_rect(fill = trans, colour = NA),
      legend.title = element_text(family=font,
                                  size=size,
                                  color=color_black),
      legend.text = ggplot2::element_text(family=font,
                                          size=size,
                                          color=color_black),
      legend.box.background = element_rect(fill = trans, colour =  NA), # get rid of legend panel bg
      legend.key = element_rect(fill = trans, colour = NA),

      #Axis format
      #This sets the text font, size and colour for the axis test, as well as setting the margins and removes lines and ticks. In some cases, axis lines and axis ticks are things we would want to have in the chart - the cookbook shows examples of how to do so.
      axis.title = ggplot2::element_text(family=font,
                                         size=size,
                                         color=color_FL),
      axis.text = ggplot2::element_text(family=font,
                                        size=size,
                                        color=color_black),
      axis.text.x = ggplot2::element_text(margin=ggplot2::margin(t = 5, b = 10)),
      axis.text.y = ggplot2::element_text(margin=ggplot2::margin(r = 5, l = 10)),
      axis.ticks = ggplot2::element_line(color = color_black, size = line_size, lineend = "round"),
      axis.line = ggplot2::element_line(color = color_black, size = line_size, lineend = "round"),

      #Grid lines
      #This removes all minor gridlines and adds major y gridlines. In many cases you will want to change this to remove y gridlines and add x gridlines. The cookbook shows you examples for doing so
      panel.grid.minor = ggplot2::element_line(color=grid_var),
      panel.grid.major = ggplot2::element_line(color=grid_var),
      #panel.grid.major.y = ggplot2::element_line(color=grey),
      #panel.grid.major.x = ggplot2::element_line(color=grey),

      #Blank background
      #This sets the panel background as blank, removing the standard grey ggplot background colour from the plot
      panel.background = ggplot2::element_rect(fill=trans, colour = NA, size =  NA ),
      plot.background =  ggplot2::element_rect(fill=trans, colour = NA, size = NA )


    )
  }
}
