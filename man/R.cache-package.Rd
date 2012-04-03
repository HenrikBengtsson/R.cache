%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  999.package.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{R.cache-package}
\alias{R.cache-package}
\alias{R.cache}
\docType{package}

\title{Package R.cache}


\description{
  Methods for memoization, that is, caching arbitrary R objects in persistent memory.  Objects can be loaded and saved stratified on a set of hashing objects.

  \emph{Warning}:
  The Application Programming Interface (API) of the classes and methods
  in this package may change.  Classes and methods are considered either
  to be stable, or to be in beta or alpha (pre-beta) stage.
}

\section{Requirements}{
  This package requires the \pkg{R.oo} [1] and \pkg{R.utils} packages.
  For automatic generation of cache filenames, which is the most common
  usage of this package, the CRAN package \pkg{digest} is also required.
}

\section{Installation and updates}{
  To install this package, see \url{http://www.braju.com/R/}.
}

\section{To get started}{
  \itemize{
   \item{\link{loadCache}, \link{saveCache}}{
     Methods for loading and saving objects from and to the cache.
   }
   \item{\link{getCacheRootPath}, \link{setCacheRootPath}}{
     Methods for getting and setting the directory where cache
     files are stored.
   }
  }
}

\section{How to cite this package}{
  Whenever using this package, please cite [1] as

  \preformatted{@INPROCEEDINGS{BengtssonH_2003,
 author       = {Henrik Bengtsson},
 title        = {The {R.oo} package - Object-Oriented Programming
                 with References Using Standard {R} Code},
 booktitle    = {Proceedings of the 3rd International Workshop on
                 Distributed Statistical Computing (DSC 2003)},
 year         = {2003},
 editor       = {Kurt Hornik and Friedrich Leisch and Achim Zeileis},
 address      = {Vienna, Austria},
 month        = {March},
 issn         = {1609-395X},
 howpublished = {http://www.ci.tuwien.ac.at/Conferences/DSC-2003/},
}}
\emph{}

}

\section{Wishlist}{
 Here is a list of features that would be useful, but which I have
 too little time to add myself. Contributions are appreciated.
 \itemize{
   \item Add a functionality to identify cache files that are
      no longer of use.  For now, there is an extra header field
      for arbitrary comments which can be used, but maybe more
      formal fields are useful, e.g. keywords, user, etc?
 }

 If you consider implement some of the above, make sure it is not
 already implemented by downloading the latest "devel" version!
}

\section{Related work}{
 See also the \pkg{filehash} package, and the \code{cache()} function
 in the \pkg{Biobase} package of Bioconductor.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\section{License}{
  The releases of this package is licensed under
  LGPL version 2.1 or newer.

  The development code of the packages is under a private licence
  (where applicable) and patches sent to the author fall under the
  latter license, but will be, if incorporated, released under the
  "release" license above.
}

\section{References}{
[1] H. Bengtsson, \emph{The R.oo package - Object-Oriented Programming with References Using Standard R Code}, In Kurt Hornik, Friedrich Leisch and Achim Zeileis, editors, Proceedings of the 3rd International Workshop on Distributed Statistical Computing (DSC 2003), March 20-22, Vienna, Austria. \url{http://www.ci.tuwien.ac.at/Conferences/DSC-2003/Proceedings/}
 \cr
}
\keyword{package}
