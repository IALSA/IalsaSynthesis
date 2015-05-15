---
title: Proposed Architecture of Synethesis Ecosystem for [IALSA](http://www.ialsa.org/)
date: 2015-05-15
output:
  html_document:
    keep_md: yes
    toc: yes
---


Pre-conference Preparation
=============================================

Before the conference starts, each participating study completes a online survey.  This **Pre-conference Survey** will be the first of two REDCap projects they interact with.  Participants enter metadata about their study (eg, sample size, study length, list of coginitive & physcal variables).  This metadata is exported from REDCap into R, where it is assembled to produce a todo list for each study.  The list enumerates all the models and tasks the participants ideally will submit for the workshop.  The todo list informs the **Participant Agenda**, which is the second REDCap project (discussed below).

For instance, assume the upcoming Tehran conference focused on the bivariate relationship between each cognitive and physical variable.  If study ABBA declared they collected three cognitive and four physical variables, the resulting skeleton would consist of 12 rows, each corresponding to a bivariate model.  Each conference will have different goals, so each pre-conference survey will be different, and the survey responses will be combined differently to produce an appropriate todo list.

As Andrey observed, it may not be feasible for 'wide' studies to combine everything, and the todo list should prioritize the more important models to be estimated.  The current plan is to emphasize models that are addressible by the largest number of studies.  From IALSA's perspective, it's better to have the one model informed by six studies, than three models informed by two studies a piece.  Based on feedback from participants, additional criteria might influence the prioritization.

*Details*

* Runs on OU REDCap server & probably IALSA server/cruncher
* REDCap Survey sent to each participating study
* Collects study characteristics in a 1st REDCap project (eg, gender(s) and variables)
* Establishes TODO list hosted on a 2nd REDCap project (eg, models that each study needs to submit by the middle of the conference)


IalsaSynthesis R Package
=============================================

The [`IalsaSyntheis`](https://github.com/IALSA/IalsaSynthesis) R package will provide functions run by participants on their own computers, and will be used across multiple conferences and workshops.  The functions we develop and distribute will help us keep IALSA participants using similar functions across many years, even as the list of functions is modified and grown.  Participants will be able to update to the latest package by running one line of code (`devtools::install_github("IALSA/IalsaSynthesis")`).

The R package will contain only sample data; real data belongs in the conference-specific repositories.  It will be developed primarily by UVic employees and collaborators (eg, Will & Andrey), but contributions are welcomed from anyone using  GitHub [pull requests](https://github.com/IALSA/IalsaSynthesis/pulls?utf8=%E2%9C%93&q=is%3Apr+).  For the sake of reproducibility, all IALSA reports include the "Session Info", which document the specific version of each package used inthe report, including `IalsaSynethesis`.

The boundaries are still being worked out between the `IalsaSyntheisis` package and the conference-specific repositories.  The types of functionality likely provided by the R package include:

  * Parse/extract model results in the output files (eg, the Mplus *.out files)
  * Validate and check results for internal consistency
  * Upload results to the correct record in the REDCap project (for the sake of redundancy, this likely includes both the extracted coefficients, andthe entire output file)
  * Possibly automate the construction of some of the Mplus modeling code


Accept Incoming Model Results
=============================================
The output from each model need to be stored centrally for at least two reasons.  From a theoretical perspective, they're needed a record in case subsequent research can build off them.  For a practical perspective, the output might need to be reparsed, if we want to correct the parsing functions or gather additional coefficients.

Ideally, I'd like the output files to be parsed on the participant's computer, via the `IalsaSynthesis` package

*Details*

* Hosted on Dropbox, fileserver, or maybe even REDCap


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
* Knitr reports themselves
* Workflow that delivers data to the reports
* Workflow that distributes reports to the webserver


