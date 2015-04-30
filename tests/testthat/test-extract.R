library(testthat)

context("Extract")

path_1 <- base::file.path(devtools::inst(name="IalsaSynthesis"), "test_data/2015-portland/b1_female_ae_muscle_fluid_grip_trailsb.out")
path_2 <- base::file.path(devtools::inst(name="IalsaSynthesis"), "test_data/2015-portland/b1_male_aehplus_muscle_memory_grip_logicalmemory.out")
path_3 <- base::file.path(devtools::inst(name="IalsaSynthesis"), "test_data/2015-portland/u1_male_aehplus_muscle_noCog_hand_noCogSpec.out")
output_1 <- readLines(path_1)
output_2 <- readLines(path_2)
output_3 <- readLines(path_3)

test_that("Path Data File", {   
  expected_1 <- "C:\\Users\\Dragon Hat\\Desktop\\CbaMaster.csv"
  expected_2 <- "C:\\Users\\Andrea Zammit\\Desktop\\EASMaster.csv"
  expected_3 <- "\"C:\\Users\\wuche\\Dropbox\\IALSA\\Data\\HABC-9999.dta.dat\"" #Notice this one has a fishy extension and enclosing quotes.
  
  snippet_1 <- "        TITLE: m5, b1,trails, peak flow, LGM,ae Conditional,female

        DATA:  File = C:\\Users\\Dragon Hat\\Desktop\\CbaMaster.csv;


        VARIABLE: Names are
          ! demographics
          SubjectID	Sex	Ethnic	Caus	DemEver	Bagesq	deathage	DEMO23	Educyrs	Status	"

  observed_from_snippet_1 <- IalsaSynthesis::extract_output_filename(snippet_1)
  observed_from_file_1 <- IalsaSynthesis::extract_output_filename(output_1)
  observed_from_file_2 <- IalsaSynthesis::extract_output_filename(output_2)
  observed_from_file_3 <- IalsaSynthesis::extract_output_filename(output_3)
  
  expect_equal(observed_from_snippet_1, expected_1, "The data file path extracted from the snippet should be correct.")
  expect_equal(observed_from_file_1, expected_1, "The data file path extracted from the first output file should be correct.")
  expect_equal(observed_from_file_2, expected_2, "The data file path extracted from the second output file should be correct.")
  expect_equal(observed_from_file_3, expected_3, "The data file path extracted from the third output file should be correct.")
})
