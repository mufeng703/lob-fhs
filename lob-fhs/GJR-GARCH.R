install.packages("fGarch")
install.packages("rugarch")

# ARCH
require(rugarch)
data(sp500ret)
# create a cluster object to be used as part of this demonstration
cluster = makePSOCKcluster(15)

# start with default GARCH spec.
spec = ugarchspec() #the empty function specifies the default model. 
print(spec)

#spec is a basic ARIMA(1,1),GARCH(1,1) model.
#use data to fit it
def.fit = ugarchfit(spec = spec, data = sp500ret)
print(def.fit)
