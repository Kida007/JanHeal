library(sp)
library(RColorBrewer)
ind2=readRDS("/Users/kartiksharma/Downloads/IND_adm2.rds")
hr2 = (ind2[ind2$NAME_1=="Haryana",])
hr2$NAME_2 = as.factor(hr2$NAME_2)
hr2$fake.data = runif(length(hr2$NAME_1))
col_no = as.factor(as.numeric(cut(hr2$fake.data, c(0,0.2,0.4,0.6,0.8,1))))
levels(col_no) = c("1-2","3-4","5-6","7-8","9-10")
hr2$col_no = col_no
myPalette = brewer.pal(5,"Greens")
spplot(hr2, "col_no", col=grey(.9), col.regions=myPalette,par.settings = list(axis.line = list(col =  'transparent')), main="Haryana")