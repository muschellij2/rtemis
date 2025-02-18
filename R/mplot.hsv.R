# mplot.hsv.R
# ::rtemis::
# 2019 Efstathios D. Gennatas egenn.github.io

#' Plot HSV color range
#'
#' @param h.steps Float, vector: Hue values to plot. Default = `seq(0, 1, .0125)`
#' @param s.steps Float, vector: Saturation values to plot. Default = same as `h.steps`
#' @param v Float: Value. Default = 1
#' @param alpha Float: Alpha. Default = 1
#' @param pch Integer: pch plot parameter. Default = 15 (square)
#' @param bg Colot: Background color. Default = "black"
#' @param axes Logical: for `type = "cartesian"`: If TRUE, draw axes. Default = TRUE
#' @param pty String: for `type = "cartesian"`: "s", "r", par's pty argument. Default = "s" (square plot)
#' @param cex Float: `par/plot`'s cex argument. Default = 1
#' @param mar Float, vector: for `type = "cartesian"`: `par`'s mar argument. Default = c(3, 3, 2, .5)
#' @param lab.col Color: Color for axes and labels. Defaults to inverse of `bg`, i.e. white if bg is black
#' @param type String: "cartesian" for square plot, "polar" for radial plot. Default = "polar"
#' @author Efstathios D. Gennatas
#' @export

mplot.hsv <- function(h.steps = seq(0, 1, .0125),
                      s.steps = h.steps,
                      v = 1,
                      alpha = 1,
                      pch = 15,
                      bg = "black",
                      axes = TRUE,
                      pty = "s",
                      cex = 1,
                      mar = c(3, 3, 2, .5),
                      lab.col = NULL,
                      type = c("polar", "cartesian")) {

  type <- match.arg(type)

  par.orig <- par(no.readonly = TRUE)
  on.exit(par(par.orig))

  if (is.null(lab.col)) {
    lab.col <- colorOp(bg, "invert")[[1]]
  }


  grd <- expand.grid(h.steps, s.steps)
  col <- hsv(h = grd[, 1], s = grd[, 2], v = v, alpha = alpha)

  if (type == "cartesian") {
    # '- Square ====
    par(bg = bg, mar = mar, pty = pty)
    plot(grd,
         xlim = c(0, 1),
         ylim = c(0, 1),
         pch = pch,
         col = col,
         axes = FALSE,
         ann = FALSE,
         cex = cex)

    if (axes) {
      axis(1, col = lab.col, col.ticks = lab.col, col.axis = lab.col)
      axis(2, col = lab.col, col.ticks = lab.col, col.axis  = lab.col)
    }
    mtext("H", 1, col = lab.col, line = 2, font = 2)
    mtext("S", 2, col = lab.col, line = 2, font = 2)
    mtext(paste0("HSV color (V = ", v, ")"), 3, adj = 0, font = 2, line = .5, col = lab.col)
  } else {
    # '- Radial ====
    if (!depCheck("plotrix", verbose = FALSE)) {
      cat("\n"); stop("Please install dependencies and try again")
    }
    par(bg = bg)
    plotrix::radial.plot(drange(grd[, 2], 0, 360 * pi/180),
                         drange(grd[, 1], 0, 360 * pi/180),
                         start = pi/2,
                         clockwise = TRUE,
                         rp.type = "s",
                         point.symbols = 18,
                         point.col = col,
                         labels = ddSci(seq(0, 1, 1/12))[-13],
                         label.prop = 1,
                         show.grid = T,
                         show.grid.labels = 1,
                         show.radial.grid = F,
                         radial.labels = "",
                         boxed.radial = F)
    mtext(paste0("HSV color (V = ", v, ")"), font = 2, col  = lab.col)
  }

} # rtemis::mplot.hsv
