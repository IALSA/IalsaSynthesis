#' @name extract
#' @aliases extract_output_filename
#' @export
#' 
#' @title Extract the values within model output files.
#'  
#' @description Functions that extract the values within model output files.
#' 
#' @param mplus_output Text containing model output.
#' 
#' @return A \code{numeric} value corresponding to the desired quantity.
#' 
#' @author Will Beasley
#' 
#' @examples
#' library(IalsaSynthesis) #Load the package into the current R session.

extract_output_filename <- function( mplus_output ) {
  gsub(pattern="DATA:  File = (.+);", replacement="\\1", mplus_output, perl=T)
  # gsub(pattern="DATA:  File = (.+);", replacement="\\1", mplus_output[output_line_of_path], perl=T)
  
}
