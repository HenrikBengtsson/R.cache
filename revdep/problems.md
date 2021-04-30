# aroma.core

<details>

* Version: 3.2.2
* GitHub: https://github.com/HenrikBengtsson/aroma.core
* Source code: https://github.com/cran/aroma.core
* Date/Publication: 2021-01-05 05:10:12 UTC
* Number of recursive dependencies: 51

Run `revdep_details(, "aroma.core")` for more info

</details>

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      'sfit', 'expectile', 'HaarSeg', 'mpcbs'
    ```

# CoRegFlux

<details>

* Version: 1.6.0
* GitHub: NA
* Source code: https://github.com/cran/CoRegFlux
* Date/Publication: 2020-10-27
* Number of recursive dependencies: 91

Run `revdep_details(, "CoRegFlux")` for more info

</details>

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘CoRegFlux-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ODCurveToFluxCurves
    > ### Title: ODCurveToFluxCurves
    > ### Aliases: ODCurveToFluxCurves
    > 
    > ### ** Examples
    > 
    > data(iMM904)
    ...
    > ODtoflux<-ODCurveToFluxCurves(model = iMM904,
    + ODs = ODs,times = times, metabolites_rates = metabolites_rates)
    Joining by: metabolites_id
    Loading required package: glpkAPI
    Warning in library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE,  :
      there is no package called ‘glpkAPI’
    Error in checkDefaultMethod(solver, method, pType) : 
      package ‘glpkAPI’ not found
    Calls: ODCurveToFluxCurves ... get_fba_fluxes_from_observations -> <Anonymous> -> <Anonymous> -> .local -> sysBiolAlg
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/Test.R’ failed.
    Last 50 lines of output:
      
      Error (test_DFBAsimulationFunctions.R:19:5): Simulation without CoRegNet finishes 
      Error: package 'glpkAPI' not found
      Backtrace:
        1. testthat::expect_type(...) test_DFBAsimulationFunctions.R:19:4
        4. CoRegFlux::Simulation(...)
        5. CoRegFlux:::Simulation_Step(...)
    ...
       1. testthat::expect_true(...) test_MetabolicModelFunctions.R:13:5
       4. base::is.data.frame(...)
      ────────────────────────────────────────────────────────────────────────────────
      
      ══ Results ═════════════════════════════════════════════════════════════════════
      Duration: 134.9 s
      
      [ FAIL 6 | WARN 2 | SKIP 0 | PASS 25 ]
      Error: Test failures
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘glpkAPI’
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

# MSnID

<details>

* Version: 1.24.0
* GitHub: NA
* Source code: https://github.com/cran/MSnID
* Date/Publication: 2020-10-27
* Number of recursive dependencies: 141

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

# precommit

<details>

* Version: 0.1.3
* GitHub: https://github.com/lorenzwalthert/precommit
* Source code: https://github.com/cran/precommit
* Date/Publication: 2020-10-10 19:40:02 UTC
* Number of recursive dependencies: 88

Run `revdep_details(, "precommit")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R.cache’ ‘docopt’ ‘here’
      All declared Imports should be used.
    ```

# QDNAseq

<details>

* Version: 1.26.0
* GitHub: https://github.com/ccagc/QDNAseq
* Source code: https://github.com/cran/QDNAseq
* Date/Publication: 2020-10-27
* Number of recursive dependencies: 72

Run `revdep_details(, "QDNAseq")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘future’
      All declared Imports should be used.
    ```

# repmis

<details>

* Version: 0.5
* GitHub: https://github.com/christophergandrud/repmis
* Source code: https://github.com/cran/repmis
* Date/Publication: 2016-02-07 09:16:30
* Number of recursive dependencies: 19

Run `revdep_details(, "repmis")` for more info

</details>

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘xlsx’
    ```

# stepR

<details>

* Version: 2.1-1
* GitHub: NA
* Source code: https://github.com/cran/stepR
* Date/Publication: 2020-08-26 16:10:06 UTC
* Number of recursive dependencies: 45

Run `revdep_details(, "stepR")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 11.1Mb
      sub-directories of 1Mb or more:
        libs  10.1Mb
    ```

