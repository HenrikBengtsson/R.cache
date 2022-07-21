# aroma.core

<details>

* Version: 3.2.2
* GitHub: https://github.com/HenrikBengtsson/aroma.core
* Source code: https://github.com/cran/aroma.core
* Date/Publication: 2021-01-05 05:10:12 UTC
* Number of recursive dependencies: 48

Run `revdep_details(, "aroma.core")` for more info

</details>

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      'sfit', 'expectile', 'HaarSeg', 'mpcbs'
    ```

# clampSeg

<details>

* Version: 1.1-1
* GitHub: NA
* Source code: https://github.com/cran/clampSeg
* Date/Publication: 2022-01-27 23:10:06 UTC
* Number of recursive dependencies: 39

Run `revdep_details(, "clampSeg")` for more info

</details>

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Vignette.ltx’ using tex
    Error: processing vignette 'Vignette.ltx' failed with diagnostics:
    Running 'texi2dvi' on 'Vignette.ltx' failed.
    LaTeX errors:
    ! LaTeX Error: File `IEEEtran.cls' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: cls)
    ...
    l.5 ^^M
           
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘Vignette.ltx’
    
    SUMMARY: processing the following file failed:
      ‘Vignette.ltx’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# csodata

<details>

* Version: 1.2.3
* GitHub: NA
* Source code: https://github.com/cran/csodata
* Date/Publication: 2022-06-10 15:40:02 UTC
* Number of recursive dependencies: 109

Run `revdep_details(, "csodata")` for more info

</details>

## In both

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘quick_start_guide.Rmd’ using rmarkdown
    trying URL 'https://opendata.arcgis.com/datasets/62e0cf326bab442897944e4dc4999c16_2.zip'
    Quitting from lines 64-74 (quick_start_guide.Rmd) 
    Error: processing vignette 'quick_start_guide.Rmd' failed with diagnostics:
    Object shp is neither from class sf, stars, Spatial, Raster, nor SpatRaster.
    --- failed re-building ‘quick_start_guide.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘quick_start_guide.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# DiceView

<details>

* Version: 2.0-1
* GitHub: https://github.com/IRSN/DiceView
* Source code: https://github.com/cran/DiceView
* Date/Publication: 2020-11-27 16:30:02 UTC
* Number of recursive dependencies: 16

Run `revdep_details(, "DiceView")` for more info

</details>

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘rgl’
    ```

# mirTarRnaSeq

<details>

* Version: 1.4.0
* GitHub: NA
* Source code: https://github.com/cran/mirTarRnaSeq
* Date/Publication: 2022-04-26
* Number of recursive dependencies: 232

Run `revdep_details(, "mirTarRnaSeq")` for more info

</details>

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘mirTarRnaSeq-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: mirRnaHeatmap
    > ### Title: mirRnaHeatmap pheatmap for miRTarRNASeq miRNA and mRNA
    > ###   correlation
    > ### Aliases: mirRnaHeatmap
    > ### Keywords: color, correlation heatmap, pheatmap, plot,correlation_plot
    > 
    > ### ** Examples
    > 
    > x <- mirRnaHeatmap(corr_0)
    Error in loadNamespace(x) : there is no package called ‘viridis’
    Calls: mirRnaHeatmap ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
    Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘mirTarRnaSeq.Rmd’ using rmarkdown
    Quitting from lines 17-36 (mirTarRnaSeq.Rmd) 
    Error: processing vignette 'mirTarRnaSeq.Rmd' failed with diagnostics:
    there is no package called 'viridis'
    --- failed re-building ‘mirTarRnaSeq.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘mirTarRnaSeq.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.0Mb
      sub-directories of 1Mb or more:
        data   3.6Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Package in Depends field not imported from: ‘ggplot2’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking for unstated dependencies in vignettes ... NOTE
    ```
    'library' or 'require' calls not declared from:
      ‘tidyr’ ‘viridis’
    ```

# MSnID

<details>

* Version: 1.30.0
* GitHub: NA
* Source code: https://github.com/cran/MSnID
* Date/Publication: 2022-04-26
* Number of recursive dependencies: 150

Run `revdep_details(, "MSnID")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘BiocGenerics’ ‘BiocStyle’ ‘RUnit’ ‘ggplot2’ ‘msmsTests’ ‘xtable’
      All declared Imports should be used.
    ```

*   checking R code for possible problems ... NOTE
    ```
    .read_mzIDs.mzR.engine.single.file: no visible binding for global
      variable ‘peptideRef’
    Undefined global functions or variables:
      peptideRef
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘handling_mods.Rnw’ using Sweave
    Loading required package: Rcpp
    
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    ...
    l.189 \RequirePackage
                         {parnotes}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘msnid_vignette.Rnw’
    
    SUMMARY: processing the following files failed:
      ‘handling_mods.Rnw’ ‘msnid_vignette.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# precommit

<details>

* Version: 0.3.2
* GitHub: https://github.com/lorenzwalthert/precommit
* Source code: https://github.com/cran/precommit
* Date/Publication: 2022-07-01 21:30:06 UTC
* Number of recursive dependencies: 95

