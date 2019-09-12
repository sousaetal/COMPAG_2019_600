###  HYDROME PACKAGE ###
install.packages("HydroMe")
library(HydroMe)
#  BROOK & COREY(1964) water retention model
# Data isric from the package- to Benin2
data(isric)
pf= subset(isric, Sample=="Benin2")
# Brook function
brook.ns=nlsLM(y~Brook(x,thr,ths,alp,nscal),data=pf, control=nls.lm.control(maxiter=200),
               start=c(thr=Dstart(pf)[1],ths=Dstart(pf)[2], alp=Dstart(pf)[3], nscal=Dstart(pf)[4]-1))
# A summary of modelling results
summary(brook.ns)
# RUSSO (1988) water retention model
# Data isric from the package- to Benin2
data(isric)
pf=subset(isric, Sample=="Benin2")
# Ruso function
ruso.ns=nlsLM(y~Ruso(x,thr,ths,alp,nscal),data=pf, control=nls.lm.control(maxiter=200),
              start=c(thr=Dstart(pf)[1],ths=Dstart(pf)[2], alp=Dstart(pf)[3], nscal=Dstart(pf)[4]))
coef(ruso.ns)
# A summary of modelling results
summary(ruso.ns)
# FREDLUND & XING(1994) water retention model
# Data isric from the package to Benin2
data(isric)
pf= subset(isric, Sample=="Benin2")
# ssfredlund function
fredlund.ns=nlsLM(y~SSfredlund(x,thr,ths,alp,nscal,mscal),data=pf,
                  control=nls.lm.control(maxiter=200,options(warn=-1)))
coef(fredlund.ns)
# A summary of modelling results
summary(fredlund.ns)
# GARDNER(1958)  water retention model
# Data isric from the package
data(isric)
isric1=isric[1:32,]
# ssgardner fuction
gardner=nlsLM(y~SSgardner(x,thr,ths,alp,nscal), isric1)
coef(gardner)
# A summary of modelling results
summary(gardner)
# KOSUGI(1996) water retention model
# Data isric from the package
data(isric)
# sskosugi fuction
kosugi.ns=nlsLM(y~SSkosugi(x,thr,ths,alp,nscal),data=subset(isric, Sample=="Italy7"),
                control=nls.lm.control(maxiter=200,options(warn=-1)))
# A summary of modelling results
summary(kosugi.ns)
# OMUTO(2009) water retention model
# Data isric from the package
data(isric)
isric1=isric[1:32,]
# ssomuto function
omuto=nlsList(y~SSomuto(x,ths1,alp1,ths2,alp2)|Sample, isric1)
omuto.nlme=nlme(omuto)## for fitting mixed-effects models
# A summary of modelling results
summary(omuto.nlme)
# TANI(1982) water retention model
# Data isric from the package to Benin2
data(isric)
pf=subset(isric, Sample=="Benin2")
# Tani function
tani.ns=nlsLM(y~Tani(x,thr,ths,alp),data=pf, control=nls.lm.control(maxiter=200),
              start=c(thr=Dstart(pf)[1],ths=Dstart(pf)[2], alp=Dstart(pf)[3]))
coef(tani.ns)
# A summary of modelling results
summary(tani.ns)
# GREEN & AMPT(1911) water infiltration model
# Data infilt from the package
data(infilt)
# SSgampt function
gamp.ns=nlsLM(Cumrate~SSgampt(Rate,ks,A), infilt)
# A summary of modelling results
summary(gamp.ns)
# HORTON(1994) water infiltration model
# Data infilt from the package
data(infilt)
infil=infilt[319:751,]
# sshorton function
hort.lis=nlsList(log(Rate)~SShorton(Time,fc,f0,lrk)|PlotNo, infil)#Rate is the y variable
# A summary of modelling results
summary(hort.lis)
# PHILIP(1957) water infiltration model
# Data infilt from the package
data(infilt)
# ssphilip function
philip.nis=nlsList(log(Rate)~SSphilip(Time,fc,S)|PlotNo, data=infilt)
coef(philip.nis)
# A summary of modelling results
summary(philip.nis)
#
