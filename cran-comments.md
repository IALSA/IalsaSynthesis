## Description
This submission introduces the package to CRAN.  It will contain the workhorse functions for [IALSA](https://github.com/IALSA) conferences (eg, https://github.com/IALSA/IALSA-2015-Portland).

Please tell me if there's something else I should do for CRAN.  -Will Beasley

## Test environments
* Local Win8, R 3.2.2 patched
* win-builder (version="R-devel"); http://win-builder.r-project.org/c96Uk9Nda9s1
* Travis CI, Ubuntu 12.04 LTS; https://travis-ci.org/IALSA/IalsaSynthesis/builds
* AppVeyor, Windows Server 2012; https://ci.appveyor.com/project/wibeasley/ialsasynthesis/history
* Wercker, Docker; https://app.wercker.com/#applications/5562b43349f5656573003aab

## R CMD check results
* No ERRORs or WARNINGs on any builds.
* No NOTEs on win-builder.
* No other unexplainable NOTEs on the other builds.

## Downstream dependencies
No other packages depend/import this one.
