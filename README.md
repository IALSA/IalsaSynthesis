<!-- rmarkdown v1 -->

| [GitHub](https://github.com/IALSA/IalsaSynthesis) | [Travis-CI](https://travis-ci.org/IALSA/IalsaSynthesis/builds) | [AppVeyor](https://ci.appveyor.com/project/wibeasley/ialsasynthesis/history) | [Wercker](https://app.wercker.com/project/bykey/8010c64ba8d5d36495614496c9dff4a8) | [Coveralls](https://coveralls.io/r/IALSA/IalsaSynthesis) | [Codecov](https://codecov.io/github/IALSA/IalsaSynthesis) |
| :----- | :---------------------------: | :------------: | :-------: | :-------: | :-------: |
| [Master](https://github.com/IALSA/IalsaSynthesis/tree/master) |  [![Travis-CI Build Status](https://travis-ci.org/IALSA/IalsaSynthesis.png?branch=master)](https://travis-ci.org/IALSA/IalsaSynthesis) | [![Build status](https://ci.appveyor.com/api/projects/status/8u5m65k0rr2veahx/branch/master?svg=true)](https://ci.appveyor.com/project/wibeasley/ialsasynthesis/branch/master) | [![wercker status](https://app.wercker.com/status/8010c64ba8d5d36495614496c9dff4a8/s/master "wercker status")](https://app.wercker.com/project/bykey/8010c64ba8d5d36495614496c9dff4a8) | [![Coverage Status](https://coveralls.io/repos/IALSA/IalsaSynthesis/badge.svg?branch=master)](https://coveralls.io/r/IALSA/IalsaSynthesis?branch=master) | [![codecov.io](http://codecov.io/github/IALSA/IalsaSynthesis/coverage.svg?branch=master)](http://codecov.io/github/IALSA/IalsaSynthesis?branch=master) |
| [Dev](https://github.com/IALSA/IalsaSynthesis/tree/dev) | [![Travis-CI Build Status](https://travis-ci.org/IALSA/IalsaSynthesis.png?branch=dev)](https://travis-ci.org/IALSA/IalsaSynthesis) | [![Build status](https://ci.appveyor.com/api/projects/status/8u5m65k0rr2veahx/branch/dev?svg=true)](https://ci.appveyor.com/project/wibeasley/ialsasynthesis/branch/dev) | [![wercker status](https://app.wercker.com/status/8010c64ba8d5d36495614496c9dff4a8/s/dev "wercker status")](https://app.wercker.com/project/bykey/8010c64ba8d5d36495614496c9dff4a8) | [![Coverage Status](https://coveralls.io/repos/IALSA/IalsaSynthesis/badge.svg?branch=dev)](https://coveralls.io/r/IALSA/IalsaSynthesis?branch=dev) | [![codecov.io](http://codecov.io/github/IALSA/IalsaSynthesis/coverage.svg?branch=dev)](http://codecov.io/github/IALSA/IalsaSynthesis?branch=dev) |
| | *Ubuntu LTS* | *Windows Server* | *Docker* | *Travis Tests* | *Wercker Tests* |


IalsaSynthesis
====================

An [R](http://www.r-project.org/) package for synthesizing information across collaborating research.

[![logo](man/figures/ialsa-wide.png)](https://www.maelstrom-research.org/mica/network/ialsa#/)

[IALSA](https://www.nia.nih.gov/research/resource/integrative-analysis-longitudinal-studies-aging-ialsa) (Integrative Analysis of Longitudinal Studies of Aging) research network unites approximately 100 longtidinal studies from all over the world.  IALSA makes primary use of a [coordinated analysis approach](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2773828/) and various [harmonization methods](https://www.maelstrom-research.org/repository/methods_library). Our projects involve dealing with multiple longitudinal studies, each of which may count numerous statistical models, making the synthesis of results particularly arduous. The `IalsaSynthesis` package offers software tools for extracting, pooling, evaluating, and reporting the results of a large number of statistical models. See out [flagship project](https://github.com/IALSA/IALSA-2015-Portland), stemming from coordinated analysis workshop in Portland in February of 2015.

### Package Crew

[Will Beasley](https://www.researchgate.net/profile/William_Beasley2) (*[University of Oklahoma Health Sciences Center](https://ouhsc.edu/), [Department of Pediatrics](https://www.oumedicine.com/department-of-pediatrics), [Biomedical & Behavioral Research Core](http://ouhsc.edu/BBMC/)*)

[Andriy Koval](https://www.researchgate.net/profile/Andrey_Koval) ([University of Victoria](http://www.uvic.ca/), [Institute on Aging and Lifelong Health](http://www.uvic.ca/aging/)*).


### Download and Installation Instructions

| [CRAN](http://cran.rstudio.com/) | [Version](https://cran.r-project.org/package=IalsaSynthesis) | [Rate](http://cranlogs.r-pkg.org/) | [Zenodo](https://zenodo.org/search?ln=en&p=ialsasynthesis) |
|  :---- | :----: | :----: | :----: |
| [Latest](https://cran.r-project.org/package=IalsaSynthesis) | [![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/IalsaSynthesis)](https://cran.r-project.org/package=IalsaSynthesis) | ![CRANPace](http://cranlogs.r-pkg.org/badges/IalsaSynthesis) |  [![DOI](https://zenodo.org/badge/34798650.svg)](https://zenodo.org/badge/latestdoi/34798650) |
|   | *Latest CRAN version* | *CRAN Downloads* | *Independently-hosted Archive* |

The released CRAN version of IalsaSynthesis can be installed through R. (The *release* version will be available on [CRAN](https://cran.rstudio.com/) closer to the Gothenburg conference.)

```R
install.packages("IalsaSynthesis")
```

The latest development version of IalsaSynthesis can be installed from [GitHub](https://github.com/IALSA/IalsaSynthesis) after installing the `devtools` package.

```R
install.packages("devtools") #If it's not already installed.
devtools::install_github(repo="IALSA/IalsaSynthesis")
```

The package documentation for the [development version](documentation-peek.pdf) on GitHub can be viewed without installing the package.

### Collaborative Development
Consistent with IALSA goals, we encourage input and collaboration from the overall community.  If you're familar with GitHub and R packages, feel free to submit a [pull request](https://github.com/IALSA/IalsaSynthesis/pulls).  If you'd like to report a bug or make a suggestion, please create a GitHub [issue](https://github.com/IALSA/IalsaSynthesis/issues); issues are a usually a good place to ask public questions too.  However, feel free to email Andrey or Will privately (<andkov@uvic.ca> or <wibeasley@hotmail.com>).

### Thanks to Funders
IALSA is funded through an NIH/NIA Program Project Grant ([P01AG043362](https://projectreporter.nih.gov/project_info_description.cfm?aid=8414933&icde=18870651&ddparam=&ddvalue=&ddsub=&cr=3&csb=default&cs=ASC); 2013-2018) to Oregon Health & Science University (Program Directors: [Scott Hofer](https://www.maelstrom-research.org/mica/network/ialsa#/users/hofer), [Andrea Piccinin](https://www.maelstrom-research.org/mica/network/ialsa#/users/piccinin), [Jeffrey Kaye](https://www.maelstrom-research.org/mica/network/ialsa#/users/kaye), and [Diana Kuh](https://www.maelstrom-research.org/mica/network/ialsa#/users/kuh)) and previously funded by NIH/NIA ([R01AG026453](https://projectreporter.nih.gov/project_info_description.cfm?aid=7210005&icde=19139556&ddparam=&ddvalue=&ddsub=&cr=5&csb=default&cs=ASC); 2007-2013) and CIHR (103284; 2010-2013).

### Code Coverage Over Time

Master Branch:

![codecov.io](http://codecov.io/github/IALSA/IalsaSynthesis/branch.svg?branch=master)

Dev Branch:

![codecov.io](http://codecov.io/github/IALSA/IalsaSynthesis/branch.svg?branch=dev)
