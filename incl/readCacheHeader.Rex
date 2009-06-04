
data <- 1:120
key <- list(some=1, vari=2, ables=3)

saveCache(key=key, data, comment="A simple example of a cached object.")

header <- readCacheHeader(findCache(key=key))
print(header)

# Clean up
file.remove(findCache(key=key))
