# ~/.Rprofile
#dummy1 <- function(x,y,...) UseMethod("plot")
#plot <- function(...,fg="grey",bty="n",col="grey20",col.lab="grey20",col.axis="grey30",col.main="grey30") {
#  dummy1a <- function(...,fg.a = fg, bty.a = bty, col.a = col, col.lab.a = col.lab, col.axis.a = col.axis, col.main.a=col.main) {
#    dummy1(fg=fg.a,bty=bty.a,col=col.a,col.axis=col.axis.a,col.lab=col.lab.a,col.main=col.main.a,...) 
#  }
#  dummy1a(...)
#}

options(
  repos=structure(c(CRAN="http://cran.stat.sfu.ca")),
  # devtools
  devtools.name="Arthur Lui",
  devtools.desc.author="Arthur Lui <luiarthur@ucsc.edu> [aut, cre]"
)

# my_scala_lib_dir <- "path-to-scala-libs"

### Save / Load R history
if (interactive()) {
  .Last <- function() try(savehistory("~/.Rhistory"))
}

### For package generatrion.
#options(
#  repos=structure(c(CRAN="http://cran.stat.sfu.ca")),
#  # devtools
#  devtools.name="Arthur Lui",
#  devtools.desc.author="Arthur Lui <luiarthur@ucsc.edu> [aut, cre]"
#)


