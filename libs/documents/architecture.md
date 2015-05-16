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

For instance, assume the upcoming Tehran conference focused on the bivariate relationship between each cognitive and physical variable.  If study ABBA declared they collected three cognitive and four physical variables, the resulting skeleton would consist of 12 rows, each corresponding to a bivariate model.  Each conference will have different goals, so each pre-conference survey will be different, and the survey responses will be combined differently to produce an appropriate Catalog.

As Andrey observed, it may not be feasible for 'wide' studies to combine everything, and the Catalog list should prioritize the more important models to be estimated.  The current plan is to emphasize models that are addressable by the largest number of studies.  From IALSA's perspective, it's better to have the one model informed by six studies, than three models informed by two studies a piece.  Based on feedback from participants, additional criteria might influence the prioritization.

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

The [`IalsaSynthesis`](https://github.com/IALSA/IalsaSynthesis) R package will provide functions run by participants on their own computers, and will be used across multiple conferences and workshops.  The functions we develop and distribute will help us keep IALSA participants using similar functions across many years, even as the list of functions is modified and grown.  Participants will be able to update to the latest package by running one line of code (`devtools::install_github('IALSA/IalsaSynthesis')`).

The R package will contain only sample data; real data belongs in the conference-specific repositories.  It will be developed primarily by UVic employees and collaborators (eg, Will & Andrey), but contributions are welcomed from anyone using  GitHub [pull requests](https://github.com/IALSA/IalsaSynthesis/pulls?utf8=%E2%9C%93&q=is%3Apr+).  For the sake of reproducibility, all IALSA reports include the "Session Info", which document the specific version of each package used in the report, including `IalsaSynethesis`.

The boundaries are still being worked out between the `IalsaSynthesis` package and the conference-specific repositories.  The types of functionality likely provided by the R package include:

  * Parse/extract model results in the output files (eg, the Mplus *.out files)
  * Validate and check model results for internal consistency
  * Upload results to the correct record in the Study Catalog (ie, the 2nd REDCap project)
  * Possibly automate the construction of some of the Mplus modeling code.
  * Validate the client computer has the most recently versions of R and the packages.


Collect Model Results
=============================================
Model output files should be stored centrally for at least two reasons.  From a theoretical perspective, they're needed a record in case subsequent research can build off them.  For a practical perspective, the output might need to be reparsed, if we want to correct the parsing functions or gather additional coefficients.

The output files to be parsed on the participant's computer, via the `IalsaSynthesis` package.  For the sake of redundancy, the client will upload both the (a) extracted coefficients into specific Catalog fields, and the (b) entire output file into a large text field.  The ultimate goal is for the `IalsaSynthesis` package to upload everything, and the participant never goes to the REDCap web browser.  However we'll always offer the option to manually enter values (through the web browser) in case the parsing routines have trouble with an output file.

If this automation is too brittle initially, we'll revert back to the Portland 2015 approach.  Participants will upload the output files to Dropbox or some file server.  The UVic team (eg, Will, Andrey, ...) will execute the parsing routines to extract the results.  Either way, we have an manual override.


Conference/Project Specific Repositories, (eg Ialsa-2015-Portland repo)
=============================================
Each conference will be unique, and require its own code and structure that can't be completely encapsulted in the `IalsaSytnthesis` package (above) or the `IalsaPresentation` repository (below).  Here are some of the functions that may fall in this category.  There are still some code that lives in the IalsaSynthesis package, but runs on the server.  The locations of some ideal boundaries are still fuzzy to me.

  * Collect all models within a study.
  * Collect all studies within the conference.
  * Prepare groomed datasets for the Shiny and knitr reports.
  * Push groomed datasets to Shiny.
  * This unmanned mechanism runs on a timer.
  
In many cases the `IalsaSynthesis` functions will do the heavy-lifting, but it's the responsibility of the code  in the Conference repository to call the package.


IalsaPresentation Repository of Shiny Reports
=============================================
The system's [presentation layer](http://martinfowler.com/eaaDev/SeparatedPresentation.html) has two complementary branches.  The interactive web page that is hosted on OU's [Shiny](http://shiny.rstudio.com/gallery/) server is discussed here.  The static reports are discussed in the subsequent section.  The code in this repository uses datasets that were already groomed; it contains very little manipulation.

I belive the real strength of interactive visualization is that a human decides which information to suppress.  We'll leverage this ability in at least two ways: (A) as the participants are entering data into the catalog, and (B) after all the results are collected.  Furthermore, these two levels are crossed with two more: (1) individual study-level reports and (2) overall conference-level reports.  Each of the four cells can make a contribution to understanding and to the conference experience.

#### A1 Reports: Single Study Progress Bookkeeping
During the conference, the reports will be periodically refreshed as more model results are collected and parsed (using the packge and repository described above).  The focus of the 'A1' reports is the participant's progress during the conference.  The bookkeeping mechanism guides them through the dozens of models the most run and submit.  It also indicates which submitted models contain incomplete or invalid information.

These reports also ideally

*	show which models are been uploaded
*	show which uploaded models are valid/invalid
*	suggest how to fix invalid model results

#### A2 Reports: Overall Conference Progress
Whereas an A1 report displays only one study at a time, an A2 tracks the progress of all participants.  The hope is that these time-evolving material (possibly shown on an overhead projector) emphasize the collective goals of the conference, and therefore increase the sense of comaradarie.  By showing which studies are on each stage, we hope that the leaders  are more willing to help those behind, and those behind are more likely to ask for help from the leaders.  

UVic staff can more quickly identify who needs assistance, and decide whether to help them directly, or suggest one of the leading participants help them.  This type of collaboration is championed by [Jim Mold](https://find.ouhsc.edu/Faculty.aspx?FacultyID=363) (who was a big influence on the way the [BBMC](http://www.ouhsc.edu/bbmc/) operates its research investigations and QA projects).  One of the basic ideas is that even high-performing nurses/providers can learn better techniques from inexperienced and low-performing ones, if the environment is collaborative and safe.


#### B1 Reports: Single Study Analysis
zzzz zzzzzz zz zzzzz

#### B2 Reports: Meta-analysis
zz zzzzz zzz zzzzz zz

Websites of Static knitr Reports
=============================================
* Runs on server/cruncher; hosted on IALSA website
* Focuses on presentation of groomed datasets; contains very little manipulation.
* knitr reports themselves
* Workflow that delivers data to the reports
* Workflow that distributes reports to the webserver

