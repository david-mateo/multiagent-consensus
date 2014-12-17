function dx = displacement(x)
	xm = mean(x) ;
	dx = x - xm;
	dx /= sqrt( mean(dx.*dx) ) ;
	end
