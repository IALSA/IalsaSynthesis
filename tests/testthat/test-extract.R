library(testthat)

context("Extract")

path_1 <- base::file.path(devtools::inst(name="IalsaSynthesis"), "test_data/2015-portland/b1_female_a_grip_categories_4.out")
path_2 <- base::file.path(devtools::inst(name="IalsaSynthesis"), "test_data/2015-portland/b1_female_aehplus_gait_grip.out")
path_3 <- base::file.path(devtools::inst(name="IalsaSynthesis"), "test_data/2015-portland/b1_female_aehplus_grip_gait.out")
output_1 <- readr::read_file(path_1)
output_2 <- readr::read_file(path_2)
output_3 <- readr::read_file(path_3)


snippet_fit_1 <- 
"THE MODEL ESTIMATION TERMINATED NORMALLY
MODEL FIT INFORMATION
Number of Free Parameters                       23
Loglikelihood
          H0 Value                      -21788.910
          H0 Scaling Correction Factor      1.1594
            for MLR
Information Criteria
          Akaike (AIC)                   43623.820
          Bayesian (BIC)                 43736.928
          Sample-Size Adjusted BIC       43663.878
            (n* = (n + 2) / 24)
MODEL RESULTS
                                                    Two-Tailed
                    Estimate       S.E.  Est./S.E.    P-Value"

snippet_new_parameters <- 
"New/Additional Parameters
    R_IPIC             0.146      0.040      3.608      0.000
    R_SPSC             0.038      0.235      0.161      0.872
    R_RES_PC           0.051      0.033      1.566      0.117
QUALITY OF NUMERICAL RESULTS"

test_that("parameter_estimate", {   
  
  
  
  
  tolerance <- 0.001
  expected_1 <- c(0.146, 0.040, 3.608, 0.000)
#   expected_2 <- -23971.552
  # expected_3 <- -2700.358
  
  observed_from_snippet_1 <- IalsaSynthesis::extract_named_parameter("R_IPIC", snippet_new_parameters)
  observed_from_file_1 <- IalsaSynthesis::extract_named_parameter("R_IPIC", output_1)
  # observed_from_file_2 <- IalsaSynthesis::extract_loglikelihood(output_2)
  # observed_from_file_3 <- IalsaSynthesis::extract_loglikelihood(output_3)
  
  expect_equal(as.numeric(observed_from_snippet_1), expected_1, info="The free parameter count extracted from the snippet should be correct.", tolerance=tolerance)
  expect_equal(as.numeric(observed_from_file_1), expected_1, info="The loglikelihood extracted from the first output file should be correct.", tolerance=tolerance)
  # expect_equal(observed_from_file_2, expected_2, info="The loglikelihood extracted from the second output file should be correct.", tolerance=tolerance)
  # expect_equal(observed_from_file_3, expected_3, info="The loglikelihood extracted from the third output file should be correct.", tolerance=tolerance)
})

test_that("Path Data File", {   
  expected_1 <- "radcMAP_wide.dat"
  expected_2 <- "\"C:\\Users\\wuche\\Dropbox\\IALSA\\Data\\HABC-9999.dta.dat\"" #Notice this one has a fishy extension and enclosing quotes.
  expected_3 <- "C:\\Users\\Andrea Zammit\\Desktop\\EASMaster.csv"
  
  snippet_1 <- "INPUT INSTRUCTIONS
    TITLE: M6 Pulmonary Function, Grip, Fully Conditional, Male
    DATA:  File = radcMAP_wide.dat;
    VARIABLE: Names are
  projid study_x scaled_to_x agreeableness conscientiousness extraversion"
  
  observed_from_snippet_1 <- IalsaSynthesis::extract_output_filename(snippet_1)
  observed_from_file_1 <- IalsaSynthesis::extract_output_filename(output_1)
  observed_from_file_2 <- IalsaSynthesis::extract_output_filename(output_2)
  observed_from_file_3 <- IalsaSynthesis::extract_output_filename(output_3)
  
  expect_equal(observed_from_snippet_1, expected_1, "The data file path extracted from the snippet should be correct.")
  expect_equal(observed_from_file_1, expected_1, "The data file path extracted from the first output file should be correct.")
  expect_equal(observed_from_file_2, expected_2, "The data file path extracted from the second output file should be correct.")
  expect_equal(observed_from_file_3, expected_3, "The data file path extracted from the third output file should be correct.")
})

test_that("Free Parameter Count", {   
  tolerance <- 0
  expected_1 <- 23
  expected_2 <- 61
  expected_3 <- 41
  
  observed_from_snippet_1 <- IalsaSynthesis::extract_free_parameter_count(snippet_fit_1)
  observed_from_file_1 <- IalsaSynthesis::extract_free_parameter_count(output_1)
  observed_from_file_2 <- IalsaSynthesis::extract_free_parameter_count(output_2)
  observed_from_file_3 <- IalsaSynthesis::extract_free_parameter_count(output_3)
  
  expect_equal(observed_from_snippet_1, expected_1, info="The free parameter count extracted from the snippet should be correct.", tolerance=tolerance)
  expect_equal(observed_from_file_1, expected_1, info="The free parameter count extracted from the first output file should be correct.", tolerance=tolerance)
  expect_equal(observed_from_file_2, expected_2, info="The free parameter count extracted from the second output file should be correct.", tolerance=tolerance)
  expect_equal(observed_from_file_3, expected_3, info="The free parameter count extracted from the third output file should be correct.", tolerance=tolerance)
})

