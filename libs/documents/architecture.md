---
title: Proposed Architecture of Synethesis Ecosystem for [IALSA](http://www.ialsa.org/)
author: Will Beasley
date: 2015-05-15
output:
  html_document:
    keep_md: yes
    toc: yes
---


## Pre-conference skeleton
* Runs on OU REDCap server & IALSA server/cruncher
* REDCap Survey sent to each study
* Collects study characteristics (eg, gender(s) and variables)
* Establishes TODO list (eg, models that each study needs to submit by the middle of the conference)

## Accept incoming model results 
  * Hosted on Dropbox, fileserver, or maybe even REDCap
  
## `IalsaSynthesis` R Package
* Runs on client laptops (which is why deployment through a package is important)
* Parse/extract results
* Validate results
* Upload to server
* Possibly helps automate some of the Mplus modeling code

## Project/conference specific goals (eg Ialsa-2015-Portland repo)
* Runs on central IALSA server/cruncher
* Collect all models within a study
* Collect all studies within the conference
* Prepares groomed datasets for the Shiny and knitr reports.
* Pushes groomed datasets to Shiny
* This unmanned mechanism runs on a timer
* There are still some code that lives in the IalsaSynthesis package, but runs on the server.  Some boundaries are still fuzzy to me.

## `IalsaPresentation` Shiny reports
* Runs on OU Shiny server
* Periodically refreshes its reports with new data
* Focuses on presentation of groomed datasets; contains very little manipulation.
* “Data Collector level” reports showing a study’s TODO list & progress history (OU’s data collectors are the ones directly responsible for all input) 
    *	eg, Show which models are been uploaded
    *	eg, show which uploaded models are valid/invalid
    *	eg, ideally suggest how to fix invalid model results
* “La Chanda level” reports showing the conference’s progress (La Chanda is the immediately supervisor/champion/cheerleader for the data collectors)
* Meta-analysis level reports

## Websites of static knitr reports 
* Runs on server/cruncher; hosted on IALSA website
* Focuses on presentation of groomed datasets; contains very little manipulation.
* Knitr reports themselves
* Workflow that delivers data to the reports
* Workflow that distributes reports to the webserver


