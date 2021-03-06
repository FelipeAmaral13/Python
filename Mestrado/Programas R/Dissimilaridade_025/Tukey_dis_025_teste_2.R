# Clear plots
if(!is.null(dev.list())) dev.off()
# Clean workspace
rm(list=ls())
# Clear console
cat("\014") 

# Packages
require(TukeyRegion)
require(MASS)


# Ler o arquivo txt do k-fold
#arq_tex <- read.table("C:\\Users\\megan\\Desktop\\Biblioteca Virtual\\Mestrado\\T?picos Aprendizado de M?quina\\fs4\\PerComiteOut.txt")
#print (head(arq_tex)) # ver o k-fold

# dat <- as.matrix(arq_tex)#, nrow = 9, ncol = 5) #Transformar o txt em matriz

X <- matrix(c(0.103888, 0.994589,  -0.097026,
              0.562069, 0.827091,  0.000000,
              0.991673, 0.128783,  0.226062,
              -0.238354, 0.971178,  0.000000,
              0.826477, 0.562970,  0.000000,
              0.470515, 0.882392,  -0.322005,
              0.989516, -0.144424,  0.097568,
              0.256205, 0.966622,  0.136622,
              0.463641, 0.886023,  0.272421,
              -0.081532, 0.996671,  -0.295880,
              0.391194, 0.920308,  0.841146,
              0.968302, 0.249784,  -0.097108,
              0.842192, 0.539177,  -0.518177,
              -0.263014, 0.964792,  -0.508743,
              0.721155, 0.692774,  -0.981705,
              0.999183, 0.040421,  -0.876170,
              0.490639, 0.871363,  -0.985390,
              0.862373, 0.506273,  0.349188,
              0.148703, 0.988882,  -0.589259,
              0.992189, -0.124744,  -0.319625,
              0.499944, 0.866058,  0.573959,
              0.696680, 0.717382,  0.314650,
              0.658764, 0.752349,  -0.658345,
              0.043695, 0.999045,  0.379394,
              0.381597, 0.924329,  1.689595,
              0.999574, 0.029199,  0.499294,
              0.731785, 0.681536,  -0.280928,
              0.894005, 0.448058,  -0.256748,
              -0.289993, 0.957029,  -1.232606,
              0.613116, 0.789993,  0.890775,
              0.006380, 0.999980,  0.820765,
              0.997673, 0.068176,  1.328287,
              0.854964, 0.518688,  1.010494,
              0.998737, 0.050237,  -0.509201,
              0.921226, 0.389028,  2.421890,
              0.738321, 0.674449,  0.614473,
              0.936200, 0.351468,  1.735238,
              0.903007, 0.429627,  -2.198873,
              0.990477, 0.137682,  0.939800,
              0.438202, 0.898876,  -0.569481,
              0.272823, 0.962064,  0.501153,
              0.977547, 0.210716,  -1.377757,
              0.214978, 0.976619,  -1.152528,
              0.670420, 0.741982,  2.121340,
              0.037155, 0.999310,  -0.819652,
              0.936684, 0.350176,  0.538605,
              0.845100, 0.534608,  -1.354891,
              0.931589, 0.363513,  0.150347,
              0.892734, 0.450583,  -0.972513,
              0.578815, 0.815459,  -2.259464,
              0.473004, 0.881060,  1.364722,
              0.715377, 0.698739,  1.855226,
              0.055243, 0.998473,  -1.508874,
              0.223488, 0.974707,  -0.332136,
              0.323754, 0.946141,  -0.794715,
              -0.449697, 0.893181,  -1.693194,
              -0.374952, 0.927044,  -0.749409,
              0.406556, 0.913626,  -1.644037,
              0.226573, 0.973994,  1.083228,
              0.836976, 0.547240,  1.314606,
              0.723440, 0.690387,  -2.965828,
              0.949637, 0.313352,  -0.647811,
              0.774972, 0.631996,  -1.887224,
              0.724296, 0.689489,  -1.520367,
              0.674768, 0.738030,  -1.249766,
              -0.175415, 0.984495,  0.249079,
              0.813581, 0.581452,  -0.768567,
              0.934759, 0.355283,  0.797174,
              0.440731, 0.897639,  2.117862,
              0.504792, 0.863241,  1.115632,
              0.949059, 0.315099,  2.137232,
              0.616060, 0.787699,  -2.507032,
              -0.145414, 0.989371,  -1.667953,
              -0.195061, 0.980791,  -0.943576,
              0.226390, 0.974037,  -1.982275,
              0.720361, 0.693599,  2.653558,
              -0.092443, 0.995718,  -2.207550,
              -0.034720, 0.999397,  -1.232050,
              0.953980, 0.299870,  1.464423,
              0.996792, 0.080038,  -1.151493,
              0.507787, 0.861483,  -1.960301,
              0.185185, 0.982704,  1.351446,
              0.467516, 0.883985,  -1.317317,
              -0.289167, 0.957279,  -1.895091,
              0.866614, 0.498979,  2.893868,
              0.946329, 0.323206,  1.139935,
              0.352032, 0.935988,  -0.107233,
              0.800557, 0.599257,  1.595873,
              -0.522375, 0.852716,  -1.405899,
              0.566006, 0.824401,  -3.176167,
              0.799563, 0.600583,  2.329696,
              0.865225, 0.501384,  1.964275,
              0.916531, 0.399964,  -1.927197,
              0.681182, 0.732114,  1.248156,
              -0.452616, 0.891706,  -1.022284,
              0.351762, 0.936090,  -2.518523,
              0.577815, 0.816168,  2.478050,
              0.145887, 0.989301,  -2.311170,
              0.978433, 0.206564,  -1.734565,
              0.503501, 0.863994,  -3.475594,
              0.374427, 0.927257,  -2.773029), nrow = 101, ncol = 3, byrow = TRUE)

# Computar e vizualizar a regiao de Tukey
Tr1 <- TukeyRegion(X, 1, method = "cmb", 
                   retFacets = TRUE, retVolume = TRUE, retBarycenter = TRUE)

plot(Tr1, colorFacets = "red", colorRidges = "red", 
     colorPoints = "blue", alpha = 0.35)

# print("O baricentro :")
# print (Tr1$barycenter)
# (Tr1$barycenter)
# #  media aritmetica
# T.mean <- colMeans(X)
# print("A media aritmetica :")
# print (T.mean)
# #  m?dia ponderada aparada de profundidade de Tukey (profundidade aproximada)
# T.approx1 <- depth.wm(X, 0.25)
# print ("A media ponderada : ")
# print (T.approx1)

# media ponderada aparada de profundidade de Tukey (profundidade exata)T.exact1 <- depth.wm(X, 0.25, exact = TRUE)
# T.exact1 <- depth.wm(X, 0.25, exact = TRUE)
# print ("A media ponderada aparada de profundidade de Tukey: ")
# print (T.exact1)

# a mediana de TukeyTm <- TukeyMedian(X)
Tm <- TukeyMedian(X, algMedian = "bsbarydepth", 
                  method = "bfs",trgFacets = TRUE, 
                  retHalfspaces = FALSE, retHalfspacesNR = FALSE,
                  retInnerPoint = FALSE, retVertices = TRUE, 
                  retFacets = TRUE,retVolume = FALSE, 
                  retBarycenter = TRUE, 
                  verbosity = 1)
print ("A mediana de Tukey : ")
print (Tm$barycenter)
# B <- summary(Tm$barycenter)



# library("scatterplot3d") 
# 
# scatterplot3d(X, y=NULL, z=NULL,  angle = 30)



