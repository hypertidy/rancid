path <- "/mnt/raad_3121"

ncat <- function(files, outfile, extras = "") {
  cmd <- sprintf("ncrcat %s %s %s", extras, paste(files, collapse = " "), outfile)
  system(cmd, intern = TRUE)
}


ffs <- list.files(path, recursive = TRUE, full.names = TRUE, pattern = "nc$")
ffs <- ffs[!grepl("preliminary", ffs)]

ffs <- file.path(basename(dirname(ffs)), basename(ffs))

#unlink("~/cat.nc")
system.time({
  #ncat(ffs[1:3000], "~/cat0.nc", extras = "--netcdf4 -L 1 --64 -p /mnt/raad_3121")
  #ncat(ffs[3001:6000], "~/cat1.nc", extras = "--netcdf4 -L 1 --64 -p /mnt/raad_3121")
  #ncat(ffs[6001:9000], "~/cat2.nc", extras = "--netcdf4 -L 1 --64 -p /mnt/raad_3121")
  #ncat(ffs[9001:12000], "~/cat3.nc", extras = "--netcdf4 -L 1 --64 -p /mnt/raad_3121")
  #ncat(ffs[12001:12832], "~/cat4.nc", extras = "--netcdf4 -L 1 --64 -p /mnt/raad_3121")
  ncat(c("~/cat0.nc", "~/cat1.nc", "~/cat2.nc", "~/cat3.nc", "~/cat4.nc"), "/mnt/raad_3121/3121.nc", extras = "--netcdf4 -L 1 --64")
  
  
  
})
