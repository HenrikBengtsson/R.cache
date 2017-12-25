setMethodS3("getChecksum", "Object", function(object, ...) {
  object <- clearCache(object);
  NextMethod("getChecksum", object=object);
}, export=FALSE)
