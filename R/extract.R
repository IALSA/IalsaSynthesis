#' @name extract
#' @aliases extract_output_filename extract_free_parameter_count extract_loglikelihood extract_scaling_correction extract_aic extract_bic extract_bic_adjusted
#' @export extract_output_filename extract_free_parameter_count extract_loglikelihood extract_scaling_correction extract_aic extract_bic extract_bic_adjusted
#' 
#' @title Extract the values within model output files.
#'  
#' @description Functions that extract the values within model output files.
#' 
#' @param mplus_output Text containing model output.  This should be the text read from the file (not a file path).
#' @param regex Regular Expression pattern to capture and extract contents.
#' @param source Text to run the regex against.
#' 
#' @return A \code{numeric} value corresponding to the desired quantity.
#' 
#' @author Will Beasley
#' 
#' @examples
#' library(IalsaSynthesis) #Load the package into the current R session.


#NOT PARSED BY ROXYGEN: @describeIn extract Generalizable function to return a single string value.
extract_scalar_string <- function( regex, source ) {
  matches <- regexpr(regex, source, perl=TRUE);
  result <- attr(matches, "capture.start")[, 1]
  attr(result, "match.length") <- attr(matches, "capture.length")[, 1]
  observed_string <- regmatches(source, result)
  return( observed_string )
}

#' @describeIn extract Generalizable function to return a single numeric value.
extract_scalar_float <- function( regex, source ) {
  return( as.numeric(extract_scalar_string(regex, source)) )
}

#' @describeIn extract Determine the path of the Mplus output file.
extract_output_filename <- function( mplus_output ) {
  # gsub(pattern="DATA:  File = (.+);", replacement="\\1", mplus_output, perl=T)
  extract_scalar_string(".+DATA:  File = (.+);.*", mplus_output)
}

#' @describeIn extract Determine the number of free parameters for the model estimation.
extract_free_parameter_count <- function( mplus_output ) {
  extract_scalar_float("Number of Free Parameters\\s+(\\d{1,})\\s+", mplus_output)
}

#' @describeIn extract Determine the log likelihood for the model estimation.
extract_loglikelihood <- function( mplus_output ) {
  extract_scalar_float("Loglikelihood\\s+H0 Value\\s+([-\\d\\.]+)\\s+", mplus_output)
}

#' @describeIn extract Determine the H0 Scaling Correction Factor for the model estimation.
extract_scaling_correction <- function( mplus_output ) {
  matched_string <- extract_scalar_string("\\s+H0 Scaling Correction Factor\\s+([-\\d\\.]+)\\s+for MLR\\s+", mplus_output)
  matched_float <- ifelse(length(matched_string>0), as.numeric(matched_string), NA_real_)
  
  return( matched_float )
}

#' @describeIn extract Determine the AIC for the model estimation.
extract_aic <- function( mplus_output ) {
  extract_scalar_float("Akaike \\(AIC\\)\\s+([-\\d\\.]+)\\s+", mplus_output)
}

#' @describeIn extract Determine the BIC for the model estimation.
extract_bic <- function( mplus_output ) {
  extract_scalar_float("Bayesian \\(BIC\\)\\s+([-\\d\\.]+)\\s+", mplus_output)
}

#' @describeIn extract Determine the Sample-Size Adjusted BIC for the model estimation.
extract_bic_adjusted <- function( mplus_output ) {
  # matches <- regexpr("\\s+Sample-Size Adjusted BIC\\s+(\\d+(\\.\\d+)?)\\s+", mplus_output, perl=TRUE);
  # matches <- regexpr("\\s+Sample-Size Adjusted BIC\\s+(.+)\\s+", mplus_output, perl=TRUE);
  extract_scalar_float("\\s+Sample-Size Adjusted BIC\\s+([-\\d\\.]+)\\s+", mplus_output)
}
