visreg2d <- function(fit, xvar, yvar, type=c("conditional", "contrast"), trans=I, scale=c("linear","response"),
                     nn=99, cond=list(), plot=TRUE, ...) {
  # Setup
  if (type[1]=="effect") {
    warning("Please note that type='effect' is deprecated and may not be supported in future versions of visreg.  Use type='contrast' instead.")
    type <- "contrast"
  }
  type <- match.arg(type)
  scale <- match.arg(scale)
  if (scale=="response") trans <- family(fit)$linkinv
  if (missing(xvar) | missing(yvar)) stop("Must specify and x and y variable")

  # Set up f
  f <- setupF(fit, c(xvar, yvar), parent.frame())
  if (attr(f, "needsUpdate")) fit <- update(fit, data=f)
  cond <- setupCond(cond, f)[[1]]

  # Calculate v
  v <- setupV2(fit, f, xvar, yvar, nn, cond, type, scale, trans)

  # Plot/return
  if (plot) {
    p <- plot(v, ...)
    if (!is.null(p) && 'gg' %in% class(p) || 'list' %in% class(p)) return(p)
  }
  invisible(v)
}
