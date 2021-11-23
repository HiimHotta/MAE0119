# ref: https://stackoverflow.com/questions/41031087/how-to-plot-multiple-group-means-and-the-confidence-intervals-in-ggplot2-r

library("ggplot2")

eps <- 0.09601

#initialize vector
res <- NULL

ic <- c (1, 0.41 - eps, 0.41 + eps, TRUE)

res <- rbind (1, res, ic)

for (i in 2:200){
    
    x <- rbinom(1, 100, 0.4)
    prop <- x / 100
    if (prop - eps < 0.4 && 0.4 < prop + eps){
        cruzou <- TRUE
    }
    else{
        cruzou <- FALSE
    }
    ic <- c (i, prop - eps, prop + eps, cruzou)
    res <- rbind (res, ic)
}

df <- data.frame (i = res[,1],x = res[,2], y = res[,3], cruzou = res[,4])

pd <- position_dodge(0.78)

ggplot(df, aes(x=i, y = 0.4, group=cruzou, color = cruzou)) +
      #draws the means
      geom_point(position=pd) +

      #draws the CI error bars
      geom_errorbar(data= df, aes(ymin=x, ymax=y, 
      color=cruzou), width=.1, position=pd)

