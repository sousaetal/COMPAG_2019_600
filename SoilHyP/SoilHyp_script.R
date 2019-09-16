## SOILHYP PACKAGE ##
install.packages("SoilHyP")
library(SoilHyP)
#  Data dataSHP from the package manual
data('dataSHP')
# fitSHP function-Soil Hydraulic Properties
ans <- fitSHP(obs         = list(th = dataSHP$th, K = dataSHP$Ku),
              suc          = list(th = dataSHP$suc, K = dataSHP$suc),
              FUN.shp      = 'vg',
              modality     = 'uni',
              par.shp      =  NULL,
              fit          = 'both',
              weighting    = 'var',
              log          = c('alfa', 'n', 'ks'),
              control      = list(ncomplex = 15, reltol = 1e-07,tolsteps = 7),
              suc.negativ  = TRUE,
              integral     = FALSE,
              L            = 0,
              print.info   = TRUE
)
ans$par
# plot  results
plot(ans)
# fitSHP function to bimodal van Genuchten-Mualem model
ans <- fitSHP(obs         = list(th = dataSHP$th, K = dataSHP$Ku),
              suc          = list(th = dataSHP$suc, K = dataSHP$suc),
              FUN.shp      = 'vg',
              modality     = 'bi',
              par.shp      =  c(),
              fit          = 'both',
              weighting    = 'var',
              log          = c('alfa', 'n', 'ks', 'alfa2', 'n2'),
              suc.negativ  = TRUE,
              integral     = FALSE,
              L            = 0,
              print.info   = TRUE,
              control      = list(ncomplex = 15, reltol = 1e-07,tolsteps = 7)
)
ans$par
# plot  output
plot(ans)
# unimodal van Genuchten model
Ku(suc = seq(1, 1000, by = 1), FUN.shp = 'vGM',
   par.shp = list(Ks = 10, ths = 0.5, thr = 0, alfa = 0.02, n = 1.5, tau = 0.5),
   modality = 'uni', suc.negativ = FALSE)
# bimodal van Genuchten model
Ku(suc = seq(1, 1000, by = 1), FUN.shp = 'vGM',
   par.shp = list(Ks = 10, ths = 0.5, thr = 0, alfa = 0.02,
                  n = 1.5, tau = 0.5, w2 = 0.1, alfa2 = 0.1, n2 = 3),
   modality = 'bi', suc.negativ = FALSE)
# unimodal Peters-Durner-Iden model
Ku(suc = seq(1, 1000, by = 1), FUN.shp = 'PDI', modality = 'uni',
   par.shp = list(Ks = 10, ths = 0.5, thr = 0, alfa = 0.02, n = 1.5, tau = 0.5, omega = 0.001),
   suc.negativ = FALSE)
# Brooks and Corey  model (only unimodal)
Ku(suc = seq(1, 1000, by = 1), FUN.shp = 'bc', modality = 'uni',
   par.shp = list(ths = 0.4, thr = 0, lambda = 0.211, alfa = 0.1, tau = 0.5, ks = 10),
   suc.negativ = FALSE)



