setMethodS3("getChecksum", "Object", function(object, ...) {
  object <- clearCache(object);
  NextMethod("getChecksum", object, ...);
})


############################################################################
# HISTORY:
# 2011-04-02
# o Added getChecksum() for the Object class.
# o Created.
############################################################################