Run `revdep_details(, "precommit")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘here’
      All declared Imports should be used.
    ```

# QDNAseq

<details>

* Version: 1.32.0
* GitHub: https://github.com/ccagc/QDNAseq
* Source code: https://github.com/cran/QDNAseq
* Date/Publication: 2022-04-26
* Number of recursive dependencies: 82

Run `revdep_details(, "QDNAseq")` for more info

</details>

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      'QDNAseq.hg19', 'QDNAseq.mm10'
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘QDNAseq.Rnw’ using Sweave
    EM algorithm started ... 
    
    Warning in allprior/tot :
      Recycling array of length 1 in vector-array arithmetic is deprecated.
      Use c() or as.vector() instead.
    
    Warning in allprior/tot :
      Recycling array of length 1 in vector-array arithmetic is deprecated.
    ...
    l.189 \RequirePackage
                         {parnotes}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘QDNAseq.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘QDNAseq.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# R.rsp

<details>

* Version: 0.45.0
* GitHub: https://github.com/HenrikBengtsson/R.rsp
* Source code: https://github.com/cran/R.rsp
* Date/Publication: 2022-06-27 18:30:09 UTC
* Number of recursive dependencies: 23

Run `revdep_details(, "R.rsp")` for more info

</details>

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘R_packages-Static_PDF_and_HTML_vignettes.pdf.asis’ using asis
    --- finished re-building ‘R_packages-Static_PDF_and_HTML_vignettes.pdf.asis’
    
    --- re-building ‘R_packages-LaTeX_vignettes.ltx’ using tex
    Error: processing vignette 'R_packages-LaTeX_vignettes.ltx' failed with diagnostics:
    Running 'texi2dvi' on 'R_packages-LaTeX_vignettes.ltx' failed.
    LaTeX errors:
    ! Undefined control sequence.
    l.21 \pdfsuppressptexinfo
    ...
     ...                                              
    --- failed re-building ‘R_packages-Vignettes_prior_to_R300.tex.rsp’
    
    SUMMARY: processing the following files failed:
      ‘R_packages-LaTeX_vignettes.ltx’
      ‘Dynamic_document_creation_using_RSP.tex.rsp’ ‘RSP_refcard.tex.rsp’
      ‘R_packages-Vignettes_prior_to_R300.tex.rsp’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# RKorAPClient

<details>

* Version: 0.7.2
* GitHub: https://github.com/KorAP/RKorAPClient
* Source code: https://github.com/cran/RKorAPClient
* Date/Publication: 2022-03-01 18:30:08 UTC
* Number of recursive dependencies: 118

Run `revdep_details(, "RKorAPClient")` for more info

</details>

## In both

*   checking tests ...
    ```
      Running ‘testthat.R’
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library("testthat")
      > library("RKorAPClient")
      > 
      > test_check("RKorAPClient")
      <KorAPConnection> 
      apiUrl:  https://korap.ids-mannheim.de/api/v1.0/ 
    ...
       11.       └─RKorAPClient::apiCall(...)
       12.         └─RKorAPClient (local) .local(kco, ...)
       13.           └─jsonlite::fromJSON(content(resp, "text", encoding = "UTF-8"))
       14.             └─jsonlite:::parse_and_simplify(...)
       15.               └─jsonlite:::parseJSON(txt, bigint_as_char)
       16.                 └─jsonlite:::parse_string(txt, bigint_as_char)
      
      [ FAIL 1 | WARN 0 | SKIP 27 | PASS 24 ]
      Error: Test failures
      Execution halted
    ```

# stepR

<details>

* Version: 2.1-3
* GitHub: NA
* Source code: https://github.com/cran/stepR
* Date/Publication: 2022-05-05 23:50:02 UTC
* Number of recursive dependencies: 43

Run `revdep_details(, "stepR")` for more info

</details>

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘StepR.Rnw’ using knitr
    Successfully loaded stepR package version 2.1-3.
    Several new functions are added in version 2.0-0. Some older functions are deprecated (still working) and may be defunct in a later version. Please read the documentation for more details.
    Error: processing vignette 'StepR.Rnw' failed with diagnostics:
    Running 'texi2dvi' on 'StepR.tex' failed.
    LaTeX errors:
    ! LaTeX Error: File `bbold.sty' not found.
    
    ...
    l.72 ^^M
            
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘StepR.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘StepR.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 14.2Mb
      sub-directories of 1Mb or more:
        libs  13.2Mb
    ```

# TreeTools

<details>

* Version: 1.7.3
* GitHub: https://github.com/ms609/TreeTools
* Source code: https://github.com/cran/TreeTools
* Date/Publication: 2022-07-20 14:30:15 UTC
* Number of recursive dependencies: 73

Run `revdep_details(, "TreeTools")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.1Mb
      sub-directories of 1Mb or more:
        R      1.0Mb
        libs   8.3Mb
    ```

