install.packages("fGarch")
install.packages("rugarch")

# ARCH
require(rugarch)
data(sp500ret)
# create a cluster object to be used as part of this demonstration
cluster = makePSOCKcluster(15)

plot(sp500ret$SP500RET)

