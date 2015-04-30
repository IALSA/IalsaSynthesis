library(testthat)

context("Extract")

path_1 <- base::file.path(devtools::inst(name="IalsaSynthesis"), "test_data/2015-portland/b1_female_ae_muscle_fluid_grip_trailsb.out")
output_1 <- readLines(path_1)

test_that("Path Data File", {   
  expected <- "C:\\Users\\Dragon Hat\\Desktop\\CbaMaster.csv"
  
  snippet <- "        TITLE: m5, b1,trails, peak flow, LGM,ae Conditional,female

        DATA:  File = C:\\Users\\Dragon Hat\\Desktop\\CbaMaster.csv;


        VARIABLE: Names are
          ! demographics
          SubjectID	Sex	Ethnic	Caus	DemEver	Bagesq	deathage	DEMO23	Educyrs	Status	"

  observed_from_snippet <- IalsaSynthesis::extract_output_filename(snippet)
  observed_from_file_1 <- IalsaSynthesis::extract_output_filename(output_1)
  
  expect_equal(observed_from_snippet, expected, "The data file path extracted from the snippet should be correct.")
  expect_equal(observed_from_file_1, expected, "The data file path extracted from the first output file should be correct.")
})