test_that("Loglikelihood", {   
  tolerance <- 0.001
  expected_1 <- -21788.910
  expected_2 <- -23971.552
  expected_3 <- -2700.358
  
  observed_from_snippet_1 <- IalsaSynthesis::extract_loglikelihood(snippet_fit_1)
  observed_from_file_1 <- IalsaSynthesis::extract_loglikelihood(output_1)
  observed_from_file_2 <- IalsaSynthesis::extract_loglikelihood(output_2)
  observed_from_file_3 <- IalsaSynthesis::extract_loglikelihood(output_3)
  
  expect_equal(observed_from_snippet_1, expected_1, info="The free parameter count extracted from the snippet should be correct.", tolerance=tolerance)
  expect_equal(observed_from_file_1, expected_1, info="The loglikelihood extracted from the first output file should be correct.", tolerance=tolerance)
  expect_equal(observed_from_file_2, expected_2, info="The loglikelihood extracted from the second output file should be correct.", tolerance=tolerance)
  expect_equal(observed_from_file_3, expected_3, info="The loglikelihood extracted from the third output file should be correct.", tolerance=tolerance)
})

test_that("Scaling Correction Factor", {   
  tolerance <- 0.001
  expected_1 <- 1.1594
  expected_2 <- 1.0763
  expected_3 <- NA_real_
  
  observed_from_snippet_1 <- IalsaSynthesis::extract_scaling_correction(snippet_fit_1)
  observed_from_file_1 <- IalsaSynthesis::extract_scaling_correction(output_1)
  observed_from_file_2 <- IalsaSynthesis::extract_scaling_correction(output_2)
  observed_from_file_3 <- IalsaSynthesis::extract_scaling_correction(output_3)
  
  expect_equal(observed_from_snippet_1, expected_1, info="The Scaling Correction Factor extracted from the snippet should be NA")
  expect_equal(observed_from_file_1, expected_1, info="The Scaling Correction Factor extracted from the first output file should be correct.", tolerance=tolerance)
  expect_equal(observed_from_file_2, expected_2, info="The Scaling Correction Factor extracted from the second output file should be correct.", tolerance=tolerance)
  expect_true(is.na(observed_from_file_3), info="The Scaling Correction Factor extracted from the third output file should be NA")
})

test_that("AIC", {   
  tolerance <- 0.001
  expected_1 <- 43623.820
  expected_2 <- 48065.105
  expected_3 <- 5482.716
  
  observed_from_snippet_1 <- IalsaSynthesis::extract_aic(snippet_fit_1)
  observed_from_file_1 <- IalsaSynthesis::extract_aic(output_1)
  observed_from_file_2 <- IalsaSynthesis::extract_aic(output_2)
  observed_from_file_3 <- IalsaSynthesis::extract_aic(output_3)
  
  expect_equal(observed_from_snippet_1, expected_1, info="The AIC extracted from the snippet should be correct.", tolerance=tolerance)
  expect_equal(observed_from_file_1, expected_1, info="The AIC extracted from the first output file should be correct.", tolerance=tolerance)
  expect_equal(observed_from_file_2, expected_2, info="The AIC extracted from the second output file should be correct.", tolerance=tolerance)
  expect_equal(observed_from_file_3, expected_3, info="The AIC extracted from the third output file should be correct.", tolerance=tolerance)
})

test_that("BIC", {   
  tolerance <- 0.001
  expected_1 <- 43736.928
  expected_2 <- 48447.544
  expected_3 <- 5605.324
  
  observed_from_snippet_1 <- IalsaSynthesis::extract_bic(snippet_fit_1)
  observed_from_file_1 <- IalsaSynthesis::extract_bic(output_1)
  observed_from_file_2 <- IalsaSynthesis::extract_bic(output_2)
  observed_from_file_3 <- IalsaSynthesis::extract_bic(output_3)
  
  expect_equal(observed_from_snippet_1, expected_1, info="The BIC extracted from the snippet should be correct.", tolerance=tolerance)
  expect_equal(observed_from_file_1, expected_1, info="The BIC extracted from the first output file should be correct.", tolerance=tolerance)
  expect_equal(observed_from_file_2, expected_2, info="The BIC extracted from the second output file should be correct.", tolerance=tolerance)
  expect_equal(observed_from_file_3, expected_3, info="The BIC extracted from the third output file should be correct.", tolerance=tolerance)
})

test_that("BIC: Sample-Size Adjusted", {   
  tolerance <- 0.001
  expected_1 <- 43663.878
  expected_2 <- 48253.714
  expected_3 <- 5475.578
  
  observed_from_snippet_1 <- IalsaSynthesis::extract_bic_adjusted(snippet_fit_1)
  observed_from_file_1 <- IalsaSynthesis::extract_bic_adjusted(output_1)
  observed_from_file_2 <- IalsaSynthesis::extract_bic_adjusted(output_2)
  observed_from_file_3 <- IalsaSynthesis::extract_bic_adjusted(output_3)

  expect_equal(observed_from_snippet_1, expected_1, info="The Sample-Size Adjusted BIC extracted from the snippet should be correct.", tolerance=tolerance)
  expect_equal(observed_from_file_1, expected_1, info="The Sample-Size Adjusted BIC extracted from the first output file should be correct.", tolerance=tolerance)
  expect_equal(observed_from_file_2, expected_2, info="The Sample-Size Adjusted BIC extracted from the second output file should be correct.", tolerance=tolerance)
  expect_equal(observed_from_file_3, expected_3, info="The Sample-Size Adjusted BIC extracted from the third output file should be correct.", tolerance=tolerance)
})
