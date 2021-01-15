#install.packages("fGarch")
#install.packages("rugarch")
#install.packages("forecast")

# ARCH
library(rugarch)
library(forecast)

data(sp500ret)
# create a cluster object to be used as part of this demonstration
cluster = makePSOCKcluster(15)

#ARIMA
fit=Arima(sp500ret,order=c(1,1,1),seasonal=list(order=c(0,1,1),period=12))
fit

# start with default GARCH spec.
spec = ugarchspec() #the empty function specifies the default model. 
print(spec)

#spec is a basic ARIMA(1,1),GARCH(1,1) model.
#use data to fit it
def.fit = ugarchfit(spec = spec, data = sp500ret)
print(def.fit)

#try GARCH(2, 1)
spec=ugarchspec(variance.model = list(model="sGARCH",garchOrder = c(2, 1))) 
def.fit1= ugarchfit(spec = spec, data = sp500ret)
print(def.fit1)

#apARCH
spec=ugarchspec(variance.model = list(model="apARCH")) 
def.fit2= ugarchfit(spec = spec, data = sp500ret)
print(def.fit2)

#forecasting with bootstrap
bootp=ugarchboot(def.fit2,method=c("Partial","Full")[1],n.ahead = 12,n.bootpred=1000,n.bootfit=1000)
bootp
#The output above shows the 12 step ahead forecasts for both series and variances.

plot(bootp, which=2)

# compare the performance of apARCH model with SARIMA model fitted at the beginning of the class.
# Since the output of bootstrap forecasting methods is S4 class, we need to use “@” sign to take subset.
s_f=bootp@forc@forecast$seriesFor #this is for series forecasts
s_f
s_f1=as.vector(s_f) #for comparison, we make the forecasts as vector

v_f=bootp@forc@forecast$sigmaFor#this is for variance forecasts
v_f

#After this, obtain forecast values from the SARIMA model.
f=forecast(fit,h=12)
f$mean
accuracy(f["mean"],sp500ret)
f["mean"]

accuracy(s_f1,sp500ret)
