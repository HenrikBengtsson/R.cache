library("R.cache")

ans <- R.cache:::.textPrompt("Do you have a minute?", type="message")
print(ans)

ans <- R.cache:::.textPrompt("Do you have a minute?", type="output")
print(ans)


