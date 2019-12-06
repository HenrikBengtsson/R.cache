#########################################################################/**
# @RdocDefault getChecksum
#
# @title "Generates a deterministic checksum for an R object"
#
# \description{
#  @get "title" such that (i) if the same object is used again, then
#  the same checksum is obtained, and (ii) if another object is used,
#  then a different checksum is obtained with extremely high probability.
#  In other words, it is highly unlikely that two different objects
#  have the same checksum.
# }
#
# @synopsis
#
# \arguments{
#   \item{object}{The object for which a checksum should be calculated.}
#   \item{...}{Additional arguments passed to @see "digest::digest".}
# }
#
# \value{
#   Returns checksum represented as a @character string.
# }
#
# \details{
#   Because \code{getChecksum()} is a generic function,
#   it is possible to provide custom methods for specific
#   classes of objects.  This means that, if a certain class
#   specifies fields that carry auxiliary data, then these
#   can be excluded from the checksum calculation.
#   For instance, assume that all objects of class 'TimestampedObject'
#   contain timestamps specifying when each object was created.
#   Then a custom \code{getChecksum()} method for this class can
#   first drop the timestamp and then call the default
#   \code{getChecksum()} function.
# }
#
# @author
#
# \seealso{
#   Internally, the @see "digest::digest" method is used to calculate
#   the checksum.
# }
#
# @keyword "programming"
# @keyword "IO"
# @keyword "internal"
#*/#########################################################################
setMethodS3("getChecksum", "default", function(object, ...) {
  digest(object, ...)
})
