# This program basically takes input from the file 'core1.dat'.
# A sample core1.dat is shown - It should have 5 rows and any number of columsn
# The rows to be plotted can be selected using the 'sel' variable.

dat <- read.table("core1.dat", 
			header = TRUE, 
			row.names = "Matrix-Dimension", 
			check.names = FALSE);

png("core1.png" , width=2400 , height=1500 );

par(mar=c(14,12,3,5));

colors = c("LightBlue","DeepSkyBlue","SteelBlue","MediumBlue","MidnightBlue");

sel = c(2,3,4);

barplot(t(as.matrix(dat[,sel])), 
	beside = TRUE, 
	col = colors[sel] ,
        cex.axis=4.5,
	axes = FALSE,
	cex.names=4,
	line = 4,  
	ylim=c(0,45));

axis(2, cex.axis = 4.5);

title(ylab = "Time (secs)" , cex.lab=5 , line = 7 );

title(xlab = "Matrix Dimension" , cex.lab=5 , line = 11 );


legend("topleft", 
       names(dat[,sel]), 
       cex = 5.0, 
       bty = "n", 
       fill =  colors[sel] );

dev.off();

