# CRAN submission R.cache 0.16.0

on 2022-07-21

I've verified this submission has no negative impact on any of the 21 reverse dependencies (18 from CRAN + 3 from Bioconductor).

Thanks in advance


## Notes not sent to CRAN

### R CMD check validation

The package has been verified using `R CMD check --as-cran` on:

| R version     | GitHub | R-hub    | mac/win-builder |
| ------------- | ------ | -------- | --------------- |
| 4.0.x         | L      |          |                 |
| 4.1.x         | L M W  |          |                 |
| 4.2.x         | L M W  | . M M1 . | M1 W            |
| devel         | L M W  | .        |    W            |

*Legend: OS: L = Linux, M = macOS, M1 = macOS M1, W = Windows*


R-hub checks:

```r
res <- rhub::check(platform = c(
#  "debian-clang-devel", "debian-gcc-patched", "linux-x86_64-centos-epel",
  "macos-highsierra-release-cran", "macos-m1-bigsur-release"
#  "windows-x86_64-release"
))
print(res)
```

gives

```
── R.cache 0.16.0: OK

  Build ID:   R.cache_0.16.0.tar.gz-86219c8413ff4c9b9c15ac2e2596aa39
  Platform:   macOS 10.13.6 High Sierra, R-release, CRAN's setup
  Submitted:  1m 27.6s ago
  Build time: 1m 25.7s

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

── R.cache 0.16.0: OK

  Build ID:   R.cache_0.16.0.tar.gz-5930ccc1f05d4fb398662fcf76a16492
  Platform:   Apple Silicon (M1), macOS 11.6 Big Sur, R-release
  Submitted:  1m 27.7s ago
  Build time: 58.7s

0 errors ✔ | 0 warnings ✔ | 0 notes ✔
```
