##PACKAGES SOILTEXTURE#
install.packages("soiltexture")
library(soiltexture)
# Set a 2 by 2 plot matrix:
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2))
# Use this option to data for one sample
data <- data.frame("CLAY" = c(5),"SILT" = c(5),"SAND" = c(90))
# Use this option for a set of data 
data<- data.frame("CLAY" = c(05,60,15,05,25,05,25,45,65,75,13,47),
                    "SILT" = c(05,08,15,25,55,85,65,45,15,15,17,43),
                    "SAND" = c(90,32,70,70,20,10,10,10,20,10,70,10))
#Plot  - BRASIL: Lemos & Santos (1996)
TT.plot(class.sys = "BRASIL.TT", tri.data = data, main="Lemos & Santos (1996)", css.transf = TRUE,col = "red",pch = 19,class.line.col = "black",class.lab.col = "black",lwd.axis = 2,class.p.bg.col = c("gray"))
# Plot - BRASIL: SiBCS 2013 (EMBRAPA)
TT.plot(class.sys = "SiBCS13.TT", tri.data = data, main="SiBCS 2013 (EMBRAPA)", col = "red",pch = 19, class.line.col = "black",class.lab.col = "black",lwd.axis = 2,class.p.bg.col = c("gray"))
