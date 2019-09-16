#####SOILPHYSICS PACKAGE ########
install.packages("soilphysics")
# Package
library(soilphysics)
# Data of swc(w) and matric pot(h)
w <- c(0.5650, 0.4013, 0.2502, 0.2324, 0.2307, 0.1926, 0.1812, 0.1730)
h <- c(0.001, 50.65, 293.77, 790.14, 992.74, 5065, 10130, 15195)
#  van Genuchten Function
fitsoilwater(w, h)
# Function to calculate the soil water content based on the van Genuchten
# Soil water content for the potential 0,1 kPa
soilwater(x = 0.1, theta_R = 0.16761, theta_S = 0.56531, alpha = 0.04748, n = 1.52926)
# Function to determine the preconsolidation stress
# input data: stress and void ratio
pres <- c(1, 12.5, 25, 50, 100, 200, 400, 800, 1600)
VR <- c(1.43, 1.41, 1.40, 1.39, 1.35, 1.31, 1.25, 1.18, 1.12)
# plot sigmaP function Casagrande method
plot(VR ~ log10(pres), type = "b") # find the 'mcp'
sigmaP(VR, pres, method = "casagrande", mcp = 1.6, n4VCL = 2)


