# ref: https://stackoverflow.com/questions/41031087/how-to-plot-multiple-group-means-and-the-confidence-intervals-in-ggplot2-r

library("ggplot2")

#initialize vector
res <- NULL

ic <- c (1, 153.5423, 160.1223, FALSE)

res <- rbind (1, res, ic)

for (i in 2:200){
    
    x <- rnorm(9, mean = 150, sd = 6)
    media <- mean (x)
    if (media - eps < 150 && 150 < media + eps){
        cruzou <- TRUE
    }
    else{
        cruzou <- FALSE
    }
    ic <- c (i, media - eps, media + eps, cruzou)
    res <- rbind (res, ic)
}

df <- data.frame (i = res[,1],x = res[,2], y = res[,3], cruzou = res[,4])

pd <- position_dodge(0.78)

ggplot(df, aes(x=i, y = 150, group=cruzou, color = cruzou)) +
      #draws the means
      geom_point(position=pd) +

      #draws the CI error bars
      geom_errorbar(data= df, aes(ymin=x, ymax=y, 
      color=cruzou), width=.1, position=pd)

