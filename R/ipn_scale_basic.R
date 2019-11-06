#' IPN Color palette scale: color
#'
#'
#' @param fl set Forschungslinie, default set to "6" which is IPN blue
#' @param name set scale name
#' @param labels set scale labels
#' @keywords
#' @export
#' @examples
#' scale_color_ipn( fl = 2 name = c("example scale"), labels = c("A","B"))
#'

scale_color_ipn <- function(fl = 6, name ,labels ) {
  #colors
  ipn <- ("#032c69")
  grey <- ("#808080")
  FL <- c("#bcb939", "#83334c", "#cc7119", "#32756b", "#485b7e","#032c69")
  FL_selected <- c(FL[fl],FL[-fl])

  ggplot2::scale_color_manual(values=FL_selected, name = name , labels = labels)

}

#' IPN Color palette scale: fill
#'
#'
#' @param fl set Forschungslinie, default set to "6" which is IPN blue
#' @param name set sclae name
#' @param labels set scale labels
#' @keywords
#' @export
#' @examples
#' scale_fill_ipn( fl = 2 name = c("example scale"), labels = c("A","B"))
#'

scale_fill_ipn <- function(fl = 6, name ,labels  ) {
  #colors
  ipn <- ("#032c69")
  grey <- ("#808080")
  FL <- c("#bcb939", "#83334c", "#cc7119", "#32756b", "#485b7e","#032c69")
  FL_selected <- c(FL[fl],FL[-fl])

  ggplot2::scale_fill_manual(values=FL_selected, name = name , labels = labels)

}

