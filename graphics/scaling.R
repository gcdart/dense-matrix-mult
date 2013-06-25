dat <- read.table("scaling.data", header = TRUE, check.names = FALSE);

png("scaling.png" , width=2400 , height=1500 );

par(mar=c(14,12,3,5));

xlabels = seq(1,nrow(dat));

plot(xlabels,dat[,1],
	type="l",
	log="y",
	axes = FALSE , 
	cex.axis = 4.5 , 
	cex.names = 4 , 
	xlab="" , 
	ylab = "",
	col="DeepSkyBlue", 
	ylim=c(.80,40),
	lw=6);

lines(xlabels,dat[,2],type="l",col="SteelBlue",lw=6);

lines(xlabels,dat[,3],type="l",col="MediumBlue",lw=6);

axis(2, cex.axis = 4.5 , pos = 0, at=c(0,1,2,5,10,20,40) , lwd=4);

axis(1, cex.axis = 4.5 , at=c(1,10,20,30,40,48,50) , lwd=4 , padj=2 );

title(ylab = "Time (secs)" , cex.lab=5 , line = 7 );

title(xlab = "# Cores" , cex.lab=5 , line = 11 );

legend("topright", 
       names(dat), 
       cex = 5.0, 
       bty = "n", 
       fill =  c("DeepSkyBlue","SteelBlue","MediumBlue"));
