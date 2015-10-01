#' @name extract
#' 
#' @title Extract the values within model output files.
#'  
#' @description Functions that extract the values within model output files.
#' 
#' @param mplus_output Text containing model output.  This should be the text read from the file (not a file path).
#' @param regex Regular Expression pattern to capture and extract contents.
#' @param source Text to run the regex against.
#' @param parameter_name Variable name in Mplus output to extract.
#' 
#' @return A \code{numeric} value corresponding to the desired quantity.
#' 
#' @author Will Beasley
#' 
#' @examples
#' library(IalsaSynthesis) #Load the package into the current R session.



#' @export
#NOT PARSED BY ROXYGEN: @describeIn extract Generalizable function to return a single string value.
extract_scalar_string <- function( regex, source ) {
  matches <- regexpr(regex, source, perl=TRUE);
  result <- attr(matches, "capture.start")[, 1]
  attr(result, "match.length") <- attr(matches, "capture.length")[, 1]
  observed_string <- regmatches(source, result)
  return( observed_string )
}

#' @export
#' @describeIn extract Generalizable function to return a single numeric value.
extract_scalar_float <- function( regex, source ) {
  return( as.numeric(extract_scalar_string(regex, source)) )
}


#' @export
#' @describeIn extract Determine the estimate, standard error, z-score, and two-tailed p-value of an estimate (ie, the results of a Wald test).
extract_named_wald <- function( parameter_name, mplus_output ) {
  # regex <- paste0("\\s+R_IPIC\\s+(?<point>-?\\d+\\.\\d+)\\s+(?<se>-?\\d+\\.\\d+)\\s+(?<z>-?\\d+\\.\\d+)\\s+(?<p>\\d\\.\\d+)")
  regex <- paste0("\\s+", parameter_name, "\\s+(?<point>-?\\d+\\.\\d+)\\s+(?<se>-?\\d+\\.\\d+)\\s+(?<z>-?\\d+\\.\\d+)\\s+(?<p>\\d\\.\\d+)")
  matches <- regexpr(regex, mplus_output, perl=TRUE)
  
  # # Failed attempt to reduce calls
  # attr(result_point, "match.length") <- attr(matches, "capture.length")[1, "point"]
  # point <- regmatches(mplus_output, result_point)

  # Extract point estimate
  result_point <- attr(matches, "capture.start")[1, "point"]
  attr(result_point, "match.length") <- attr(matches, "capture.length")[1, "point"]
  point <- regmatches(mplus_output, result_point)
  
  # Extract standard error
  result_se <- attr(matches, "capture.start")[1, "se"]
  attr(result_se, "match.length") <- attr(matches, "capture.length")[1, "se"]
  se <- regmatches(mplus_output, result_se)
  
  # Extract z
  result_z <- attr(matches, "capture.start")[1, "z"]
  attr(result_z, "match.length") <- attr(matches, "capture.length")[1, "z"]
  z <- regmatches(mplus_output, result_z)
  
  # Extract p
  result_p <- attr(matches, "capture.start")[1, "p"]
  attr(result_p, "match.length") <- attr(matches, "capture.length")[1, "p"]
  p <- regmatches(mplus_output, result_p)
  
  wald <- list("point"=point, "se"=se, "z"=z, "p"=p)
  return( wald )
}

#' @export
#' @describeIn extract Determine the path of the Mplus output file.
extract_output_filename <- function( mplus_output, regex="\\s+DATA:\\s+File = (.+);.*" ) {
  # Regex notes
  #   - Sometimes "File" is on the line below "DATA:"
  # gsub(pattern="DATA:  File = (.+);", replacement="\\1", mplus_output, perl=T)
  extract_scalar_string(regex, mplus_output)
}

#' @export
#' @describeIn extract Determine the number of free parameters for the model estimation.
extract_free_parameter_count <- function( mplus_output, regex="Number of Free Parameters\\s+(\\d{1,})\\s+") {
  extract_scalar_float(regex, mplus_output)
}

#' @export
#' @describeIn extract Determine the log likelihood for the model estimation.
extract_loglikelihood <- function( mplus_output, regex="Loglikelihood\\s+H0 Value\\s+([-\\d\\.]+)\\s+" ) {
  extract_scalar_float(regex, mplus_output)
}

#' @export
#' @describeIn extract Determine the H0 Scaling Correction Factor for the model estimation.
extract_scaling_correction <- function( mplus_output, regex="\\s+H0 Scaling Correction Factor\\s+([-\\d\\.]+)\\s+for MLR\\s+" ) {
  matched_string <- extract_scalar_string(regex, mplus_output)
  matched_float <- ifelse(length(matched_string>0), as.numeric(matched_string), NA_real_)
  
  return( matched_float )
}

#' @export
#' @describeIn extract Determine the AIC for the model estimation.
extract_aic <- function( mplus_output, regex="Akaike \\(AIC\\)\\s+([-\\d\\.]+)\\s+" ) {
  extract_scalar_float(regex, mplus_output)
}

#' @export
#' @describeIn extract Determine the BIC for the model estimation.
extract_bic <- function( mplus_output, regex="Bayesian \\(BIC\\)\\s+([-\\d\\.]+)\\s+" ) {
  extract_scalar_float(regex, mplus_output)
}

#' @export
#' @describeIn extract Determine the Sample-Size Adjusted BIC for the model estimation.
extract_bic_adjusted <- function( mplus_output, regex="\\s+Sample-Size Adjusted BIC\\s+([-\\d\\.]+)\\s+" ) {
  # regex = "\\s+Sample-Size Adjusted BIC\\s+(\\d+(\\.\\d+)?)\\s+"
  # regex = "\\s+Sample-Size Adjusted BIC\\s+(.+)\\s+"
  extract_scalar_float(regex, mplus_output)
}
