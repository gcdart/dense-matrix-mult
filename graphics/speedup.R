dat <- read.table("scaling.data", header = TRUE, check.names = FALSE);

png("speedup.png" , width=2400 , height=1500 );

par(mar=c(14,12,3,5));

xlabels = seq(1,nrow(dat));

plot(xlabels,dat[1,1]/dat[,1],
	type="l",
	axes = FALSE , 
	cex.axis = 4.5 , 
	cex.names = 4 , 
	xlab="" , 
	ylab = "",
	col="DeepSkyBlue", 
	ylim=c(.80,50),
	lw=6);

lines(xlabels,dat[1,2]/dat[,2],type="l",col="SteelBlue",lw=6);

lines(xlabels,dat[1,3]/dat[,3],type="l",col="MediumBlue",lw=6);

lines(xlabels,xlabels,pty="C",type="b",col="darkred",lw=3,cex=2,lty=2);

axis(2, cex.axis = 4.5 , pos = 0, at=c(1,8,16,24,32,40,48,50) , lwd=4);

axis(1, cex.axis = 4.5 , at=c(1,8,16,24,32,40,48,50) , lwd=4 , padj=2 );

title(ylab = "Speed Up" , cex.lab=5 , line = 7 );

title(xlab = "# Cores" , cex.lab=5 , line = 11 );

legend("topleft", 
       names(dat), 
       cex = 5.0, 
       bty = "n", 
       inset=.01,
       fill =  c("DeepSkyBlue","SteelBlue","MediumBlue"));
