---
title: Proposed Architecture of Synthesis Ecosystem for [IALSA](http://www.ialsa.org/)
date: 2015-05-15
output:
  html_document:
    keep_md: yes
    toc: yes
---


Pre-conference Preparation
=============================================

Before the conference starts, each participating study completes a online survey.  This **Pre-conference Survey** will be the first of two REDCap projects they interact with.  Participants enter metadata about their study (eg, sample size, study length, list of cognitive & physical variables).  This metadata is exported from REDCap into R, where it is assembled to produce a todo list for each study.  The list enumerates all the models and tasks the participants ideally will submit for the workshop.  The todo list informs the **Catalog**, which is the second REDCap project (discussed below).

For instance, assume the upcoming Tehran conference focused on the bivariate relationship between each cognitive and physical variable.  If study ABBA declared they collected three cognitive and four physical variables, the resulting skeleton would consist of 12 rows, each corresponding to a bivariate model.  Each conference will have different goals, so each pre-conference survey will be different, and the survey responses will be combined differently to produce an appropriate todo list.

As Andrey observed, it may not be feasible for 'wide' studies to combine everything, and the todo list should prioritize the more important models to be estimated.  The current plan is to emphasize models that are addressable by the largest number of studies.  From IALSA's perspective, it's better to have the one model informed by six studies, than three models informed by two studies a piece.  Based on feedback from participants, additional criteria might influence the prioritization.

*Details*

* The "Pre-conference Survey" and "Catalog" are hosted on OU's REDCap server.
* The manipulation is probably run on an IALSA machine (ie, the **Cruncher**).  A laptop will be adequate.
* Pre-conference Survey.
    * One record per study.
    * Multi-select checkboxes record the study's variables (eg, gender(s) and physical & cognitive variables)
* Catalog.
    * One record per model (so a typical study will have at least 12 records).
    * The Cruncher will create each record, and complete the model descriptions (eg, `study_name`, `physical_variable`, `cognitive_variable`)
    * Fields for a model's results will be blank initial, and completed during the conference (eg `aic`, `bic`, `var_physical`, `beta_physical`, `se_physical`)
    * If a conference is pursuing a diverse collection of models, we might need multiple catalogs (eg, one for the univariate models, and one for the trivariate models).


IalsaSynthesis R Package
=============================================

The [`IalsaSynthesis`](https://github.com/IALSA/IalsaSynthesis) R package will provide functions run by participants on their own computers, and will be used across multiple conferences and workshops.  The functions we develop and distribute will help us keep IALSA participants using similar functions across many years, even as the list of functions is modified and grown.  Participants will be able to update to the latest package by running one line of code (`devtools::install_github("IALSA/IalsaSynthesis")`).

The R package will contain only sample data; real data belongs in the conference-specific repositories.  It will be developed primarily by UVic employees and collaborators (eg, Will & Andrey), but contributions are welcomed from anyone using  GitHub [pull requests](https://github.com/IALSA/IalsaSynthesis/pulls?utf8=%E2%9C%93&q=is%3Apr+).  For the sake of reproducibility, all IALSA reports include the "Session Info", which document the specific version of each package used in the report, including `IalsaSynethesis`.

The boundaries are still being worked out between the `IalsaSynthesis` package and the conference-specific repositories.  The types of functionality likely provided by the R package include:

  * Parse/extract model results in the output files (eg, the Mplus *.out files)
  * Validate and check model results for internal consistency
  * Upload results to the correct record in the Study Catalog (ie, the 2nd REDCap project)
  * Possibly automate the construction of some of the Mplus modeling code.
  * Validate the client computer has the most recently versions of R and the packages.


Collect Model Results
=============================================
The output from each model needs to be stored centrally for at least two reasons.  From a theoretical perspective, they're needed a record in case subsequent research can build off them.  For a practical perspective, the output might need to be reparsed, if we want to correct the parsing functions or gather additional coefficients.

The output files to be parsed on the participant's computer, via the `IalsaSynthesis` package.  For the sake of redundancy, the client will upload both the (a) extracted coefficients into specific Catalog fields, and the (b) entire output file into a large text field.  The ultimate goal is for the `IalsaSynthesis` package to upload everything, and the participant never goes to the REDCap web browser.  However we'll always offer the option to manually enter values (through the web browser) in case the parsing routines have trouble with an output file.

If this automation is too brittle initially, we'll revert back to the Portland 2015 approach.  Participants will upload the output files to Dropbox or some file server.  The UVic team (eg, Will, Andrey, ...) will execute the parsing routines to extract the results.


Conference/Project Specific Repositories (eg Ialsa-2015-Portland repo)
=============================================

* Runs on central IALSA server/cruncher
* Collect all models within a study
* Collect all studies within the conference
* Prepares groomed datasets for the Shiny and knitr reports.
* Pushes groomed datasets to Shiny
* This unmanned mechanism runs on a timer
* There are still some code that lives in the IalsaSynthesis package, but runs on the server.  Some boundaries are still fuzzy to me.


IalsaPresentation Repository of Shiny Reports
=============================================

* Runs on OU Shiny server
* Periodically refreshes its reports with new data
* Focuses on presentation of groomed datasets; contains very little manipulation.
* “Data Collector level” reports showing a study’s TODO list & progress history (OU’s data collectors are the ones directly responsible for all input) 
    *	eg, Show which models are been uploaded
    *	eg, show which uploaded models are valid/invalid
    *	eg, ideally suggest how to fix invalid model results
* “La Chanda level” reports showing the conference’s progress (La Chanda is the immediately supervisor/champion/cheerleader for the data collectors)
* Meta-analysis level reports


Websites of Static knitr Reports
=============================================
* Runs on server/cruncher; hosted on IALSA website
* Focuses on presentation of groomed datasets; contains very little manipulation.
* knitr reports themselves
* Workflow that delivers data to the reports
* Workflow that distributes reports to the webserver


