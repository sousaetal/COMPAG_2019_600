## SOILWATER PACKAGES ##
install.packages("soilwater")
library(soilwater)
# Data from the package manual
soiltype <- c("sand","silty-sand","loam","clay")
theta_sat <- c(0.44,0.39,0.51,0.48)
theta_res <- c(0.02,0.155,0.04,0.10)
alpha <- c(13.8,6.88,9.0,2.7) # 1/meters
n <- c(2.09,1.881,1.42,1.29)
m <- 1-1/n
v <- array(0.5,length(soiltype))
ks <- c(1.5e-1,1e-4*3600,3.3e-2,4.1e-4)/3600 # meters/seconds
psi <- -(1:2000)/1000
D <- as.data.frame(array(0.1,c(length(psi),length(soiltype))))
names(D) <- soiltype
# diffusivity function - Soil Water (Hydraulic) Diffusivity
for (it in names(D)) {
  i=which(names(D)==it)
  D[,i] <- diffusivity(psi=psi,
                       v=v[i],ksat=ks[i],alpha=alpha[i],
                       n=n[i],m=m[i],theta_sat=theta_sat[i],
                       theta_res=theta_res[i])
}
# plot diffusivity on log scale
lty <- 1:length(names(D) )
plot(psi,D[,1],lty=lty[1],main="Diffusvity vs psi",xlab="psi [m]",
     ylab="D [m^2/s]",type="l",ylim=range(D),ylog=TRUE)
for (i in 2:ncol(D)) {
  lines(psi,D[,i],lty=lty[i])
}
legend("topleft",lty=lty,legend=names(D))
Dinv <- 1/D
# plot diffusivity on log scale
lty <- 1:length(names(D) )
plot(psi,Dinv[,1],lty=lty[1],main="1/Diffusvity vs psi",
     xlab="psi [m]",ylab="1/D [s/m^2]",type="l",ylim=range(Dinv),ylog=TRUE)
for (i in 2:ncol(Dinv)) {
  lines(psi,Dinv[,i],lty=lty[i])
}
legend("topright",lty=lty,legend=names(D))
# unitResponse function. The water table recharge: the response unit
t <- seq(0,2,by=0.001)
d <- c(1,0.75,0.5,0.25)
val1 <- unitResponse(t, d = d[1], D = 1, H = 1, m = 500)
val2 <- unitResponse(t, d = d[2], D = 1, H = 1, m = 500)
val3 <- unitResponse(t, d = d[3], D = 1, H = 1, m = 500)
val4 <- unitResponse(t, d = d[4], D = 1, H = 1, m = 500)
