path <- "/mnt/raad_3121"

library(raadtools)
sf <- sstfiles()


ncks <- function(file, outpath, varname, clobber = FALSE, extras = "") {
  outpath <-  file.path(outpath, basename(dirname(dirname(file))))
  if (!file.exists(outpath)) dir.create(outpath)
  outfile <- file.path(outpath, sprintf("%s_%s", varname, basename(file)))

  
  extras <- sprintf("%s -v %s", extras, varname)
  if (clobber) {
    extras <- paste(extras, "-O")
  } else {
    if (file.exists(outfile)) {
      return(1)
    }
  }
  cmd <- sprintf("ncks %s %s %s", extras, file, outfile) 
  #print(cmd)
  tst <- system(cmd)
  tst <- 1
  if (tst == 0) outfile else tst
}

for (i in seq(nrow(sf))) {
ncks(sf$fullname[i], path, "sst", extras = "--netcdf4 -L 1 --mk_rec_dmn time", clobber = FALSE)
  if (i %% 1000 == 0) print(i)
}


