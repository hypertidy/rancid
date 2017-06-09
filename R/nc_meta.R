
#' NetCDF minimal metadata
#'
#' Find the dimensions and variables, their lengths and shapes. 
#' @param x NetCDF data source
#'
#' @return 
#' @export
#'
#' @examples
#' x <- "/rdsi/PRIVATE/raad/data/eclipse.ncdc.noaa.gov/pub/OI-daily-v2/NetCDF/2017/AVHRR/avhrr-only-v2.20170607_preliminary.nc"
#' nc_meta(x)
nc_meta <- function(x) {
  ## just what is required
  con <- RNetCDF::open.nc(x)
  on.exit(RNetCDF::close.nc(con), add = TRUE)
}